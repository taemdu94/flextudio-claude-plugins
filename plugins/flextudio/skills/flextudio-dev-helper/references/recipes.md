# 검증된 예제 모음
이 파일이 답하는 질문: 목록 조회 화면 만들기 | 목록에서 상세로 갔다가 돌아오기 | 서브시나리오 왕복 | 같은 시나리오 안 목록-상세 Step 이동 | 새 행 저장 WorkingTag A | 삭제 전 확인창 | 저장 후 목록 다시 조회 | 필수값 검사 | 바코드 스캔 입력 | 조건에 따라 숨기기·색 바꾸기 | 날짜 기본값 넣기 | 숫자 천 단위 콤마 표시

## 목차
0 공통 규칙 | 1 조회-목록 | 2 서브시나리오 왕복 | 3 신규 저장 | 4 삭제 확인창 | 5 저장 후 다시 조회 | 6 필수값 검사 | 7 바코드 스캔 | 8 조건부 표시 | 9 날짜 기본값·숫자 표시 | 10 같은 시나리오 목록-상세

## 0. 예제를 읽는 법과 공통 규칙
모든 예제는 목표, 준비(이름 계약), 배선, 코드, 확인 순서로 씁니다.
이름 계약 표의 이름을 먼저 정하고, 뒤 단계에서는 그 이름만 쓰세요.
코드의 `<꺾쇠>` 값은 내 화면의 이름으로 바꾸세요.
SQL 은 K-System 연동 서비스(Flex-K)용 MS SQL 입니다.

| 규칙 | 이유 |
|---|---|
| 값은 `섹터.set('키', 값)` 으로 바꾸세요 | `섹터.키 = 값` 직접 대입은 변경 상태가 찍히지 않아 저장 대상에서 빠집니다 |
| 이벤트 스크립트에서는 `_c.<카테고리>[0].<키>` 로 읽으세요 | 스크립트 안의 `{=키}` 는 실행 전에 글자로 바뀌어 따옴표가 없으면 오류가 납니다 |
| 카테고리를 쓰기 전에 있는지 확인하세요 | 마지막 행을 지우면 카테고리 자체가 사라집니다 |
| 조회 조건 키는 결과 키와 다른 이름(예: `QItemName`)으로 지으세요 | [확인 필요] 이름이 같을 때 임시 테이블에서 어떻게 되는지는 확인되지 않았습니다. 이름을 나누면 따질 필요가 없습니다 |

스크립트 오류는 화면에 메시지 없이 같은 이벤트의 남은 액션을 모두 취소하므로, 반응이 없으면 Studio 디버그 실행이나 브라우저 F12 콘솔에서 오류를 먼저 보세요.

## 1. 조회-목록
목표: 화면이 열리면 ERP 에서 목록을 읽어 반복 그룹에 보여 줍니다.
첫 조회 화면이라 가장 단순한 R조회로 적었습니다. 저장 SP 와 같은 방식으로 맞추려면 Q조회를 쓰세요(화면 정의 양식의 예시가 Q조회입니다).

| 무엇 | 이름(예) | 비고 |
|---|---|---|
| SP | `<접두어>_SFlexItemQuery` | 마지막에 SELECT 로 돌려주는 R조회 |
| 서비스 | `Query_ItemList` | |
| 카테고리 | `CtgItemList` | 컬렉션 키 `ItemNo`, `ItemName` = SP 별칭(대소문자까지) |
| 스텝 이벤트 | `Init_Step1` | 최초 시작 전 (Init) |

1. 시나리오의 Service 탭에서 서비스 `Query_ItemList` 를 만들고 서비스 종류 `ksystem`, 모듈 `FlexAPI`, SP List 에 SP 이름을 넣으세요.
2. TempTable to CREATE 를 `BIZ_IN/OUT_DataBlock` 으로, TempTable to SELECT 를 `None` 으로 두세요.
3. [보내는 데이터] 블록 1개를 만들고 [사용자 데이터]에 CompanySeq, LanguageSeq, UserSeq 를 넣으세요.
4. [받는 데이터]를 카테고리 `CtgItemList`, [덮어쓰기]로 두세요.
5. Step1 의 최초 시작 전 (Init) 이벤트 `Init_Step1` 에 액션 1 서비스 `Query_ItemList` 를 넣으세요.
6. 목록 그룹의 데이터 연결 카테고리를 `CtgItemList`, 데이터 용도를 [조회]로 두고 라벨에 컬렉션 키를 연결하세요.

```sql
CREATE OR ALTER PROCEDURE dbo.<SP이름>
    @WorkingTag NVARCHAR(10) = '', @CompanySeq INT = 1, @LanguageSeq INT = 1, @UserSeq INT = 0
AS
    SET NOCOUNT ON
    SELECT t.<품번컬럼> AS ItemNo, t.<품명컬럼> AS ItemName
      FROM <테이블> t WITH(NOLOCK) WHERE t.CompanySeq = @CompanySeq
    RETURN
```
이 코드가 하는 일
- 엔진이 넘기는 파라미터 4개만 받고, 그 밖의 입력은 `#BIZ_IN_DataBlock1` 의 컬럼으로 받습니다.
- 마지막 SELECT 결과의 행이 `CtgItemList` 의 행이 됩니다.

확인: 디버그 실행에서 목록에 행이 보이면 성공입니다.
목록이 비었는데 디버거 [컬렉션] 탭에 `CtgItemList` 가 차 있으면 별칭과 컬렉션 키가 다른 것입니다.
SP 가 `#BIZ_IN` 에서 읽는 키는 [Etc] 탭 Collections 에 타입과 함께 등록하세요. 값이 비면 컬럼이 생기지 않아 `Invalid column name` 오류가 납니다.

## 2. 목록에서 상세로 갔다 돌아오기(서브시나리오 왕복)
목표: 목록에서 고른 행을 상세 시나리오로 넘겨 고치고, 돌아오면 목록을 다시 조회합니다.

| 설정 | 어디 | 값 |
|---|---|---|
| 컬렉션 복사 | 부모의 서브시나리오 호출 스텝 | 켬 |
| 내려보낼 상태 필터 | 같은 곳 | `active`(누른 행 1건), 목록 전체면 `전체` |
| 서브시나리오의 콜렉션으로 대체하기 | 같은 곳 | 끔(아래 방식 A) |
| 상단 헤더 사용하기, 스텝 제목 | 상세 시나리오의 시작 스텝 | 켬, 복귀 화살표가 여기에 그려집니다 |

1. 목록 행을 누르면 서브시나리오 호출 스텝으로 이동하게 두세요.
2. 상세 시나리오에서는 넘어온 행을 `_c.<카테고리>[0]` 으로 읽으세요.
3. 상세의 저장 이벤트에 액션 1 저장 서비스, 액션 2 아래 스크립트를 넣으세요.
4. 부모 목록 스텝의 "뒤로가기로 돌아올 때" 이벤트에 액션 1 조회 서비스를 넣으세요.

```javascript
// 상세 시나리오 저장 이벤트의 액션 2 스크립트
Current.step.moveToParent();
```
이 코드가 하는 일
- 저장 서비스가 실패하면 남은 액션이 취소되므로, 저장에 성공했을 때만 부모로 돌아갑니다.
- 부모의 Init 은 다시 실행되지 않아서 재조회는 "뒤로가기로 돌아올 때" 이벤트에 둡니다.

방식 B: 고친 값을 DB 저장 없이 부모로 올리려면 대체하기를 켜고 상태 필터를 `수정(updated)` 으로 두세요.
대체는 병합이 아니라 통째 교체라서 필터에 걸리지 않은 부모 카테고리가 사라집니다.
처음에는 방식 A 를 쓰세요.

확인: 저장하고 돌아왔을 때 목록에 바뀐 값이 보이면 성공입니다.
뒤로가기 버튼이 원치 않게 보이면 부모 호출 스텝의 "호출한 시나리오로 돌아가기 허용"을 끄세요.

## 3. 신규 저장(setStatus added)
목표: 입력한 값으로 새 행을 만들어 저장 SP 에 WorkingTag `A` 로 보냅니다.

| 무엇 | 이름(예) | 비고 |
|---|---|---|
| 입력 카테고리 | `CtgItemInput` | 입력 그룹 데이터 용도 [신규입력] |
| 보낼 카테고리 | `CtgItemSave` | 컬렉션 키 `ItemName`, `Qty` |
| 서비스 | `Save_Item` | [보내는 데이터] `CtgItemSave`, 상태 필터 `added` |
| 저장 버튼 클릭 이벤트 | `Save_NewItem` | 액션 1 스크립트, 2 서비스 `Save_Item`, 3 스크립트 |

```javascript
// 액션 1 스크립트
var input = _c.CtgItemInput && _c.CtgItemInput[0];
if (!input || !input.ItemName) { f.Event().break(); return; }
var row = f.Collection.addSector({ ItemName: input.ItemName, Qty: input.Qty }, 'CtgItemSave');
row.setStatus('added');
```
```sql
INSERT INTO <테이블> (CompanySeq, ItemName, Qty)  -- 저장 SP 본문 안
SELECT @CompanySeq, ItemName, Qty
  FROM #BIZ_IN_DataBlock1
 WHERE WorkingTag = 'A'
```
이 코드가 하는 일
- `f.Collection.addSector` 로 만든 행은 상태가 비어 `U` 로 가므로 `setStatus('added')` 로 바꿉니다.
- SP 는 WorkingTag 가 `A` 인 행만 INSERT 합니다.
- 액션 3 스크립트 `f.Collection.removeSector('all', 'CtgItemSave');` 로 보낸 행을 비워야 다음 저장 때 같은 행이 다시 나가지 않습니다.

주의
- `setStatus` 인자는 소문자 `'added'`, `'updated'`, `'deleted'` 만 쓰세요(`'Added'`, `'A'` 는 상태를 지웁니다).
- 행을 만든 뒤 값을 더 바꿨다면 보내기 직전에 `setStatus('added')` 를 한 번 더 부르세요.
- 숫자 키 `Qty` 는 Etc 탭 Collections 에 타입과 함께 등록하세요.

확인: SSMS 에서 테이블을 SELECT 해 새 행이 있으면 성공입니다.

## 4. 삭제 확인창
목표: 삭제 버튼을 누르면 확인창을 띄우고, [삭제]를 누를 때만 지웁니다.

| 무엇 | 이름(예) | 비고 |
|---|---|---|
| 이벤트 1 | `Click_Delete` | 행 안 삭제 버튼 클릭, 누른 행이 Active 가 됩니다 |
| 이벤트 2 | `Delete_Item` | [삭제] 버튼이 부름, 액션 2 = 서비스(상태 필터 `deleted`) |

```javascript
// 이벤트 Click_Delete 액션 1 스크립트
f.MessageBox('Alert').setTitle('삭제').setDescription('선택한 항목을 삭제할까요?')
    .addBtn('취소', null).addBtn('삭제', 'Delete_Item').show();
```
```javascript
// 이벤트 Delete_Item 액션 1 스크립트
var row = _c.activeSector;
if (!row) { f.Event().break(); return; }
row.delete();
```
이 코드가 하는 일
- 조회로 받은 행은 `deleted` 가 되어 WorkingTag `D` 로 나가고, 저장 전 새 행은 메모리에서 바로 사라집니다.
- SP 는 `WHERE WorkingTag = 'D'` 인 행으로 DELETE 하세요.

버튼 함수 이름은 공식 함수 명세 기준 `addBtn` 입니다.
이 예제는 실제 구동한 앱에서 쓴 `addBtn` 으로 적었습니다. 이벤트 이름을 주는 형식은 [함수 자동 생성]으로 이름과 인자를 확인하세요.
디버그 실행으로 [삭제] 버튼이 `Delete_Item` 을 부르는지 먼저 보세요.
`f.Collection.removeSector` 는 화면 메모리에서만 지우므로 서버 삭제에 쓰지 마세요.

확인: 테이블에서 그 행이 없어지면 성공입니다(목록 갱신은 5번 예제).

## 5. 저장 후 다시 조회
목표: 저장한 뒤 서비스를 한 번만 불러 목록까지 새로 받습니다.
저장 SP 끝에서 목록을 다시 SELECT 하세요(R조회).
저장 서비스의 [받는 데이터]는 조회 서비스와 같은 카테고리, [덮어쓰기]로 두세요.

```sql
    -- 저장 처리(INSERT/UPDATE/DELETE)를 마친 뒤, 같은 SP 의 마지막
    SELECT t.<품번컬럼> AS ItemNo, t.<품명컬럼> AS ItemName
      FROM <테이블> t WITH(NOLOCK) WHERE t.CompanySeq = @CompanySeq
    RETURN
```
이 코드가 하는 일
- 저장과 재조회가 한 번의 호출로 끝나고, 결과가 같은 카테고리를 덮어써 화면이 최신 목록이 됩니다.

주의
- 같은 카테고리를 덮어쓰는 SP 는 모두 같은 컬럼을 돌려주세요(빠진 컬럼은 빈 값이 됩니다).
- 목록 그룹이 최상위 그룹이 아니면 다음 액션 스크립트에 `f.Content('<목록 그룹 fid>').reload();` 를 넣으세요.
- 저장 서비스 바로 뒤에 연결 이벤트로 조회 서비스를 또 부르면 가끔 `read ECONNRESET` 오류가 나니 한 서비스로 묶으세요.

확인: 디버거 실행 내역에 서비스가 한 번만 찍히고 목록이 바뀌면 성공입니다.

## 6. 필수값 검사
목표: 필수 입력이 비었으면 저장하지 않고 멈춥니다.
컨트롤을 필수 입력으로 설정하고 저장 이벤트 액션 1 에 아래 스크립트를 두세요.

```javascript
if (f.checkRequired()) { f.Event().break(); return; }
```
이 코드가 하는 일
- `f.checkRequired()` 는 필수 입력 컨트롤 중 빈 것이 있으면 `true` 를 돌려줍니다.
- `f.Event().break()` 는 이 이벤트의 남은 액션을 모두 취소합니다.

주의
- 필수 검사는 연결된 모든 컬렉션 키를 보므로, 특정 키만 보려면 `if (!_c.<카테고리>[0].<키>)` 조건에서 4번의 `f.MessageBox` 로 안내하고 `break()` 하세요.
- 하단 버튼의 다음 이동은 `break()` 로 막히지 않을 수 있으니, 막아야 하는 이동은 화면 안 버튼에 거세요.

확인: 빈 채로 누르면 서비스가 나가지 않고, 채우고 누르면 저장되면 성공입니다.

## 7. 바코드 스캔 입력
목표: 휴대폰 카메라로 바코드 1건을 읽어 조회 조건에 넣고 바로 조회합니다.

| 무엇 | 이름(예) | 비고 |
|---|---|---|
| 스캔 버튼 이벤트 | `Scan_Item` | 스캔 창을 엽니다 |
| 결과 이벤트 | `SetBarcode` | 읽은 뒤 불림, 액션 2 = 조회 서비스 |
| 조건 카테고리, 키 | `CtgScanCond`, `Barcode` | 조회 서비스의 [보내는 데이터] |

```javascript
// 이벤트 Scan_Item 액션 1 스크립트
f.Native.getBarcode(true, 'SetBarcode', false);
```
```javascript
// 이벤트 SetBarcode 액션 1 스크립트
var code = f.Barcode.value;
if (!code) { f.Event().break(); return; }
if (!_c.CtgScanCond || !_c.CtgScanCond[0]) f.Collection.addSector({}, 'CtgScanCond');
_c.CtgScanCond[0].set('Barcode', code);
```
이 코드가 하는 일
- 세 번째 인자가 `false` 면 `f.Barcode.value` 는 문자열 1건, `true` 면 배열입니다.
- 읽은 값을 조건 카테고리에 넣고, 다음 액션의 조회 서비스가 그 값을 보냅니다.

[확인 필요] 첫 번째 인자(동기 여부)의 의미는 문서에 함수마다 다르게 적혀 있습니다. [함수 자동 생성]의 모바일 기능 바코드 항목으로 만든 코드를 기준으로 하세요.
PC 브라우저에서는 웹캠 스캔으로 바뀌어 디버그 실행으로 시연할 수 있습니다.
산업용 PDA 스캐너는 설정 조건이 따로 있으니 구축과 배포 설명의 모바일 앱과 PDA 절을 보세요.

확인: 바코드를 비추면 조회 결과가 목록에 나오면 성공입니다.

## 8. 조건부 표시
목표: 값에 따라 컨트롤 색을 바꾸거나 숨깁니다.
로드스크립트는 컨트롤이 그려지기 직전에 실행되므로, 값이 바뀐 뒤에는 감싼 그룹을 reload 하세요.
예 1: 이미 처리한 버튼을 회색으로 만들고 눌리지 않게 합니다(버튼 [로드스크립트]).

```javascript
if (_c.<카테고리> && _c.<카테고리>[0] && _c.<카테고리>[0].<완료키>) {
    Current.control.style('background-color:#E5E7EB; color:#9CA3AF; pointer-events:none;');
}
```
버튼 회색은 `controlkey('dis')` 가 아니라 `style()` 로 주세요.
예 2: 머리글을 누를 때마다 목록을 접고 폅니다.

```javascript
// 머리글 그룹의 클릭 이벤트 액션 1 스크립트
_v.listOpen = (_v.listOpen === false) ? true : false;
f.Content('<머리글과 목록을 감싼 그룹 fid>').reload();
```
```javascript
// 목록 그룹의 [로드스크립트]
Load.layout.controlkey(_v.listOpen === false ? 'hid' : '');
```
이 코드가 하는 일
- `_v` 는 스텝을 옮겨도 남는 전역 변수라 열림 상태를 기억합니다.
- 감싼 그룹을 reload 해야 로드스크립트가 다시 실행되어 숨김이 바뀝니다.

주의
- 반복 행마다 값이 다르면 `_c.activeSector` 가 아니라 `Load.sector.<키>` 로 그 행의 값을 읽으세요.
- 조건이 거짓일 때의 스타일도 함께 적어야 다른 행에 스타일이 남지 않습니다.

확인: 조건 값을 바꾸고 그룹을 reload 했을 때 색이나 표시가 바뀌면 성공입니다.

## 9. 날짜 기본값과 숫자 표시
목표: 조회 화면이 열릴 때 날짜 조건에 오늘 날짜를 넣습니다.
최초 시작 전 (Init) 이벤트는 화면이 그려지기 전이라 reload 가 필요 없습니다.

```javascript
// 최초 시작 전 (Init) 이벤트 액션 1 스크립트 (액션 2 = 조회 서비스)
if (!_c.<조건카테고리> || !_c.<조건카테고리>[0]) f.Collection.addSector({}, '<조건카테고리>');
var today = f.Date().format('YYYY-MM-DD');
_c.<조건카테고리>[0].set('<날짜키>', today.replace(/-/g, ''));
```
이 코드가 하는 일
- `f.Date()` 는 오늘을 뜻하고, `format('YYYY-MM-DD')` 결과에서 하이픈을 빼 8자리로 넣습니다.

[확인 필요] 날짜 입력 컨트롤이 쓰는 값의 모양은 디버거 [컬렉션] 탭에서 한 번 보고 맞추세요.
목록 라벨에서 날짜를 바꿔 보이려면 라벨을 [텍스트 직접 입력]으로 두고 `{% return f.Date(Load.sector.<날짜키>).format('YYYY-MM-DD') %}` 를 쓰세요.
확인: 화면을 열자마자 날짜 조건에 오늘이 보이고 그 날짜로 조회되면 성공입니다.
숫자에 천 단위 콤마를 붙여 보이려면 라벨에 `{=$<숫자키>}` 처럼 키 앞에 `$` 를 붙이세요.
디버그 실행에서 콤마가 보이는지 확인하세요.
[확인 필요] `{% %}` 안에서 `f.numFormat(<값>).format(digits, toFix, mode)` 로 같은 모양을 만드는 mode 값은 확인되지 않았습니다. [함수 자동 생성]으로 확인하세요.

## 10. 같은 시나리오 안 목록-상세(저장 없음)
목표: 목록 Step 에서 고른 행을 상세 Step 에 보여 주고, 저장 없이 목록으로 돌아옵니다.
같은 시나리오의 Step 끼리는 컬렉션을 함께 쓰므로 상세에서 서비스를 다시 부르지 않습니다.

1. Step1 목록 그룹의 데이터 연결을 카테고리 `CtgItemList`, 데이터 용도 [조회]로 두세요.
2. Step2 상세 그룹의 데이터 연결을 같은 카테고리, 쓰임새 `detail` 로 두세요.
3. 상세 그룹의 대상 섹터는 상태 필터 `active`(누른 행 1건)로 지정하세요.
4. 목록 행 안 [상세] 버튼의 클릭 이벤트 `Click_Detail` 에 첫 스크립트를 넣으세요. 누른 행이 Active 가 됩니다.
5. Step2 [목록] 버튼의 클릭 이벤트 `Click_Back` 에 둘째 스크립트를 넣으세요.

```javascript
// 이벤트 Click_Detail 액션 1 스크립트
Current.step.moveToNext('Step2');
```
```javascript
// 이벤트 Click_Back 액션 1 스크립트
Current.step.moveToPrev();
```
이 코드가 하는 일
- `moveToNext` 는 stepId 를 넣어야 이동하고, 같은 이벤트의 남은 액션이 끝난 뒤 이동합니다.
- `moveToNext` 는 기본으로 필수값을 먼저 검사하므로 Step1 의 필수 컨트롤이 비어 있으면 이동하지 않습니다.
- `moveToPrev` 는 stepId 를 빼면 직전 Step 으로 돌아갑니다.
- 돌아갈 때 `moveToNext('Step1')` 를 쓰면 Step1 이 이동한 스텝이 되어 홈 버튼 대신 뒤로가기 버튼이 보입니다.

[확인 필요] `detail` 과 대상 섹터의 Studio 화면 글자는 확인되지 않았습니다. 그룹 속성의 [데이터 용도] 목록과 섹터 지정 항목을 찾으세요.
확인: 두 번째 행의 [상세]를 누르면 두 번째 행 값이 보이고, 돌아오면 목록이 그대로이면 성공입니다.
상세 카드가 행 수만큼 나오면 데이터 용도(쓰임새)를 보세요. `detail` 이 아닌 값으로 되어 있는 것입니다.
어느 행을 눌러도 첫 행 값만 나오면 대상 섹터 설정을 보세요. `active`(누른 행)로 지정됐는지 확인하세요.
