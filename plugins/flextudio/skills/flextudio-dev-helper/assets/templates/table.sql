/************************************************************
 table.sql  K-System(FlexAPI) 업무 테이블 뼈대 (MS SQL)
 무엇: SP 가 읽고 쓰는 업무 테이블을 만든다. 회사 구분 CompanySeq 를 PK 맨 앞에 두고, 등록자와 최종 수정자 이력 컬럼을 둔다.
 어디서: sp-query-q.sql, sp-query-r.sql, sp-save.sql 의 <테이블> 자리에 이 테이블 이름을 넣는다.
 쓰는 법:
   1. <꺾쇠> 값을 모두 바꾼다. <접두어> 는 회사가 정한 사이트 테이블 접두어(예: EDU)다.
   2. SP 를 만들 DB 와 같은 DB 에서 실행한다. 어느 DB 인지는 ERP 담당자에게 먼저 확인한다.
   3. 다시 실행해도 된다. 테이블이 이미 있으면 만들지 않고 건너뛴다.
   4. 개발 중 구조를 바꿔 다시 만들 때만 아래 "다시 만들기" 두 줄의 주석을 푼다. 데이터가 모두 지워진다.
   5. 컬럼 타입 관례: 번호 키 <이름>Seq 는 INT, 코드 <이름>Cd 는 NCHAR, 문서 번호와 ID 는 NVARCHAR.
   6. 화면 컬렉션 키와 같은 이름으로 지으면 SP 에서 AS 별칭을 줄일 수 있다.
      Status, Result, Message, Selected, DataSeq, IDX_NO, ROW_IDX, WorkingTag, TABLE_NAME 은 쓰지 않는다.
   7. 화면의 _SUID 는 화면 메모리용 임시 키라 컬럼으로 만들지 않는다.
   8. 새 번호는 sp-save.sql 처럼 SP 에서 MAX+1 을 잠금과 함께 채번한다. 회사 표준 채번 방식이 있으면 그것을 쓴다.
 막히면: CREATE TABLE 이 권한 오류(297 등)로 막히면 우회하지 말고 ERP DB 관리자에게 테이블 생성을 요청한다.
 하지 않는 것: 다른 회사 데이터가 섞이는 CompanySeq 없는 PK, 화면 상태 컬럼(WorkingTag 등) 저장
************************************************************/

/* 다시 만들기 (개발 중에만, 데이터가 모두 지워진다)
IF OBJECT_ID(N'dbo.<접두어>_<테이블>', N'U') IS NOT NULL
    DROP TABLE dbo.<접두어>_<테이블>
*/

IF OBJECT_ID(N'dbo.<접두어>_<테이블>', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.<접두어>_<테이블>
    (
        CompanySeq      INT             NOT NULL                -- 회사. 모든 조회와 저장 조건의 첫 번째 키
      , <키Seq>         INT             NOT NULL                -- 업무 번호 키. SP 에서 채번한다
      , <코드Cd>        NCHAR(<길이>)   NOT NULL DEFAULT N''    -- 코드 값. 앞자리 0 이 있으면 문자 타입으로 둔다
      , <이름>          NVARCHAR(<길이>) NOT NULL DEFAULT N''
      , <수량>          DECIMAL(19,5)   NOT NULL DEFAULT 0      -- 화면에서 double 로 등록하면 같은 타입으로 온다
      , <날짜>          NCHAR(8)        NOT NULL DEFAULT N''    -- YYYYMMDD
      , UseYN           NCHAR(1)        NOT NULL DEFAULT N'Y'   -- 사용 여부(Y, N). Status 라는 이름은 쓰지 않는다
      , Remark          NVARCHAR(500)   NOT NULL DEFAULT N''
      , RegUserSeq      INT             NOT NULL DEFAULT 0      -- 등록자. SP 의 @UserSeq
      , RegDateTime     DATETIME        NOT NULL DEFAULT GETDATE()
      , LastUserSeq     INT             NOT NULL DEFAULT 0      -- 최종 수정자. SP 의 @UserSeq
      , LastDateTime    DATETIME        NOT NULL DEFAULT GETDATE()
      , CONSTRAINT PK_<접두어>_<테이블> PRIMARY KEY CLUSTERED (CompanySeq, <키Seq>)
    )
END
GO

/* 확인: 컬럼과 PK 를 본다 */
EXEC sp_help N'dbo.<접두어>_<테이블>'
GO
