# 이벤트와 스크립트
이 파일이 답하는 질문: 이벤트 실행 순서, 동기와 비동기 서비스, 버튼을 눌렀는데 반응이 없을 때, 스크립트 자리별로 쓸 수 있는 변수, 스텝 이동이 늦게 되는 이유, break 와 runNext, 스크립트 안의 {=키}, 서브시나리오 왕복, 주요 함수 이름과 시그니처

목차: 1 한눈에 보기, 2 이벤트 실행 규칙, 3 흐름 제어, 4 스텝 이동, 5 스텝 이벤트의 순서, 6 스크립트 자리별로 쓸 수 있는 것, 7 {=키} 치환, 8 서브시나리오 왕복, 9 주요 함수 표, 10 자주 나는 증상, 11 아직 확인되지 않은 것

## 1. 한눈에 보기: 이벤트는 큐로 실행됩니다

이벤트는 액션 목록이며, 실행되면 액션 전부가 큐(대기열)에 차례로 들어가고, 앞에서부터 하나씩 실행됩니다.

사용자 동작 → 이벤트 → 액션 1 → 액션 2 → 액션 3 → (예약된 스텝 이동)

| 액션 종류 | 큐에서 하는 일 |
|---|---|
| 스크립트 | 바로 실행합니다. 오류가 나면 남은 액션이 모두 취소됩니다. |
| 서비스(기본, 동기) | 서버 응답을 기다린 뒤 [받는 데이터]를 반영하고 다음 액션으로 갑니다. |
| 서비스([비동기 호출 사용하기] 켬) | 기다리지 않고 바로 다음 액션으로 갑니다. |
| 연결 이벤트 | 그 이벤트의 액션을 현재 위치 바로 다음에 끼워 넣습니다. |

건너뛰기를 켠 액션은 실행되지 않습니다.

## 2. 이벤트 실행 규칙

### 2-1. 스크립트 오류는 화면에 아무 메시지 없이 나머지를 취소합니다

스크립트 액션에서 오류(오타, 없는 값 읽기 등)가 나면 그 이벤트의 남은 액션이 전부 취소됩니다.
일반 사용자 화면에는 오류 창이 뜨지 않습니다.
"버튼을 눌렀는데 아무 반응이 없다"면 앞쪽 스크립트 오류를 먼저 의심하세요.

브라우저에서 F12 를 누르고 [Console] 탭의 빨간 오류 문구를 확인하세요.
Studio 디버거로 실행했다면 실행 내역에서 멈춘 액션과 오류 문구를 확인하세요.
로드 스크립트의 오류도 화면에 메시지가 없고 F12 콘솔에만 남습니다.

### 2-2. 동기 서비스는 기다리고, 실패하면 뒤를 취소합니다

서비스 액션은 기본이 동기 호출입니다.
응답이 올 때까지 다음 액션을 기다리고, 그동안 로딩 화면이 보입니다.
결과를 컬렉션에 반영한 뒤 다음 액션이 실행되므로 서비스 바로 다음 스크립트에서 결과를 읽을 수 있습니다.
서비스가 실패하면 오류 창이 뜨고 남은 액션이 모두 취소됩니다. 같은 이벤트의 뒤 액션도, 연결 이벤트도 실행되지 않습니다.
예를 들어 체크 서비스가 실패하면 그 뒤의 저장 서비스는 호출되지 않습니다.
동기 서비스의 실패는 스크립트로 잡아서 다시 시도할 수 없습니다.

### 2-3. [비동기 호출 사용하기]를 켜면 기다리지 않습니다

켜는 곳은 이벤트의 서비스 액션에서 [서비스 고급설정]을 열면 나오는 [비동기 호출 사용하기] 스위치입니다.
데이터소스 설정에는 이 스위치가 없습니다.
켜면 Async Then Script, Async Catch Script, Async Finally Script 칸이 생깁니다.
Then 은 성공 뒤, Catch 는 실패 뒤, Finally 는 둘 다 끝난 뒤에 실행됩니다.
스위치를 껐다 다시 켜면 세 스크립트가 지워지므로 미리 복사해 두세요.

| 구분 | 동기(기본) | 비동기(스위치 켬) |
|---|---|---|
| 다음 액션 | 응답까지 기다림 | 기다리지 않고 바로 진행 |
| 로딩 화면 | 보임 | 없음 |
| [받는 데이터] 반영 | 다음 액션 전에 반영 | 응답이 온 때 같은 방식으로 반영 |
| 실패했을 때 | 오류 창, 남은 액션과 연결 이벤트 모두 취소 | 오류 창 없음, Async Catch Script 만 실행 |
| 디버그 로그 | 남음 | 남지 않음 |

비동기에서는 통신 실패, HTTP 오류, SP 가 돌려준 실패나 안내 메시지가 모두 화면에 표시되지 않습니다.
사용자에게 알려야 하면 Async Catch Script 에서 `f.MessageBox` 로 직접 띄우세요.
결과를 바로 다음 액션에서 써야 하면 비동기를 끄세요.
저장, 조회 버튼처럼 사용자가 누르는 동작은 실패가 보이도록 동기로 두세요.
비동기는 기다릴 필요가 없는 기록이나 알림에 쓰세요.
`setTimeout` 으로 다음 조회를 예약하는 자동 조회 화면은 하기 쉬운 실수의 "자동 조회가 한 번 실패한 뒤 멈춥니다"를 보세요.

### 2-4. 서비스 Before Script, After Script

서비스에 붙이는 Before Script 는 보낼 데이터 `paramBlocks`를, After Script 는 받은 데이터 `resultBlocks`를 그 자리에서 고칩니다.
After Script 는 이벤트에서 서비스를 호출할 때만 실행됩니다.
데이터소스(코드도움 등)에서 호출할 때는 실행되지 않습니다.
조건에 따라 실행을 멈추는 일은 Before Script 가 아니라 이벤트 스크립트에서 하세요.

## 3. 흐름 제어: break, runNext, return

| 코드 | 하는 일 |
|---|---|
| `f.Event().break()` | 큐에 남은 일을 모두 지웁니다. 남은 액션, 예약된 스텝 이동, 기다리던 화면 다시 그리기가 함께 사라집니다. |
| `f.Event('<이벤트명>').runNext()` | 지정한 이벤트를 큐 맨 앞에 넣습니다. 현재 스크립트가 끝나면 남은 액션보다 먼저 실행됩니다. |
| `return` | 현재 스크립트만 끝냅니다. 다음 액션은 계속 실행됩니다. |

`break()`는 호출한 줄에서 스크립트를 멈추지 않습니다.
아래 줄은 계속 실행되므로, 바로 멈추려면 `break()` 다음에 `return`을 쓰세요.
화면 다시 그리기(`reload`)와 토스트는 `break()` 뒤에 두세요.
`break()` 앞에 둔 다시 그리기는 함께 지워져 시트가 비어 보일 수 있습니다.
`runNext()`를 반복문 안에서 여러 번 부르지 마세요.
매번 큐 맨 앞에 끼어들어 실행 순서가 뒤집힙니다.
필수값을 확인하고 멈추는 공식 예시는 다음과 같습니다.

```javascript
if (f.checkRequired()) f.Event().break();
```

이 코드가 하는 일:
필수 입력이 비어 있으면 이 이벤트의 남은 액션과 예약된 이동을 모두 취소합니다.

## 4. 스텝 이동

### 4-1. 이동 함수는 즉시 이동이 아니라 예약입니다

`Current.step.moveToNext` 같은 이동 함수는 이동을 큐의 맨 뒤에 예약합니다.
그래서 이동 함수 아래 줄과 같은 이벤트의 뒤 액션(서비스 포함)이 모두 끝난 다음에 이동합니다.
이동을 막으려면 조건문으로 이동 함수를 부르지 않거나, 이동 뒤에 `f.Event().break()`를 부르세요.

| 함수 | 하는 일 |
|---|---|
| `Current.step.moveToNext(stepId, ignoreRequired, stepAnimation)` | 지정한 스텝으로 이동합니다. stepId 는 꼭 넣으세요. 필수값 검사는 기본으로 켜져 있습니다. |
| `Current.step.moveToPrev(stepId, isRestored, checkRequired)` | 지나온 스텝으로 돌아갑니다. stepId 를 빼면 직전 스텝입니다. |
| `Current.step.moveToFirst()` | 첫 스텝으로 갑니다. |
| `Current.step.moveToParent()` | 서브시나리오에서 부모 시나리오로 돌아갑니다. 인자는 필수값 검사 여부 하나입니다. |
| `Current.step.reload(isPositionReset)` | 현재 데이터로 화면만 다시 그립니다. Init, Loaded 는 다시 실행되지 않습니다. |
| `Current.step.restart()` | 스텝을 처음부터 다시 시작합니다. Init, Loaded 가 다시 실행됩니다. |

### 4-2. 이동 함수와 이동 설정의 주의

함수 자동 생성이 만든 틀은 모든 인자를 따옴표로 감쌉니다.
`moveToPrev('Step1', 'false')`처럼 쓰면 문자열 `'false'`가 참으로 처리됩니다.
그 결과 이전 화면이 떠날 때 모습 그대로 보이고 바뀐 데이터가 반영되지 않습니다.
참과 거짓은 `true`, `false`로 따옴표 없이 쓰세요.

이동 대상이 여러 개면 조건을 위에서부터 모두 평가하고, 참인 것 중 마지막 대상으로 갑니다.
조건이 빈 대상은 항상 후보가 됩니다.
조건이 하나라도 있고 모두 거짓이면 이동하지 않습니다.
이동 조건식은 JavaScript 로 그대로 실행되며 `{=키}` 치환이 적용되지 않습니다.
조건식에서는 `_c.activeSector.<키>`처럼 JavaScript 로 값을 읽으세요.

조건에 따라 막아야 하는 이동은 하단 버튼의 [다음]에 걸지 마세요.
캔버스 버튼의 스텝 이동 설정을 쓰거나, 스크립트에서 조건을 확인한 뒤 `Current.step.moveToNext('<스텝ID>')`를 부르세요.

## 5. 스텝 이벤트의 순서

| Studio 표시 | 실행 시점 |
|---|---|
| [최초 시작 전 (Init)] | 화면을 그리기 전 |
| [로드 시 (Loaded)] | 화면을 그린 직후 |
| [뒤로가기로 돌아올 때] | 이전 스텝으로 돌아왔을 때(Loaded 대신 실행) |
| [다음으로 이동 전] | 다음 스텝으로 떠나기 전 |
| [앱에 다시 돌아올 때] | 앱이 백그라운드에서 돌아왔을 때 |

Init 에서 조회한 데이터는 처음부터 화면에 그려집니다.
Loaded 에서 바꾼 데이터는 화면이 이미 그려진 뒤라 그 영역을 `f.Content('<fid>').reload()`로 다시 그려야 보입니다.
`f.Component().hide()`처럼 화면 요소를 다루는 스크립트는 Init 이 아니라 Loaded 에 두세요.
이전 스텝으로 돌아올 때는 Loaded 가 다시 실행되지 않으므로, 재조회는 [뒤로가기로 돌아올 때]에 거세요.
로드 스크립트는 첫 진입, 다음 스텝 이동으로 진입, 스텝이나 그룹을 reload 할 때 실행됩니다.

## 6. 스크립트 자리별로 쓸 수 있는 것

같은 JavaScript 라도 어디에 쓰는 코드냐에 따라 쓸 수 있는 변수가 다릅니다.

| 자리 | 모양 | 쓸 수 있는 것 | 주의 |
|---|---|---|---|
| 이벤트 스크립트 액션 | 본문 | `_c`, `_v`, `_base`, `f`, `Current` | `sector` 변수는 없습니다. `{=키}` 치환이 먼저 일어납니다. |
| 로드 스크립트(컨트롤) | 본문, 반환값 무시 | `Load.control`, `Load.layout`, `Load.sector` | `f.Content`, `f.Component`, `f.Event`, `f.SheetControl` 은 이벤트 스크립트 전용입니다. |
| 속성 값의 `{% %}` | `return` 필요 | `Load.sector.<키>` | 반복 행의 값은 `Load.sector`로 읽습니다. |
| 이동 조건식 | 식 하나 | `_c` | `{=키}` 치환이 없습니다. |
| 필터 Custom | `return` | `sector` | `Load`는 쓸 수 없습니다. |
| 서비스 Before / After Script | 본문 | `paramBlocks` / `resultBlocks` | 받은 값을 그 자리에서 고칩니다. |
| 비동기 Then / Catch / Finally | 본문 | 이벤트 스크립트와 같음 | `{=키}` 치환이 먼저 일어납니다. |
| 서브시나리오 호출 전후 스크립트 | 본문 | `_c` | 이때 `_c`는 서브시나리오 쪽 컬렉션입니다. |
| API 연동 전처리 / 후처리 | `return` | `paramBlocks` / `resultBlocks` | 서버에서 실행되어 `f`, `_c`가 없습니다. 시간 제한이 있습니다. |

| 이름 | 뜻 |
|---|---|
| `_c` | 현재 시나리오의 컬렉션(화면 데이터). `_c.<카테고리>`, `_c.activeSector` |
| `_v` | 전역 변수. 스크립트 액션은 실행마다 새로 시작하므로 다음 실행까지 남길 값은 `_v`에 둡니다. |
| `_base` | 로그인 사용자와 앱 정보. `_base.User`, `_base.App`, `_base.Company`, `_base.LanguageSeq` |
| `Current` | 현재 스텝, 시나리오, 누른 컨트롤. `Current.step`, `Current.scenario.id`, `Current.targetID` |
| `Load` | 로드 스크립트에서 지금 그리는 컨트롤과 행 |

공식 문서 기준으로 서브시나리오와 호출한 시나리오는 같은 `_v`를 함께 씁니다.
서브시나리오에서는 겹치지 않는 키를 쓰거나 돌아갈 때 정리하세요.

## 7. 스크립트 안의 {=키} 치환

이벤트 스크립트는 실행 직전에 `{=키}`를 현재 Active 섹터의 값 글자로 바꾼 다음 실행됩니다.
비동기 Then, Catch, Finally 스크립트도 같습니다.

```javascript
const name = '{=<키>}';            // 문자열이면 따옴표로 감쌉니다
const name2 = _c.activeSector.<키>; // 권장: JavaScript 로 직접 읽습니다
```

이 코드가 하는 일:
첫 줄은 실행 직전에 값이 글자로 들어간 코드가 됩니다.
따옴표가 없으면 값이 변수 이름으로 읽혀 오류가 나고 남은 액션이 조용히 취소됩니다.
값에 작은따옴표나 줄바꿈이 있으면 코드가 깨집니다.
값이 없으면 빈 글자가 됩니다.
스크립트에서는 `_c.activeSector.<키>`나 `_c.<카테고리>[0].<키>`로 읽고, `{=키}`는 라벨 문구와 속성 값에 쓰세요.
스크립트 본문에 설명용으로 `{= }`나 `{% %}` 글자를 적어 두어도 치환되어 코드가 깨집니다.

## 8. 서브시나리오 왕복 규칙

컬렉션은 시나리오마다 따로 있습니다.
서브시나리오로 데이터를 보내고 돌려받으려면 호출 설정에서 넘길 범위를 정해야 합니다.

| 상황 | 할 일 |
|---|---|
| 내려갈 때 데이터가 사라짐 | [컬렉션 복사]를 켜세요. 조회로 불러온 목록은 상태 필터를 전체로 두세요. |
| 내려갈 때 선택한 한 건만 | 상태 필터 active 는 Active 섹터 1건만 넘깁니다. |
| 돌아올 때 편집한 행을 부모에 반영 | [서브시나리오의 콜렉션으로 대체하기]를 켜고 상태 필터를 수정(updated)으로 두세요. |
| 부모의 다른 데이터가 사라짐 | 대체하기는 병합이 아니라 통째로 바꿉니다. 하위에서 DB 에 저장하고 부모의 [뒤로가기로 돌아올 때]에서 다시 조회하세요. |
| 돌아온 뒤 할 일 | 부모 Init 은 다시 실행되지 않습니다. [뒤로가기로 돌아올 때]에 거세요. |

요약하면 내려갈 때는 active, 올라올 때는 updated 입니다.
여러 단계로 중첩되면 경로의 모든 단계에서 상태 필터를 맞춰야 끝까지 전달됩니다.
버튼의 [콜렉션 이전 상태로 복원하기]는 서브시나리오에서 부모로 돌아갈 때는 무시됩니다.

| 방식 | 쓰는 때 |
|---|---|
| 서브시나리오 | 같은 흐름 안에서 재사용하고, 돌아오고, 데이터를 주고받을 때 |
| `f.Frame.scenario(scenarioID, stepID)` | 다른 시나리오를 새로 시작할 때(이전 데이터는 이어지지 않음) |
| `f.Frame.popUp(scenarioID, stepID)` | 현재 화면 위에 잠깐 띄울 때 |

`f.Frame` 계열은 디버거에서 동작하지 않으므로 배포한 앱에서 확인하세요.

## 9. 주요 함수 표

시그니처는 공식 스크립트 명세서 표기입니다.
여기 없는 함수나 인자는 지어내지 말고 Studio 스크립트 액션의 [함수 자동 생성]으로 정확한 이름을 확인하세요.

### 9-1. 알림과 이동

| 함수 | 하는 일과 주의 |
|---|---|
| `f.Toast().title(...).description(...).color(...).icon(...).delay(초).position('top')` 후 `.show()` | 잠깐 떴다 사라지는 알림입니다. position 은 top, center, bottom 중 하나입니다. |
| `f.MessageBox(type)` + `.setTitle(title)`, `.setDescription(description)`, `.show()` | 확인 창입니다. type 은 Alert, Error, Completed 입니다. 입력은 받을 수 없습니다. |
| `f.MessageBox().addBtn(title, eventName)` | 공식 함수 명세의 이름입니다. 세 번째 인자 color 에 true 를 주면 회색 버튼이 됩니다. |
| `f.Message(txtTitle)` + `.setBody(content)`, `.addReceiver(fBaseUserNo, isAlarmOff)`, `.addAction(title, scenarioID, stepID, sectors)`, `.send()` | 앱 푸시를 보냅니다. 디버거에서 실행해도 실제로 발송됩니다. |
| `f.Mail()` + `.setTitle(title)`, `.setBody(content)`, `.addReceiver(mail)`, `.send()` | 메일을 보냅니다. 디버거에서도 실제로 발송됩니다. [확인 필요] 첨부 등 지원 범위 |
| `f.LoadingView.show()`, `f.LoadingView.hide()` | 로딩 표시를 켜고 끕니다. |
| `f.Event(eventName).runNext()`, `f.Event().break()` | 3절 참고. 이벤트 스크립트 전용입니다. |
| `f.Frame.popUp(scenarioID, stepID)`, `f.Frame.scenario(scenarioID, stepID)`, `f.Frame.setTitle(title)` | 디버거에서 동작하지 않습니다. [확인 필요] `f.Frame.scenario(...)` 뒤에 `.open()`을 붙이는 형식 |
| `f.Link.createAppLink(value, isPc)`, `f.Link.getLinkParam()`, `f.Link.init()` | 앱 링크로 값을 넘기고 받습니다. `_base.linkParam`은 지원 종료 예정입니다. |
| `f.Auth.check(authKey)` | 권한키가 있는지 확인합니다. 탭별 권한은 탭 클릭 이벤트에서 이 함수로 막습니다. |

### 9-2. 컬렉션

| 함수 | 하는 일과 주의 |
|---|---|
| `sector.set(key1, value, key2, value..)` | 값을 바꾸고 연결된 컨트롤을 다시 그립니다. 값 변경은 항상 이것으로 하세요. `sector.<키> = 값` 직접 대입은 저장 대상에서 빠집니다. |
| `sector.delete()` | 저장된 행이면 삭제 상태가 되어 서버에도 삭제로 보내집니다. 저장 전 새 행이면 메모리에서 사라집니다. |
| `f.Collection.addSector(obj, categoryName)` | 새 행을 만듭니다. 상태가 비어 있으므로 신규로 저장하려면 만든 행에 `setStatus('added')`를 하세요. |
| `f.Collection.removeSector(status, categoryName)` | 상태가 먼저입니다. 메모리에서만 지우므로 서버 삭제가 아닙니다. 카테고리를 빼면 전체가 대상입니다. |
| `f.Collection.updateSector(status, collectionKey, value, categoryName)` | 조건에 맞는 행의 값을 한꺼번에 바꿉니다. |
| `f.Collection.moveCategory(targetCategory, status, moveCategory)` | 카테고리가 먼저입니다. 행을 다른 카테고리로 옮깁니다. |
| `f.Collection.filter(collectionKey, Operator, value)` | 카테고리를 가리지 않고 키 이름으로 찾습니다. |
| `f.Collection.createCategory(categoryName)`, `f.Collection.removeCategory(categoryName)` | 카테고리를 만들거나 묶음만 풉니다. |

status 값은 all, active, selected, last, added, updated, deleted 입니다.
빈 문자열로 두면 전체가 대상이 되어 의도하지 않은 전체 삭제가 생길 수 있습니다.
`setStatus` 인자는 소문자 `'added'`, `'updated'`, `'deleted'`만 쓰세요.

### 9-3. 화면과 시트

| 함수 | 하는 일과 주의 |
|---|---|
| `f.Content(fid, sectorSUID)` + `.reload()`, `.show()`, `.hide()`, `.addRow(categoryName, isFocus)`, `.delRow(isReleaseSector)` | 그룹과 레이아웃을 다룹니다. 다시 그리기는 필요한 그룹만 하세요. |
| `f.Component(fid, sectorObject)` + `.getInputValue()`, `.setInputValue(value)`, `.getText()`, `.setText(value)`, `.focus()`, `.show()`, `.hide()` | 개별 컨트롤을 다룹니다. `hide()`로 숨긴 필수 입력은 필수 검사에서 빠집니다. |
| `f.SheetControl(fid, sector)` + `.reloadSheet()`, `.reloadData()`, `.syncData()`, `.syncSector(sector)`, `.addEmptyRow(num)`, `.deleteRow(sector)`, `.sort(keyOrFn, order)` | 시트를 다룹니다. `setCellValue`는 없습니다. 셀 값은 행의 `set`으로 바꾸세요. |
| `f.Sheet.download(category, fileName, keys, headers, descriptions)`, `f.Sheet.insert(categoryName, eventName)` | 엑셀 내려받기와 올리기입니다. PC 웹에서만 동작합니다. |

시트 값은 시트가 아니라 연결된 카테고리 `_c.<카테고리>`에서 읽으세요.

### 9-4. 날짜, 숫자, 기기, 파일

| 함수 | 하는 일과 주의 |
|---|---|
| `f.Date(DateString, FormatString)` + `.format(formatToken)`, `.getDate()`, `.getDatetime()` | 날짜를 만들고 문자열로 꺼냅니다. |
| `.getCalcDate(formatType, value)`, `.getFirstDateOfMonth()`, `.getLastDateOfMonth()`, `.setDate(date)` | 날짜 객체를 돌려줍니다. 값을 쓰려면 뒤에 `.getDate()`나 `.format(...)`을 이어 붙이세요. |
| `.getHours()`, `.getMinutes()`, `.getSecond()` | [확인 필요] 반환 타입이 숫자인지 문자열인지 문서마다 다릅니다. `typeof`로 확인하세요. |
| `f.numFormat(value)` + `.round(digits)`, `.floor(digits)`, `.ceil(digits)`, `.format(digits, toFix, mode)` | 숫자를 반올림하거나 형식을 맞춥니다. [확인 필요] format 의 mode 값은 문서에 "ceil" 예시만 있습니다. |
| `f.Time.getServerTime(isAsync, eventName)` | 서버 시간을 받아 `f.Time.serverTime`에 넣습니다. 오류는 `f.Time.error`입니다. |
| `f.Native.getBarcode(isSync, eventName, isMulti)` | 스캔 결과는 eventName 이벤트에서 `f.Barcode.value`로 읽습니다. 실패는 `f.Barcode.error`입니다. PC 브라우저에서는 웹캠 스캔으로 대신하며 정확도가 낮습니다. |
| `f.Scanner.init(options)`, `f.Scanner.startScan()`, `f.Scanner.stopScan()`, `f.Scanner.getLastScannedData()` | PDA 와 카메라 연속 스캔입니다. [확인 필요] options 항목 |
| `f.Native.getGPS(isSync, eventName, isNavigator)` | 위치를 받아 `f.GPS`에 넣습니다. [확인 필요] `f.GPS`의 속성 이름 |
| `f.File.download(filekey, target, directory)` | target 은 공유 범위(tenant 또는 user)입니다. directory 는 PC 폴더가 아니라 서버 저장소 구분입니다. 올릴 때와 같은 공유 범위로 받아야 합니다. |

[확인 필요] 첫 인자 isSync, isAsync 의 true 와 false 의미는 함수마다 반대로 보일 수 있습니다.
디버거에서 두 값을 모두 시험하고 결과 이벤트가 언제 실행되는지 확인하세요.

## 10. 자주 나는 증상

| 보이는 것 | 원인 | 조치 |
|---|---|---|
| 버튼을 눌러도 아무 일이 없음 | 앞 스크립트 오류로 남은 액션 취소 | F12 콘솔과 디버거 실행 내역에서 오류 문구를 확인하세요. |
| 이동 코드 아래 줄이나 저장 서비스가 먼저 실행됨 | 이동은 예약이라 맨 뒤에 실행 | 이동을 막을 때는 조건문으로 부르지 않거나 `break()`를 쓰세요. |
| 체크 오류 뒤에 이어서 이벤트를 실행하고 싶음 | 서비스 실패 뒤 액션은 실행되지 않음 | 결과 값을 스크립트로 검사하고 `f.MessageBox`로 직접 알리세요. |
| 이전 화면으로 돌아왔는데 값이 옛 값 | Loaded 는 다시 실행되지 않음, 또는 `'false'` 문자열 인자 | [뒤로가기로 돌아올 때]에서 재조회하고, 인자는 따옴표 없이 쓰세요. |
| 아무 행도 안 눌렀는데 첫 행이 저장됨 | 선택이 없으면 `_c.activeSector`는 첫 행을 돌려줌 | 저장과 삭제 전에 키 값으로 그 행이 맞는지 확인하세요. |
| `Cannot read properties of undefined (reading 'length')` | 마지막 행을 지워 카테고리가 사라짐 | `(_c.<카테고리> || [])`로 감싸서 읽으세요. |
| 컨트롤 이벤트에서 step reload 후 무한 로딩 | 컨트롤 이벤트에서 스텝 전체를 다시 그리면 무한 리로드가 됨 | 필요한 그룹만 `f.Content('<fid>').reload()` 하세요. |
| 삭제했는데 DB 에서 안 지워짐 | `f.Collection.removeSector`는 메모리만 지움 | `sector.delete()` 후 저장 서비스를 호출하세요. |
| 신규로 보냈는데 수정으로 처리됨 | 스크립트로 만든 행은 상태가 비어 있음 | 만든 직후 `setStatus('added')`를 하세요. |

## 11. 아직 확인되지 않은 것

아래 항목은 단정하지 말고 [확인 필요]를 붙인 뒤, [함수 자동 생성] 결과나 디버거 실측으로 확인하라고 안내하세요.

1. 하단 버튼 [다음]의 클릭 이벤트에서 `f.Event().break()`가 이동을 막는지.
2. `f.Date().getHours()` 등의 반환 타입.
3. `isSync`와 `isAsync` 첫 인자의 정확한 의미.
4. `f.GPS`의 속성 이름과 `f.Scanner.init(options)`의 항목.
