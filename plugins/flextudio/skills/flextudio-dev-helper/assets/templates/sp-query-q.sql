/************************************************************
 sp-query-q.sql  K-System(FlexAPI) Q조회 SP 뼈대 (MS SQL)
 무엇: 조건을 #BIZ_IN_DataBlock1 에서 읽고 결과를 #BIZ_OUT_DataBlock1 에 넣는다. SP 는 마지막 SELECT 를 하지 않는다.
 서비스 설정: [서비스 종류] ksystem, [모듈명] FlexAPI, [SP List] <SP이름>,
             [TempTable to CREATE in SQL script] BIZ_IN/OUT_DataBlock,
             [TempTable to SELECT in SQL script] BIZ_IN/OUT_DataBlock, [공통 트랜잭션 사용] 켬
 이벤트: [보내는 데이터] 1 = 조건 카테고리, [사용자 데이터] CompanySeq, LanguageSeq, UserSeq
         [받는 데이터] 1 = 결과 카테고리, [덮어쓰기]
 쓰는 법:
   1. <꺾쇠> 값을 모두 바꾼다. 조건 키와 결과 키는 화면 컬렉션 키와 대소문자까지 같게 쓴다.
   2. SP 가 읽는 조건 키와 SP 가 돌려줄 결과 키(<결과키1> 등)를 모두 [Etc] 탭 Collections 에 타입과 함께 등록한다.
      #BIZ_OUT 은 #BIZ_IN 과 같은 컬럼으로 만들어진다. 등록하지 않은 결과 키에 INSERT 하면 Invalid column name 오류가 난다.
      값이 비어 보내지 않은 조건 키도 등록해 두어야 컬럼이 생긴다.
   3. 조건이 더 있으면 DECLARE, SELECT, WHERE 세 곳에 같은 모양으로 한 줄씩 더한다.
   4. SQL Server 2016 SP1 미만이면 CREATE OR ALTER 를 CREATE PROC(처음) / ALTER PROC(고칠 때)로 바꾼다.
 하지 않는 것: 임시 테이블 CREATE·DROP, BEGIN TRAN, ISOLATION LEVEL 변경, 마지막 SELECT
************************************************************/
CREATE OR ALTER PROC <SP이름>
    @WorkingTag   NVARCHAR(10) = '',    -- FlexAPI 가 항상 넘기는 4개. 조회에서는 쓰지 않지만 지우지 않는다
    @CompanySeq   INT          = 1,
    @LanguageSeq  INT          = 1,
    @UserSeq      INT          = 0
AS
    SET NOCOUNT ON

    /* 1) 조건 읽기. 빈 값은 '' 또는 0 으로 바꿔 "조건 없음"으로 처리한다 */
    DECLARE @<문자조건>  NVARCHAR(<길이>) = ''
          , @<날짜From>  NCHAR(8)         = ''
          , @<날짜To>    NCHAR(8)         = ''
          , @<숫자조건>  INT              = 0

    SELECT TOP 1
           @<문자조건> = ISNULL(<문자조건>, '')
         , @<날짜From> = ISNULL(<날짜From>, '')
         , @<날짜To>   = ISNULL(<날짜To>, '')
         , @<숫자조건> = ISNULL(<숫자조건>, 0)
      FROM #BIZ_IN_DataBlock1

    /* 2) #BIZ_OUT 에 복사돼 있는 입력 행을 지운다. 안 지우면 조건 행이 결과에 섞인다 */
    DELETE FROM #BIZ_OUT_DataBlock1

    /* 3) 결과 넣기. 앞 9개 컬럼은 플랫폼 관리 컬럼, _SUID 는 행마다 새 값 */
    INSERT INTO #BIZ_OUT_DataBlock1
        ( WorkingTag, IDX_NO, DataSeq, Selected, MessageType, Status, Result, ROW_IDX, TABLE_NAME, _SUID
        , <결과키1>, <결과키2>, <결과키3> )
    SELECT N'U', 1, 1, 0, 0, 0, NULL
         , ROW_NUMBER() OVER (ORDER BY A.<정렬컬럼>)     -- ROW_IDX: 화면에 보일 순서
         , N'DataBlock1'
         , CONVERT(NVARCHAR(50), NEWID())                -- _SUID: 비우면 화면에 0행으로 보인다
         , A.<컬럼1> AS <결과키1>
         , A.<컬럼2> AS <결과키2>
         , ISNULL(B.<컬럼3>, N'') AS <결과키3>
      FROM <테이블>      AS A WITH(NOLOCK)
      LEFT JOIN <테이블2> AS B WITH(NOLOCK) ON B.CompanySeq = A.CompanySeq AND B.<연결키> = A.<연결키>
     WHERE A.CompanySeq = @CompanySeq
       AND (@<문자조건> = '' OR A.<문자컬럼> LIKE @<문자조건> + N'%')
       AND (@<날짜From> = '' OR A.<날짜컬럼> >= @<날짜From>)
       AND (@<날짜To>   = '' OR A.<날짜컬럼> <= @<날짜To>)
       AND (@<숫자조건> =  0 OR A.<숫자컬럼>  = @<숫자조건>)

    RETURN
GO
