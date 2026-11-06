/************************************************************
 sp-save.sql  K-System(FlexAPI) 저장 SP 뼈대 (MS SQL)
 무엇: #BIZ_IN_DataBlock1 의 행을 WorkingTag(A 추가, U 수정, D 삭제)로 갈라 테이블에 쓴다.
       실행 전 #BIZ_OUT_DataBlock1 에는 입력 행이 그대로 복사돼 있다. 이 SP 는 그 행을 읽고, 검사 결과와 새 키를 그 행에 UPDATE 한다.
 서비스 설정: [서비스 종류] ksystem, [모듈명] FlexAPI, [SP List] <SP이름>,
             [TempTable to CREATE in SQL script] BIZ_IN/OUT_DataBlock,
             [TempTable to SELECT in SQL script] BIZ_IN/OUT_DataBlock, [공통 트랜잭션 사용] 켬
 이벤트: [보내는 데이터] 1 = 입력 카테고리, [필터설정] 상태 added·updated·deleted 처럼 바뀐 행만,
         [사용자 데이터] CompanySeq, LanguageSeq, UserSeq
         [받는 데이터] 1 = 같은 카테고리, [병합]  (_SUID 가 유지돼 화면 행이 새 키를 받는다)
 쓰는 법:
   1. <꺾쇠> 값을 모두 바꾼다. 읽는 키는 [Etc] 탭 Collections 에 타입과 함께 등록한다.
      새 키를 돌려줄 <키Seq> 도 int 로 등록한다. 새 행만 보내면 값이 비어 컬럼이 생기지 않는다.
   2. 스크립트로 만든 새 행은 호출 전에 setStatus('added') 를 불러야 A 로 온다(안 부르면 U).
   3. 오류는 해당 행에 Status(0 이 아닌 INT) 와 Result(255자 안) 를 남기고 RETURN 한다. 공통 트랜잭션이 전체를 되돌린다.
   4. 검사를 모두 끝낸 뒤에만 테이블에 쓴다.
   5. 키 채번은 예시처럼 MAX+1 을 잠금과 함께 쓴다. 회사 표준 채번 방식이 있으면 그것으로 바꾼다.
   6. RegUserSeq, RegDateTime, LastUserSeq, LastDateTime 은 예시 이력 컬럼이다. 테이블에 없으면 지운다.
   7. D 행은 없는 행이어도 오류로 보지 않는다. 추가했다가 바로 삭제 표시한 행도 D 로 오기 때문이다.
 하지 않는 것: 임시 테이블 CREATE·DROP, BEGIN TRAN, 마지막 SELECT, 파라미터 @WorkingTag 로 분기
************************************************************/
CREATE OR ALTER PROC <SP이름>
    @WorkingTag   NVARCHAR(10) = '',    -- 보통 빈 값으로 온다. 분기는 행의 WorkingTag 컬럼으로 한다
    @CompanySeq   INT          = 1,
    @LanguageSeq  INT          = 1,
    @UserSeq      INT          = 0
AS
    SET NOCOUNT ON

    DECLARE @MaxSeq INT

    /*==== 1. 검사: 문제 있는 행에 Status·Result 를 남긴다 ====*/
    UPDATE B
       SET Status = CASE
               WHEN ISNULL(B.WorkingTag, N'') NOT IN (N'A', N'U', N'D') THEN 100
               WHEN B.WorkingTag = N'U'
                    AND NOT EXISTS (SELECT 1 FROM <테이블> AS T WITH(NOLOCK)
                                     WHERE T.CompanySeq = @CompanySeq AND T.<키Seq> = B.<키Seq>) THEN 101
               WHEN B.WorkingTag IN (N'A', N'U') AND ISNULL(B.<필수키>, N'') = N'' THEN 102
               ELSE 0 END
      FROM #BIZ_OUT_DataBlock1 AS B
     WHERE NOT (ISNULL(B.WorkingTag, N'') <> N'A' AND ISNULL(B.<키Seq>, 0) = 0)   -- 보낼 행이 없을 때 오는 빈 행은 건너뛴다

    UPDATE #BIZ_OUT_DataBlock1
       SET Result = CASE Status
               WHEN 100 THEN N'WorkingTag 는 A, U, D 중 하나여야 합니다.'
               WHEN 101 THEN N'저장된 행을 찾을 수 없습니다. 다시 조회한 뒤 저장하세요.'
               WHEN 102 THEN N'<필수 항목 이름>을 입력하세요.'
               END
     WHERE ISNULL(Status, 0) <> 0

    IF EXISTS (SELECT 1 FROM #BIZ_OUT_DataBlock1 WHERE ISNULL(Status, 0) <> 0)
        RETURN

    /*==== 2. 쓰기: D → U → A 순서 ====*/
    DELETE T
      FROM <테이블>            AS T
      JOIN #BIZ_OUT_DataBlock1 AS B ON B.<키Seq> = T.<키Seq>
     WHERE T.CompanySeq = @CompanySeq
       AND B.WorkingTag = N'D'
    IF @@ERROR <> 0 RETURN

    UPDATE T
       SET <컬럼1>        = B.<키1>
         , <컬럼2>        = B.<키2>
         , LastUserSeq    = @UserSeq
         , LastDateTime   = GETDATE()
      FROM <테이블>            AS T
      JOIN #BIZ_OUT_DataBlock1 AS B ON B.<키Seq> = T.<키Seq>
     WHERE T.CompanySeq = @CompanySeq
       AND B.WorkingTag = N'U'
    IF @@ERROR <> 0 RETURN

    /* 새 행 키 채번. 잠금으로 두 사람이 같은 번호를 받지 않게 한다 */
    SELECT @MaxSeq = ISNULL(MAX(<키Seq>), 0)
      FROM <테이블> WITH(UPDLOCK, HOLDLOCK)
     WHERE CompanySeq = @CompanySeq

    ;WITH NewRow AS
    (
        SELECT <키Seq>, ROW_NUMBER() OVER (ORDER BY IDX_NO, DataSeq) AS RN
          FROM #BIZ_OUT_DataBlock1
         WHERE WorkingTag = N'A'
    )
    UPDATE NewRow SET <키Seq> = @MaxSeq + RN     -- 새 키를 #BIZ_OUT 행에 남겨 [병합]으로 화면에 돌려준다

    INSERT INTO <테이블>
        ( CompanySeq, <키Seq>, <컬럼1>, <컬럼2>
        , RegUserSeq, RegDateTime, LastUserSeq, LastDateTime )
    SELECT @CompanySeq, B.<키Seq>, B.<키1>, B.<키2>
         , @UserSeq, GETDATE(), @UserSeq, GETDATE()
      FROM #BIZ_OUT_DataBlock1 AS B
     WHERE B.WorkingTag = N'A'
    IF @@ERROR <> 0 RETURN

    RETURN
GO
