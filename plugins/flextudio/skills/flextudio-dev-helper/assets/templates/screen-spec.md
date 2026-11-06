# 화면 정의 양식
이 파일이 답하는 질문: 화면을 만들기 전에 무엇을 정해 두나 / 카테고리, 컬렉션 키, 서비스, SP 이름을 어떻게 맞추나 / AI 에게 화면 구현을 물을 때 무엇을 함께 주나

목차: 쓰는 방법 / 1. 앱 정보 / 2. 화면 목록 / 3. 카테고리 / 4. 컬렉션 키 계약 / 5. 서비스 / 6. 서비스별 보내는 데이터와 받는 데이터 / 7. 이벤트 배선 / 8. SP 이름 계약 / 9. 확인 목록

## 쓰는 방법

1. Studio 에서 화면을 만들기 전에 이 양식을 채우세요.
2. 표의 예시 행(거래처 예)을 지우고 실제 값으로 바꾸세요.
3. 이름이 정해지면 SP, 서비스, 화면에서 그 이름만 쓰세요.
4. AI 에게 구현 방법을 물을 때 이 양식을 함께 붙여 넣으세요.

바꿀 값은 `<꺾쇠>` 로 표시했습니다.
이름 규칙은 팀 규칙 문서가 있으면 그것을 따르세요.
아래 이름은 예시입니다.

## 1. 앱 정보

| 항목 | 넣을 값 | 예 |
|---|---|---|
| 앱 이름 | `<앱 이름>` | 거래처 관리 |
| 앱 종류 | 초대기반앱 또는 공개앱 | 초대기반앱 |
| 데이터 연동 | K-System(Flex-K), FlexSQL, 자동조회, API 연동 중 | K-System(Flex-K) |
| 이름 접두어 | `<접두어>` (테이블과 SP 이름을 다른 앱과 구분) | `ABC` |

## 2. 화면 목록

| 시나리오 ID | Step | 화면 이름 | 하는 일 |
|---|---|---|---|
| `<시나리오 ID>` | Step1 | 거래처 목록 | 조건으로 조회하고 행을 고릅니다. |
| `<시나리오 ID>` | Step2 | 거래처 상세 | 고른 행을 보고 저장합니다. |

## 3. 카테고리

| 카테고리 | 용도 | 연결할 그룹, 컨트롤 | [받는 데이터] 방식 |
|---|---|---|---|
| `CtgCustQueryCond` | 조회조건 | Step1 검색 영역 그룹 | 받지 않음 |
| `CtgCustList` | 목록 | Step1 목록 그룹(조회 용도) | [덮어쓰기] |
| `CtgCustMaster` | 상세 | Step2 상세 그룹 | [병합] |

카테고리 이름은 `Ctg` 로 시작하면 컬렉션 키, 서비스 이름과 구분하기 쉽습니다.
조회조건과 결과 목록은 다른 카테고리로 나누세요.
조회 결과는 [덮어쓰기]로 받으세요.
기본값인 추가로 두면 조회할 때마다 목록이 늘어납니다.

## 4. 컬렉션 키 계약

| 카테고리 | 컬렉션 키 | 타입 | SP 결과 컬럼 또는 DB 컬럼 | [Etc] 등록 |
|---|---|---|---|---|
| `CtgCustQueryCond` | `QCustName` | string | `#BIZ_IN` 조건 컬럼 `QCustName` | 등록 |
| `CtgCustList` | `CustSeq` | int | 결과 컬럼 `CustSeq` | Q조회면 등록, R조회면 불필요 |
| `CtgCustList` | `CustName` | string | 결과 컬럼 `CustName` | Q조회면 등록, R조회면 불필요 |
| `CtgCustList` | `CustStatus` | string | 결과 컬럼 `CustStatus` | Q조회면 등록, R조회면 불필요 |
| `CtgCustMaster` | `CustName` | string | `#BIZ_IN` 저장 컬럼 `CustName` | 등록 |

[Etc] 등록은 Studio 의 [Etc] 탭 Collections 에 키를 타입과 함께 넣는 일입니다.
SP 가 `#BIZ_IN` 에서 읽는 키(조회 조건, 저장할 값)는 반드시 등록하세요.
등록하지 않은 키는 값이 비면 임시 테이블에 컬럼이 생기지 않아 `Invalid column name` 오류가 납니다.
Q조회 SP 가 `#BIZ_OUT` 에 넣을 결과 키도 [Etc] 탭 Collections 에 타입과 함께 등록하세요.
등록하지 않은 결과 키에 INSERT 하면 `Invalid column name` 오류가 납니다.
R조회는 SP 마지막 SELECT 결과를 그대로 돌려주므로 결과 키를 등록하지 않아도 됩니다.
R조회에서는 SELECT 의 별칭(`AS CustSeq`)이 결과 컬럼이 됩니다.

지킬 규칙입니다.

1. 컬렉션 키는 SP 결과 컬럼 이름과 대소문자까지 같게 쓰세요.
   한 글자만 달라도 화면에 빈 값이 나옵니다.
2. 화면에서만 쓰는 키는 camelCase 로 쓰세요.
3. 아래 예약어와 섹터 함수 이름은 컬렉션 키로 쓰지 마세요.
   `block` `collection` `innerBlocks` `isActive` `isAdded` `isDeleted` `isLast` `isSelected` `isUpdated` `keys` `status`
   `activate` `delete` `remove` `select` `unSelect` `set` `setValue` `setStatus` `release` `mergeSector` `replaceSector`
4. 상태 컬럼은 `CustStatus` 처럼 접두어를 붙이세요.
5. 코드, 번호처럼 앞자리 0 이나 영문이 있는 값은 InputText 에 연결하세요.
   InputNumber 에 연결하면 앞자리가 사라집니다.
6. 조회 조건 키는 결과 키와 다른 이름으로 지으세요(예: 조건 `QCustName`, 결과 `CustName`).
   Q조회는 `#BIZ_OUT` 이 `#BIZ_IN` 과 같은 컬럼으로 만들어집니다.
   [확인 필요] 이름이 같은 조건 키와 결과 키가 한 컬럼으로 합쳐지는지는 확인되지 않았습니다.
   이름을 나누면 이 문제를 따질 필요가 없습니다.

## 5. 서비스

| 서비스 이름 | 종류 | SP 또는 쿼리 | 조회 방식 |
|---|---|---|---|
| `Query_CustList` | K-System(Flex-K) | `<접두어>_SFlexCustListQuery` | Q조회 |
| `Save_CustMaster` | K-System(Flex-K) | `<접두어>_SFlexCustSave` | 저장 |

조회 방식은 두 가지입니다.

| 방식 | SP 가 결과를 내는 곳 | 서비스 설정 [TempTable to SELECT] |
|---|---|---|
| Q조회 | `#BIZ_OUT_DataBlock<n>` 에 INSERT | BIZ_IN/OUT_DataBlock |
| R조회 | SP 마지막의 SELECT | None |

이 양식은 저장 SP 와 같은 방식으로 맞추려고 목록 조회를 Q조회로 적었습니다.
목록을 [덮어쓰기]로만 받는 단순 조회라면 R조회가 더 쉽습니다.

`#BIZ_IN`, `#BIZ_OUT` 을 쓰는 SP 라면 [TempTable to CREATE] 를 BIZ_IN/OUT_DataBlock 으로 바꾸세요.
새 서비스의 기본값 그대로 두면 이 임시 테이블이 만들어지지 않습니다.

## 6. 서비스별 보내는 데이터와 받는 데이터

| 서비스 | [보내는 데이터] (카테고리, 필터) | [사용자 데이터] | [받는 데이터] (카테고리, 방식) |
|---|---|---|---|
| `Query_CustList` | `CtgCustQueryCond`, 필터 없음 | CompanySeq, LanguageSeq, UserSeq | `CtgCustList`, [덮어쓰기] |
| `Save_CustMaster` | `CtgCustMaster`, 상태 필터 updated | CompanySeq, LanguageSeq, UserSeq | `CtgCustMaster`, [병합] |

지킬 규칙입니다.

1. K-System(Flex-K) SP 를 부르는 서비스는 [사용자 데이터]에 CompanySeq, LanguageSeq, UserSeq 를 넣으세요.
2. 같은 키를 [사용자 데이터]와 카테고리 양쪽으로 보내지 마세요.
3. 받을 블록이 N 개면 보내는 블록도 N 개로 맞추세요.
   입력이 필요 없는 조회도 [보내는 데이터]를 1개 붙이세요.
4. 상태 필터 값은 소문자로 쓰세요(`all`, `updated`).

## 7. 이벤트 배선

| 이벤트 이름 | 어디에 | 액션 순서 |
|---|---|---|
| `Init_Step1` | Step1 [최초 시작 전 (Init)] | 액션 1 서비스 `Query_CustList` |
| `Query_CustList` | Step1 조회 버튼 클릭 | 액션 1 서비스 `Query_CustList` |
| `Save_CustMaster` | Step2 저장 버튼 클릭 | 액션 1 스크립트(필수값 확인), 액션 2 서비스 `Save_CustMaster` |

액션 번호는 Studio 화면과 같게 1부터 쓰세요.

## 8. SP 이름 계약: K-System(Flex-K) 연동일 때

| SP | 읽는 임시 테이블 | 결과를 내는 곳 | 행 구분 |
|---|---|---|---|
| `<접두어>_SFlexCustListQuery` | `#BIZ_IN_DataBlock1` | `#BIZ_OUT_DataBlock1` (Q조회) | 없음 |
| `<접두어>_SFlexCustSave` | `#BIZ_IN_DataBlock1` | `#BIZ_OUT_DataBlock1` | WorkingTag A, U, D |

SP 는 항상 `@WorkingTag`, `@CompanySeq`, `@LanguageSeq`, `@UserSeq` 4개 파라미터로 호출됩니다.
다른 값은 파라미터가 아니라 `#BIZ_IN` 의 컬럼으로 들어옵니다.
행 구분은 행 상태에서 정해집니다.
새 행은 A, 삭제한 행은 D, 그 밖의 행은 U 로 들어옵니다.
6절 예시처럼 상태 필터가 `updated` 이면 수정한 행만 갑니다.
새 행이나 삭제도 같은 서비스로 보내려면 필터를 다시 정하세요.
SP 뼈대가 필요하면 AI 에게 Q조회 SP 또는 저장 SP 뼈대를 요청하세요.

## 9. 확인 목록

| 해 볼 것 | 기대 결과 |
|---|---|
| 조건 없이 조회 | 전체 목록이 나옵니다. |
| 조건을 넣고 두 번 조회 | 목록이 늘지 않고 바뀝니다. |
| 행을 고르고 상세로 이동 | 고른 행의 값이 보입니다. |
| 값을 고치고 저장 후 다시 조회 | 고친 값이 보입니다. |
| 필수값을 비우고 저장 | 안내가 뜨고 저장되지 않습니다. |
