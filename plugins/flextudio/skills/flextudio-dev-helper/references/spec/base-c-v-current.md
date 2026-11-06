# 공식 스크립트 명세 요약: _base, _c, _v, Current

이 파일이 답하는 질문: _base, _c, _v, Current 함수의 뜻, 파라미터(필수 여부·타입·설명), 기본값, 예시

공식 스크립트 명세(https://docs.flextudio.com/flextudio)의 쪽마다 개요, 파라미터, 예시 앞부분을 옮긴 것입니다.
다른 참조 파일의 규칙(실측·검증된 동작)과 다르면 그쪽을 따르세요. 명세 예시 코드에는 오타가 있을 수 있으니 그대로 복사하지 말고 부르는 꼴을 기준으로 다시 쓰세요.

목차: \_base / \_base.App / \_base.Company / \_base.LanguageSeq / \_base.linkParam / \_base.User / \_c / \_c.active / \_c.activeSector / \_c.added / \_c.addSector() / \_c.deleted / \_c.keys / \_c.last / \_c.lastSectors / \_c.remove() / \_c.selected / \_c.status / \_c.suids / \_c.updated / \_v / Current / Current.\_parentSector / Current.scenario / Current.scenario.id / Current.scenario.title / Current.step / Current.step.id / Current.step.moveToFirst() / Current.step.moveToNext() / Current.step.moveToParent() / Current.step.moveToPrev() / Current.step.prev / Current.step.prev.id / Current.step.reload() / Current.step.reloadWithAnimation() / Current.step.restart()

### \_base
현재 실행중인 상태의 앱, 고객, 사용자, 언어에 대한 정보를 \_base 를 통해서 확인 할 수 있습니다. \_base의 정보는 앱이 실행될 때 사용자 세션을 확인하면서 새로 가져오게 됩니다.
기능요소:
- App / 앱 정보 입니다.
- Company / 고객 정보 입니다.
- LanguageSeq / 언어 정보 입니다.
- linkParam / URL에 포함된 데이터입니다.
- User / 사용자 정보 입니다.

### \_base.App
앱 정보를 가져옵니다.
예시:
```javascript
const appId = _base.App.fAppID;
const appName = _base.App.fAppName;
const wsId = _base.App.fWorkspaceID;
```

### \_base.Company
고객 정보를 가져옵니다.
예시:
```javascript
const companyId = _base.Company.fBaseCompanyID;
const companyName = _base.Company.fBaseCompanyName;
```

### \_base.LanguageSeq
앱의 언어 설정을 가져옵니다.
예시:
```javascript
const langSeq = _base.LanguageSeq;
```

### \_base.linkParam
linkParam의 데이터 값을 포함한 URL로 앱을 접근했을 때 linkParam을 활용하여 시나리오를 처리할 수 있습니다.
이 스크립트는 지원 종료 예정입니다. f.Link 함수 사용을 권장합니다. f.Link
linkParam을 처리하는 스크립트가 있을 경우 상황에 따라 초기화 과정이 필요합니다. 초기화 하지 않을 경우 계속 linkParam을 사용하여 시나리오가 진행됩니다.
예시:
```javascript

// 시나리오상의 초기화 - 앱상단버튼, 메뉴, 하단탭을 통한 화면전환시 값이 다시 불러와집니다.
_base.linkParam = null;
```

### \_base.User
사용자 정보를 가져옵니다.
예시:
```javascript
const deptname = _base.User.fBaseDeptName;
const username = _base.User.fBaseUserName;
const userno = _base.User.fBaseUserNo;
```

### \_c
\_c로 시작하는 메서드는 컬렉션(Collection)과 카테고리(Category) 관련 기능을 제공합니다.
\_c는 애플리케이션 내에서 사용 가능한 전체 컬렉션을 지칭하며, 특정 카테고리의 데이터에 접근하기 위해 **`_c.카테고리명`** 형태로 사용되며 이들은Array를 상속받아 만들어져서 `Array`, `Block` 의 모든 프로퍼티와 함수를 함께 사용 할 수 있습니다.
예를 들어, 'CommuteCollection' 카테고리 내의 데이터를 활용하고자 할 때, `_c.CommuteCollection`을 통해 접근할 수 있습니다. 특히, 특정 섹터 내의 데이터에 접근하려면, `_c.CommuteCollection[0].InOutType` 처럼 인덱스를 사용하여 해당 섹터의 데이터를 지정할 수 있습니다.
더 나아가, 데이터를 연결하여 생성된 Content에 대해 사용자가 상호작용(예: 클릭)할 경우, 해당 섹터는 activeSector로 지정되어, `_c.CommuteCollection.activeSector.InOutType`을 통해 클릭된 섹터의 특정 데이터 항목을 이벤트 스크립트에서 활용할 수 있습니다.
기능요소:
- _c.addSector() / 컬렉션에 섹터를 추가하는 함수
- _c.status / 컬렉션의 모든 상태값들을 확인할 수 있는 변수
- _c.suids / Block안의 모든 섹터들의 SUID들의 배열
- _c.keys / Block 안의 모든 섹터에서 사용된 Key의 모음
- _c.active / active 상태의 섹터의 SUID를 반환
- _c.activeSector / activeSector의 SUID를 반환
- _c.last / 마지막으로 서비스에서 받아서 반영된 섹터들의 SUID들의 배열
- _c.lastSectors / 마지막으로 서비스에서 받아서 반영된 섹터들의 배열
- _c.added / Block내 sector.isAdded가 true인 섹터들의 SUID를 가지는배열
- _c.updated / Block내 sector.isUpdated가 true인 섹터들의 SUID를 가지는 배열
- _c.selected / Block내 sector.isSelected가 true인 섹터들의 SUID를 가지는배열
- _c.deleted / Block내 sector.isDeleted가 true인 섹터들의 SUID를 가지는 배열
- _c.remove() / 해당 suid의 섹터들을 모두 제거하는 함수

### \_c.active
다음 순서 중 먼저 나오는 Sector의 SUID를 반환합니다.
* 마지막으로 이벤트를 트리거한 Sector
* <없다면> 화면상에 보여지는 Block내 Sector들 중 첫번째(this.displayed\[0])의 Sector
* <없다면> 이 Block의 첫번째 Sector
예시:
```javascript
_c.active
```

### \_c.activeSector
다음 순서 중 먼저 나오는 Sector를 반환합니다.
* 마지막으로 이벤트를 트리거한 Sector
* <없다면> 화면상에 보여지는 Block내 Sector들 중 첫번째(this.displayed\[0])의 Sector
* <없다면> 이 Block의 첫번째 Sector
예시:
```javascript
_c.activeSector
```

### \_c.added
Block내 sector.isAdded가 true인 섹터들의 SUID를 배열로 반환합니다.
예시:
```javascript
_c.added    //["suid","suid","suid"]
```

### \_c.addSector()
부르는 꼴: `\_c.addSector(Object)`
파라미터:
- Object / No / Object / 없음 / 섹터로 생성하고 싶은 객체를 넣습니다. 없다면 SUID만존재하는 섹터가 생성됩니다.
예시:
```javascript
__c.addSector({'UserName' : '플렉스튜디오'})
```

### \_c.deleted
Block내 sector.isDeleted가 true인 섹터들의 SUID를 배열로 반환.
예시:
```javascript
_c.deleted    //["suid","suid","suid"]
```

### \_c.keys
Block 안의 모든 sector에서 사용된 Key의 모음이 배열로 반환됩니다.
예시:
```javascript
let arr = _c.keys;

for (let i = 0; i < arr.length; i++ ) {
    // 반복문을 통해 현재 Collection에서 사용되는 키값에 접근할 수 있습니다.
    if (arr[i] == 'UserName') {            
        ...
    }
}
```

### \_c.last
마지막으로 서비스에서 받아서 반영된 섹터들의 SUID들을 배열로 반환. 서비스를 보내지 않았다면 this.suids 를 반환.
예시:
```javascript
_c.last
```

### \_c.lastSectors
마지막으로 서비스에서 받아서 반영된 섹터들의 배열로 반환. 서비스를 보내지 않았다면 블럭내 모든 섹터를 배열로 반환합니다.
예시:
```javascript
_c.lastSectors
```

### \_c.remove()
부르는 꼴: `\_c.remove(...suids)`
파라미터:
- ...suids / NO / String / 타입이 String인 suid값들의 나열입니다.
예시:
```javascript
_c.remove(_c.activeSector['_SUID'])
```

### \_c.selected
Block내 sector.isSelected가 true인 섹터들의 SUID를 배열로 반환.
예시:
```javascript
_c.selected    //["suid","suid","suid"]
```

### \_c.status
Collection이 가지는 상태 정보를 반환. 각 상태에 해당하는 SUID를 확인할 수 있습니다.
예시:
```javascript
let statusArr = _c.status;
let added = statusArr['added']; //["1k5j5aOX"]
let lastReflected = statusArr['lastReflected'] // ["5OZhhMb5","UDrAB3I5","j0c3ll60","b53IzOf9","fPiQQld9","p7Ic6gp2","Up2K9jaJ","990FFahz","rXTWpHZs","bayYOyan","nuArAlRe","BY4l30Wu"]

// CollectionStatus {added: Array(3), updated: Array(1), deleted: Array(0), selected: Array(0), active: undefined, …}
```

### \_c.suids
Block 안의 모든 섹터들의 SUID들을 배열로 반환
예시:
```javascript
let arr = _c.suids;

for (let i = 0; i < arr.length; i ++) {
    // 반복문을 사용하여 i번째 suid 값에 접근
}
```

### \_c.updated
Block내 sector.isUpdated가 true인 섹터들의 SUID를 배열로 반환합니다.
예시:
```javascript
_c.updated    //["suid","suid","suid"]
```

### \_v
`_v`는 시나리오 전반에 걸쳐 공통으로 사용할 수 있는 전역 변수 및 함수를 관리하는 데 사용됩니다. 스크립트가 사용되는 모든 곳에서 `_v`를 정의하고 접근할 수 있습니다.
1. 서브시나리오를 사용하는 경우 서브시나리오와 호출한 서브시나리오의 \_v는 서로 같은 \_v를 바라보기 때문에 간섭이 있게 됩니다.
2. 서브시나리오로 호출을 할경우 \_v에 유니크한 키를 활용하던가 서브시나리오에서 원본 시나리오로 돌아갈 때 lifecycle 관리를 별도로 해주어야 합니다.
### **정의 가능한 위치**
`_v`는 다음과 같은 스크립트 환경에서 정의하고 사용할 수 있습니다
* **이벤트 스크립트**
* **로드 스크립트**
* **대체 표현식** **`{% %}`**
예시:
```javascript
// 변수 정의
_v.newVal = 'newValue';

// 함수 정의
_v.val_double = function(val) {
    return val * 2;
};
```

### Current
Load 되는 현재 시점에 대해서 데이터를 제공합니다.
기능요소:
- step / Step에 대한 설정을 할 수 있습니다.
- scenario / 현재 사용 중인 시나리오에 대한 값을 반환합니다.

### Current.\_parentSector
`Current._parentSector`를 통해 현재 Load되는 Layout, Group의 부모 그룹을 그려주는 섹터를 리턴합니다.
컴포넌트의 데이터연결 - Custom filter의 조건에서만 사용가능합니다.
대상 컴포넌트 : Layout, Group
예시:
```javascript
// 부모 섹터의 CustomerID와 같은 경우만 필터
if (Current._parentSector.CustomerID == sector.CustomerID) {
    return true;   
}
else {
    return false;
}
```

### Current.scenario
`Current.scenario` 를 통해 현재 사용 중인 시나리오에 대한 정보를 알 수 있습니다.
기능요소:
- id / scenario의 ID를 반환
- title / scenario의 Title을 반환

### Current.scenario.id
현재 시나리오의 ID 값을 반환합니다.
예시:
```javascript
Current.scenario.id     //id
```

### Current.scenario.title
현재 시나리오의 title 값을 반환합니다.
예시:
```javascript
Current.scenario.title     //title text
```

### Current.step
`Current.step` 을 통해 현재 스텝에 대한 정보를 알 수 있습니다.
기능요소:
- id / 현제 스텝의 ID 값을 반환
- prev / 이전 스텝
- restart() / 스텝 재시작
- reload() / 스텝의 요소들을 다시 그려줍니다.
- reloadWithAnimation() / 애니메이션과 함께 스텝의 요소들을 다시 그려줍니다.
- moveToFirst() / 시나리오의 시작 스텝으로 이동합니다.
- moveToNext() / 다음 스텝으로 이동합니다.
- moveToParent() / 서브시나리오 호출 전 시나리오로 이동합니다.
- moveToPrev() / 직전 스텝으로 이동합니다.

### Current.step.id
현재 스텝의 ID 값을 반환합니다.
예시:
```javascript
// StepHistory Step1 -> Step2 -> Step3

Current.step.id  //Step3
```

### Current.step.moveToFirst()
시나리오의 첫번쨰 스텝으로 이동하는 함수입니다.
예시:
```javascript
Current.step.moveToFirst();
```

### Current.step.moveToNext()
부르는 꼴: `Current.step.moveToNext(stepId, ignoreRequired, stepAnimation)`
다음 스텝으로 이동합니다. 다음 스텝은 파라미터에 스텝id를 통하여 지정할 수 있습니다.
파라미터:
- stepId / String / 이동할 스텝 아이디
- ignoreRequired / Boolean / 필수 체크를 사용하는 경우 체크를 무시하고 이동할 수 있는 설정입니다.
- stepAnimation / String / toRight: 우측에서 등장toLeft: 좌측에서 등장withDissolve: 밝기 변화 / 스텝 이동시 애니메이션 효과를 설정합니다.
예시:
```javascript
// 필수체크 무시하고 step2로 이동
Current.step.moveToNext('Step2', true, 'toRight')
```

### Current.step.moveToParent()
서브시나리오 호출 전의 스텝으로 이동할 수 있습니다.
예시:
```javascript
Current.step.moveToParent();
```

### Current.step.moveToPrev()
부르는 꼴: `Current.step.moveToPrev(stepId, isRestored, checkRequired)`
이전 스텝으로 이동합니다. 이전 스텝은 파라미터에 스텝id를 통하여 지정할 수 있습니다.
파라미터:
- stepId / String / 이동할 스텝 아이디
- isRestored / Boolean / 이전 스텝으로 돌아갈 때 컬렉션의 상태를 현재 상태로 유지할 것인지 이전 상태로 복원할 것인지에 대해 설정할 수 있습니다.
- checkRequired / Boolean / 필수 체크를 사용하는 경우 필수 체크를 사용할 것인지 설정 할 수 있습니다.
예시:
```javascript
Current.step.moveToPrev('Step1', false, false);
```

### Current.step.prev
이전 스텝의 정보를 반환
기능요소:
- id / 이전 스텝의 id값 반환

### Current.step.prev.id
이전 스텝의 정보의 ID값을 반환
예시:
```javascript
// StepHistory Step1 -> Step2 -> Step3

Current.step.prev.id //Step2
```

### Current.step.reload()
부르는 꼴: `Current.step.reload(isPositionReset)`
스텝에 있는 모든 요소들을 다시 그려줍니다. 스텝에 연결된 init, loaded 이벤트는 실행하지 않습니다. 해당 함수를 사용하여 변경된 데이터를 화면에 반영할 수 있습니다.
파라미터:
- isPositionReset / Boolean / false(또는 빈값) - 모든 이벤트가 완료된 후 스크롤 위치를 이전상태로 복원합니다.true - reload 후에 스크롤의 위치가 리셋됩니다.
예시:
```javascript
Current.step.reload();        // 스크롤 위치 이전상태로 복원
Current.step.reload(true);    // 스크롤 위치 리셋
```

### Current.step.reloadWithAnimation()
스텝에 있는 모든 요소들을 애니메이션과 함께 다시 그려줍니다 . 스텝에 연결된 init, loaded 이벤트는 실행하지 않습니다. 해당 함수를 사용하여 변경된 데이터를 화면에 반영할 수 있습니다.
예시:
```javascript
Current.step.reloadWithAnimation();
```

### Current.step.restart()
스텝을 재시작합니다. 스텝에 연결된 Init, Loaded 이벤트부터 시작됩니다.
예시:
```javascript
//Step을 재시작. Step의 생명주기 중 Init 부터 시작.
Current.step.restart()
```
