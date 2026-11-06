/************************************************************
 sp-query-r.sql  K-System(FlexAPI) R조회 SP 뼈대 (MS SQL)
 무엇: 조건을 #BIZ_IN_DataBlock1 에서 읽고, SP 마지막 SELECT 로 결과를 돌려준다.
 서비스 설정: [서비스 종류] ksystem, [모듈명] FlexAPI, [SP List] <SP이름>,
             [TempTable to CREATE in SQL script] BIZ_IN/OUT_DataBlock  (None 이면 조건이 넘어오지 않는다)
             [TempTable to SELECT in SQL script] None, [공통 트랜잭션 사용] 켬
 이벤트: [보내는 데이터] 1 = 조건 카테고리, [사용자 데이터] CompanySeq, LanguageSeq, UserSeq
         [받는 데이터] 1 = 결과 카테고리, [덮어쓰기]  (결과 행은 새 _SUID 를 받으므로 [병합]에 맞지 않는다)
 쓰는 법:
   1. <꺾쇠> 값을 모두 바꾼다. AS 별칭은 화면 컬렉션 키와 대소문자까지 같게 쓴다.
   2. SP 가 읽는 조건 키는 [Etc] 탭 Collections 에 타입과 함께 등록한다.
      결과 키는 SP 의 SELECT 결과로 돌아가므로 등록하지 않아도 된다.
   3. 결과에 _SUID 를 넣지 않는다. 플랫폼이 행마다 발급한다.
   4. SQL Server 2016 SP1 미만이면 CREATE OR ALTER 를 CREATE PROC / ALTER PROC 로 바꾼다.
 하지 않는 것: 임시 테이블 CREATE·DROP, BEGIN TRAN, ISOLATION LEVEL 변경
************************************************************/
CREATE OR ALTER PROC <SP이름>
    @WorkingTag   NVARCHAR(10) = '',
    @CompanySeq   INT          = 1,
    @LanguageSeq  INT          = 1,
    @UserSeq      INT          = 0
AS
    SET NOCOUNT ON

    /* 1) 조건 읽기 */
    DECLARE @<문자조건>  NVARCHAR(<길이>) = ''
          , @<숫자조건>  INT              = 0

    SELECT TOP 1
           @<문자조건> = ISNULL(<문자조건>, '')
         , @<숫자조건> = ISNULL(<숫자조건>, 0)
      FROM #BIZ_IN_DataBlock1

    /* 2) (선택) 조건 오류를 화면에 알리려면 #BIZ_OUT 의 입력 행에 Status·Result 를 남기고 끝낸다.
          [확인 필요] R조회에서 이 오류 문구가 화면에 뜨는지는 실제 앱에서 한 번 시험한 뒤 쓴다 */
    IF @<숫자조건> < 0
    BEGIN
        UPDATE #BIZ_OUT_DataBlock1
           SET Status = 1, Result = N'<오류 안내 문구>'
        RETURN
    END

    /* 3) 결과 돌려주기. 별칭 = 컬렉션 키 */
    SELECT A.<컬럼1> AS <결과키1>
         , A.<컬럼2> AS <결과키2>
         , ISNULL(B.<컬럼3>, N'') AS <결과키3>
      FROM <테이블>      AS A WITH(NOLOCK)
      LEFT JOIN <테이블2> AS B WITH(NOLOCK) ON B.CompanySeq = A.CompanySeq AND B.<연결키> = A.<연결키>
     WHERE A.CompanySeq = @CompanySeq
       AND (@<문자조건> = '' OR A.<문자컬럼> LIKE @<문자조건> + N'%')
       AND (@<숫자조건> =  0 OR A.<숫자컬럼>  = @<숫자조건>)
     ORDER BY A.<정렬컬럼>

    RETURN
GO
