# 공식 스크립트 명세 요약: f.Event ~ f.MessageBox

이 파일이 답하는 질문: f.Event ~ f.MessageBox 함수의 뜻, 파라미터(필수 여부·타입·설명), 기본값, 예시

공식 스크립트 명세(https://docs.flextudio.com/flextudio)의 쪽마다 개요, 파라미터, 예시 앞부분을 옮긴 것입니다.
다른 참조 파일의 규칙(실측·검증된 동작)과 다르면 그쪽을 따르세요. 명세 예시 코드에는 오타가 있을 수 있으니 그대로 복사하지 말고 부르는 꼴을 기준으로 다시 쓰세요.

목차: f.Event() / f.Event().break() / f.Event().runNext() / f.File / f.File.download() / f.Frame / f.Frame.popUp() / f.Frame.popUp().remove() / f.Frame.popUp().setOptions() / f.Frame.popUp().setSectors() / f.Frame.popUp().setTargetApp() / f.Frame.popUp().setTargetPack() / f.Frame.popUp().show() / f.Frame.scenario() / f.Frame.setTitle() / f.Frame.tab / f.Frame.tab.focus() / f.Frame.tab.hide() / f.Frame.tab.show() / f.Frame.topMenu / f.Frame.topMenu.button / f.Frame.topMenu.target / f.Frame.window / f.Frame.window\.location() / f.GPS / f.History / f.IP / f.Link / f.Link.createAppLink() / f.Link.getLinkParam() / f.Link.init() / f.LoadingView / f.LoadingView\.hide() / f.LoadingView\.show() / f.Mail() / f.Mail().addReceiver() / f.Mail().send() / f.Mail().setBody() / f.Mail().setIsBodyHtml() / f.Mail().setIsGroup() / f.Mail().setTitle() / f.Message() / f.Message().addAction() / f.Message().addReceiver() / f.Message().send() / f.Message().setActionJson() / f.Message().setBody() / f.Message().setTitle() / f.Message.clearBadge() / f.MessageBox() / f.MessageBox().addBtn() / f.MessageBox().setDescription() / f.MessageBox().setTitle() / f.MessageBox().show()

### f.Event()
부르는 꼴: `f.Event(eventName)`
`f.Event()` 를 통해 이벤트를 제어할 수 있습니다. 이벤트는 큐(Queue) 형식으로 순차적으로 실행됩니다.
이벤트 스크립트 내에서만 사용 가능합니다. 이를 통해 스크립트 종료 후 실행될 다음 이벤트의 동작을 제어할 수 있습니다.
파라미터:
- eventName / 조건부 필수 / String / runNext() 사용시 필수 / 대상 이벤트 명
기능요소:
- runNext() / 다음 실행될 이벤트를 큐에 맨 앞에 추가
- break() / 실행 중인 이벤트를 중단

### f.Event().break()
실행 중인 이벤트를 중단시킬 수 있습니다.
이벤트 스크립트에서만 사용할 수 있습니다. 이 스크립트를 사용하면 이벤트 스크립트가 종료된 후 이벤트가 중단됩니다. 즉시 중단이 필요한 경우, 스크립트 실행 후 `return`을 사용해 스크립트를 종료해야 합니다.
예시:
```javascript
// 실행중인 이벤트를 중단시킵니다.
f.Event().break()
```

### f.Event().runNext()
부르는 꼴: `f.Event(eventName).runNext()`
`f.Event(eventName)` 를 통해 지정된 이벤트를 다음 실행될 이벤트로 이벤트 큐 맨앞에 추가합니다. f.Event()의 eventName은 필수입니다.
이벤트 스크립트 내에서만 사용 가능합니다. 이 스크립트를 사용하면, 이벤트 스크립트 종료 후 지정된 이벤트가 실행됩니다.
예시:
```javascript
// 이벤트 스크립트 종료 후 targetEvent를 실행시킵니다.
f.Event('targetEvent').runNext()
```

### f.File
f.File을 통해 파일 관련 함수에 접근할 수 있습니다.

### f.File.download()
부르는 꼴: `f.File.download(filekey, target, directory)`
f.File.download를 통해 FlexFile에 저장되어있는 파일을 다운로드할 수 있습니다.
파라미터:
- filekey / Yes / String / 다운로드 할 파일의 파일키입니다. 이 값으로 어떤 파일인지 탐색하기 때문에 필수입니다.
- target / No / String / 'user' 또는 'tenant' / 파일의 공유 범위에 대한 옵션입니다. 기본값은 'tenant'입니다.
- directory / Yes / String / 다운로드 할 파일의 이름을 입력합니다.
예시:
```javascript
// 파일을 다운로드 합니다.
const fileKey = _collections.activeSector.fileKey;
const boundary = _collections.activeSector.boundary;
const directory = _collections.activeSector.directory; 
f.File.download(fileKey, boundary, directory);
```

### f.Frame
f.Frame을 통해 앱 프레임에 접근할 수 있습니다.
f.Frame은 이벤트 스크립트에서 사용할 수 있으며 디버거에서는 동작하지 않습니다.
기능요소:
- tab / 앱 설정의 탭바를 숨기고 보이게 할 수 있는 변수
- topMenu / 앱의 상단 메뉴에 접근할 수있는 변수
- window / frame의 window에 접근할 수 있는 변수
- popUp() / 특정 시나리오를 팝업으로 열수있는 함수
- setTitle() / 상단 타이틀을 설정할 수 있는 함수
- scenario() / 시나리오를 열 수 있는 함수

### f.Frame.popUp()
부르는 꼴: `f.Frame.popUp(secnarioID, stepID)`
시나리오를 팝업 형태로 띄울 수 있습니다.
f.Frame은 이벤트 스크립트에서 사용할 수 있으며 디버거에서는 동작하지 않습니다.
파라미터:
- secnarioID / No / String / 팝업으로 띄울 시나리오 ID
- stepID / No / String / 시작 스텝 ID
기능요소:
- scenarioID / 시나리오 ID
- stepID / 스텝 ID
- sectorsJson / setSectors로 섹터 사용하는경우 설정된 데이터의 json결과
- options / setOptions로 옵션 설정한 경우 설정된 option들의 상태
- setOptions() / 팝업 옵션 설정 함수
- setSectors() / 섹터 설정함수
- setTargetApp() / 다른 앱의 시나리오 사용시 앱을 지정할 수 있는 함수
- setTargetPack() / 다른 팩의 시나리오 사용시 팩을 지정할 수 있는 함수
- show() / 팝업 띄우기 함수
- remove() / 팝업 제거 함수

### f.Frame.popUp().remove()
f.Frame.popUp().remove()를 통해 팝업을 제거합니다.
f.Frame은 이벤트 스크립트에서 사용할 수 있으며 디버거에서는 동작하지 않습니다.
예시:
```javascript
// 현재 열려있는 팝업을 닫습니다.
f.Frame.popUp().remove();
```

### f.Frame.popUp().setOptions()
부르는 꼴: `f.Frame.popUp().setOptions(target, key, value)`
f.Frame.popUp().setOptions()를 통해 팝업 시나리오의 옵션을 설정할 수 있습니다. 옵션은 필요한 경우에만 사용하면 됩니다.
f.Frame은 이벤트 스크립트에서 사용할 수 있으며 디버거에서는 동작하지 않습니다.
파라미터:
- target / Yes / Object
- key / Yes / Object / 옵션 키값
- value / true/false / 옵션 값
예시:
```javascript
// 팝업을 열기 전 옵션을 설정합니다.
let scenarioID = _collections.activeSector.scenarioid;
let stepID = _collections.activeSector.stepid;
let pop = f.Frame.popUp(scenarioID, stepID);
pop.setOptions(f.Frame.topMenu.target,f.Frame.topMenu.button.close,false);
pop.show();
```

### f.Frame.popUp().setSectors()
부르는 꼴: `f.Frame.popUp().setSectors(sectors)`
f.Frame.popUp().setSectors()를 통해 팝업 시나리오에 섹터를 할당해줄 수 있습니다.
f.Frame은 이벤트 스크립트에서 사용할 수 있으며 디버거에서는 동작하지 않습니다.
파라미터:
- sectors / Yes / Object
예시:
```javascript
// 팝업을 열기 전 sector를 연결해줍니다.
let scenarioID =_collections.activeSector.scenarioid;
let stepID = _collections.activeSector.stepid;
let sectors = _collections.activeSector;
let pop = f.Frame.popUp(scenarioID,stepID);
pop.setSectors(sectors);
pop.show();
```

### f.Frame.popUp().setTargetApp()
부르는 꼴: `f.Frame.popUp().setTargetApp(sectors)`
f.Frame.popUp().setTargetApp()를 통해 팝업을 열때 다른 앱의 시나리오를 사용할 수 있습니다.
다른 앱은 “앱 가져오기”를 통해 연결한 앱만 사용 가능합니다.
f.Frame은 이벤트 스크립트에서 사용할 수 있으며 디버거에서는 동작하지 않습니다.
"앱 가져오기" 기능(beta)은 Enterprise 플랜 이상의 초대 앱인 경우 사용하실 수 있습니다.
파라미터:
- AppID / Yes / String / 다른 앱의 아이디를 전달한다.
예시:
```javascript
// 팝업을 열기 전 다른 App을 연결해줍니다.
let scenarioID =_collections.activeSector.scenarioid;
let stepID = _collections.activeSector.stepid;
let referAppID = _collections.activeSector.referAppID;
let pop = f.Frame.popUp(scenarioID,stepID);
pop.setTargetApp(referAppID);
pop.show();
```

### f.Frame.popUp().setTargetPack()
부르는 꼴: `f.Frame.popUp().setTargetPack(sectors)`
f.Frame.popUp().setTargetPack()를 통해 팝업을 열때 다른 팩의 시나리오를 사용할 수 있습니다.
다른 팩은 “앱 가져오기”를 통해 연결한 앱의 팩만 사용 가능합니다.
f.Frame은 이벤트 스크립트에서 사용할 수 있으며 디버거에서는 동작하지 않습니다.
"앱 가져오기" 기능(beta)은 Enterprise 플랜 이상의 초대 앱인 경우 사용하실 수 있습니다.
파라미터:
- PackID / Yes / String / 다른 팩의 아이디를 전달한다.
예시:
```javascript
// 팝업을 열기 전 다른 Pack을 연결해줍니다.
let scenarioID =_collections.activeSector.scenarioid;
let stepID = _collections.activeSector.stepid;
let referPackID = _collections.activeSector.referPackID;
let pop = f.Frame.popUp(scenarioID,stepID);
pop.setTargetPack(referPackID);
pop.show();
```

### f.Frame.popUp().show()
f.Frame.popUp().show()를 통해 팝업을 띄웁니다.
f.Frame은 이벤트 스크립트에서 사용할 수 있으며 디버거에서는 동작하지 않습니다.
예시:
```javascript
// 팝업을 엽니다.
let scenarioID =_collections.activeSector.scenarioid;
let stepID = _collections.activeSector.stepid;
let pop = f.Frame.popUp(scenarioID,stepID);
pop.show();
```

### f.Frame.scenario()
부르는 꼴: `f.Frame.scenario(scenarioID, stepID)`
f.Frame.scenario()로 다른 시나리오를 호출할 수 있습니다.
f.Frame은 이벤트 스크립트에서 사용할 수 있으며 디버거에서는 동작하지 않습니다.
파라미터:
- scenarioID / Yes / String / 호출할 시나리오 ID
- stepID / String / 시작 스텝 ID
예시:
```javascript
// scenario-test 시나리오를 엽니다.
f.Frame.scenario("scenario-test").open();
```

### f.Frame.setTitle()
부르는 꼴: `f.Frame.setTitle(title)`
f.Frame.setTitle()로 앱 타이틀을 변경할 수 있습니다.
f.Frame은 이벤트 스크립트에서 사용할 수 있으며 디버거에서는 동작하지 않습니다.
파라미터:
- title / Yes / String / 앱 타이틀
예시:
```javascript
// 타이틀을 변경합니다.
f.Frame.setTitle("MyApp");
```

### f.Frame.tab
f.Frame.tab를 통해 하단 탭바에 접근할 수 있습니다.
f.Frame은 이벤트 스크립트에서 사용할 수 있으며 디버거에서는 동작하지 않습니다.
<div align="left"><figure><figcaption></figcaption></figure></div>
기능요소:
- focus() / 하단 탭바의 특정 탭 메뉴로 이동할 수 있는 함수
- show() / 앱 레이아웃의 하단 탭바를 보여주는 함수
- hide() / 앱 레이아웃의 하단 탭바를 숨기는 함수

### f.Frame.tab.focus()
f.Frame.tab.focus()를 통해 원하는 하단 탭의 메뉴를 보이게 할 수 있습니다.
f.Frame은 이벤트 스크립트에서 사용할 수 있으며 디버거에서는 동작하지 않습니다.
파라미터:
- index / No / Number / index는 0부터 시작 / 하단 탭 메뉴의 인덱스를 전달한다.
예시:
```javascript
f.Frame.tab.focus(1);
```

### f.Frame.tab.hide()
f.Frame.tab.hide()를 통해 하단 탭바를 숨김처리 할 수 있습니다.
f.Frame은 이벤트 스크립트에서 사용할 수 있으며 디버거에서는 동작하지 않습니다.
예시:
```javascript
f.Frame.tab.hide();
```

### f.Frame.tab.show()
f.Frame.tab.show()를 통해 하단 탭바를 보이게 할 수 있습니다.
f.Frame은 이벤트 스크립트에서 사용할 수 있으며 디버거에서는 동작하지 않습니다.
예시:
```javascript
f.Frame.tab.show();
```

### f.Frame.topMenu
f.Frame.topMenu를 통해 상단 메뉴에 접근할 수 있습니다.
f.Frame은 이벤트 스크립트에서 사용할 수 있으며 디버거에서는 동작하지 않습니다.
기능요소:
- target / 상단 메뉴 객체 갖고있는 변수
- button / 상단 메뉴버튼 객체 갖고있는 변수

### f.Frame.topMenu.button
부르는 꼴: `f.Frame.topMenu.button`
f.Frame.topMenu.button
f.Frame은 이벤트 스크립트에서 사용할 수 있으며 디버거에서는 동작하지 않습니다.
예시:
```javascript
// 팝업 생성시 f.Frame.topMenu.button.close을 매개변수로 지정하는 예시힙니다.
let pop = f.Frame.popUp("scenario-test");
pop.setOptions(f.Frame.topMenu.target,f.Frame.topMenu.button.close);
pop.show();
```

### f.Frame.topMenu.target
부르는 꼴: `f.Frame.topMenu.target`
f.Frame.topMenu.target
f.Frame은 이벤트 스크립트에서 사용할 수 있으며 디버거에서는 동작하지 않습니다.
예시:
```javascript
// 팝업 생성시 f.Frame.topMenu.target을 매개변수로 지정하는 예시힙니다.
let pop = f.Frame.popUp("scenario-test");
pop.setOptions(f.Frame.topMenu.target);
pop.show();
```

### f.Frame.window
부르는 꼴: `f.Frame.window`
f.Frame.window
f.Frame은 이벤트 스크립트에서 사용할 수 있으며 디버거에서는 동작하지 않습니다.
기능요소:
- location() / url 이동 함수

### f.Frame.window\.location()
부르는 꼴: `f.Frame.window\.location(url, isReplace)`
f.Frame.window\.location를 통해 페이지의 링크를 이동시킬 수 있습니다.
f.Frame은 이벤트 스크립트에서 사용할 수 있으며 디버거에서는 동작하지 않습니다.
파라미터:
- url / No / String / url
- isReplace / No / Boolean / true/false / replace여부
예시:
```javascript
// 특정 url로 이동하거나 현재 페이지를 새로고침합니다.
let url = "https://flextudio.com";
f.Frame.window.location(url);
f.Frame.window.location(); //현재 페이지 새로고침
```

### f.GPS
f.GPS을 통해 f.Native.getGPS()의 결과에 접근할 수 있습니다.
기능요소:
- latitude / 위도
- longitude / 경도
- address / 주소
- error / 오류메세지
예시:
```javascript
// GPS 결과값을 activeSector에 설정합니다.
_collections.activeSector.Latitude = f.GPS.latitude;
_collections.activeSector.Longitude = f.GPS.longitude;
_collections.activeSector.WkPlaceAddr = f.GPS.address;
```

### f.History
f.History를 통해 거쳐온 시나리오나 스텝을 알 수 있습니다.
기능요소:
- scenario / 현재 시나리오를 포함하여 서브시나리오를 통해 거쳐온 시나리오 내역을 반환
- step / 현재 스텝을 포함하여 현재 시나리오 내에서 거쳐온 이전 스텝을 반환
예시:
```javascript
// History의 첫번째 시나리오와 마지막 스텝을 가져옵니다.
const firstScenario = f.History.scenario[0];
const lastStep = f.History.scenario[f.History.scenario.length - 1];
```

### f.IP
f.IP을 통해 f.Native.getIP()의 결과에 접근할 수 있습니다.
기능요소:
- address / IP 주소
- error / 오류메세지
예시:
```javascript
// 섹터에 adress를 설정합니다.
_collections.activeSector.Address = f.IP.address;
```

### f.Link
f.Link를 통해 URL로 앱에 접근했을 때의 값을 사용 및 설정할 수 있습니다. 이를 통해 URL 파라미터를 쉽게 다룰 수 있습니다.
기능요소:
- init() / linkParam초기화
- getLinkParam() / linkParam 값 가져오기
- createAppLink() / 앱링크 생성하기

### f.Link.createAppLink()
부르는 꼴: `f.Link.createAppLink(value, isPc)`
`f.Link.createAppLink()`를 사용하여 현재 앱으로 접속하는 앱 링크를 생성할 수 있습니다. 이 기능을 통해 링크로 접속할 때 함께 받아올 값을 설정할 수 있습니다. 이를 통해 사용자가 특정한 상태나 데이터를 포함한 링크를 생성하여 다른 사용자와 공유할 수 있습니다.
파라미터:
- value / String, JSON / linkParam으로 설정할 데이터 값
- isPc / Boolean / PC-Web접속 링크로 생성 유무 (기본값은 false)

### f.Link.getLinkParam()
linkParam의 데이터 값을 포함한 URL로 앱을 접근했을 때 linkParam을 활용하여 시나리오를 처리할 수 있습니다.
linkParam을 처리하는 스크립트가 있을 경우 상황에 따라 f.Link.init()을 통한 초기화 과정이 필요합니다.
초기화 하지 않을 경우 상/하단 탭바, 메뉴를 통한 화면전환시 계속 linkParam을 사용하여 시나리오가 진행됩니다.
예시:
```javascript
// {appid}.app.flextudio.com?linkParam=Hello%2C%20World! 으로 앱 접근시
let linkParamValue = f.Link.getLinkParam(); // "Hello, World!"
```

### f.Link.init()
f.Link.init()로 linkParam의 값을 완전히 초기화시킬 수 있습니다.
linkParam을 처리하는 스크립트가 있을 경우 상황에 따라 f.Link.init()을 통한 초기화 과정이 필요합니다.
초기화 하지 않을 경우 상/하단 탭바, 메뉴를 통한 화면전환시 계속 linkParam을 사용하여 시나리오가 진행됩니다.
예시:
```javascript
// linkParam 초기화
f.Link.init()
```

### f.LoadingView
f.LoadingView을 통해 로딩 화면을 제어할 수 있습니다. 작업 시간이 필요한 경우나 비동기식 이벤트 처리를 할때 사용자가 Interaction을 막기 위해서 해당 함수를 사용할 수 있습니다.
기능요소:
- show() / 로딩뷰 생성
- hide() / 로딩뷰 숨김

### f.LoadingView\.hide()
f.LoadingView\.hide()로 로딩 화면을 숨길 수 있습니다.

### f.LoadingView\.show()
f.LoadingView\.show()로 로딩 화면을 보여줄 수 있습니다.

### f.Mail()
f.Mail()을 통해 메일 객체를 받을 수 있습니다. 아래의 함수들은 객체에 설정해주어야 합니다.
예시:
```javascript
f.Mail()
    .setTitle("제목")
    .setBody("내용입니다.")
    .addReceiver("<메일 주소>")
    .send();
    
or

let mail = f.Mail();
mail.setTitle("제목")
    .setBody("내용입니다.")
    .addReceiver("<메일 주소>")
// …
```

### f.Mail().addReceiver()
부르는 꼴: `f.Mail().addReceiver(mail)`
addReceiver()를 통해 수신자를 설정할 수 있습니다.
파라미터:
- mail / Yes / String / 수신자 메일
예시:
```javascript
// 메일을 보내기 전 수신자 메일을 설정합니다.
let mail = f.Mail();
mail.addReceiver("<메일 주소>");
...
mail.send();
```

### f.Mail().send()
send()를 통해 메일을 발송합니다.
예시:
```javascript
// f.Mail() 에서 설정한 내용으로 메일을 전송합니다.
let mail = f.Mail();
...
mail.send();
```

### f.Mail().setBody()
부르는 꼴: `f.Mail().setBody(content)`
setBody()를 통해 메일 내용을 설정할 수 있습니다.
파라미터:
- content / Yes / String / 본문 내용
예시:
```javascript
// 메일을 보내기 전 내용을 설정합니다.
let mail = f.Mail();
mail.setBody("Hello there.")
...
mail.send();
```

### f.Mail().setIsBodyHtml()
부르는 꼴: `f.Mail().setIsBodyHtml(isHtml)`
setIsBodyHtml()를 통해 메일 내용의 Html여부를 설정할 수 있습니다.
파라미터:
- isHtml / Yes / Boolean / true/false / Html여부
예시:
```javascript
// 메일을 보내기 전 본문 내용에 대한 html 여부를 설정합니다.
let mail = f.Mail();
mail.setIsBodyHtml(true);
...
mail.send();
```

### f.Mail().setIsGroup()
부르는 꼴: `f.Mail().setIsGroup(isGroup)`
setIsGroup()를 통해 수신자 그룹 메일 전송 여부를 설정할 수 있습니다.
파라미터:
- isGroup / Yes / Boolean / true/false / 수신자 그룹으로 메일 전송 여부
예시:
```javascript
// 메일을 보내기 전 수신자의 그룹에 대한 여부를 설정합니다.
let mail = f.Mail();
mail.setIsGroup(true);
...
mail.send();
```

### f.Mail().setTitle()
부르는 꼴: `f.Mail().setTitle(title)`
setTitle()를 통해 메일 제목을 설정할 수 있습니다.
파라미터:
- title / Yes / String / 제목
예시:
```javascript
// 메일을 보내기 전 제목을 설정합니다.
let mail = f.Mail();
mail.setTitle("Notice.");
...
mail.send();
```

### f.Message()
부르는 꼴: `f.Message(txtTitle)`
f.Message()을 통해 푸시알림을 사용할 수 있습니다.
기능요소:
- setTitle() / 메세지 제목 설정 함수
- setBody() / 메세지 내용 설정 함수
- addReceiver() / 수신인 설정 함수
- addAction() / 알림을 통해 사용자에 제공할 기능 정의
- setActionJson() / 알림을 통해 사용자에 제공할 기능 정의 (커스텀) (앱 알림을 통해서 해당 화면 이동 가능)
- send() / 전송
- clearBadge() / 알림 읽음 처리

### f.Message().addAction()
부르는 꼴: `f.Message().addAction(title, scenarioID, stepID, sectors)`
addAction()를 통해 알림의 버튼과 그 동작에 대한 설정을 할 수 있습니다.
addAction을 통해 알림을 보내는 경우는 앱에서 알림을 눌렀을 때 해당 화면으로 이동하지 않습니다. \
일관된 알림을 통한 화면이동을 위해서는 setActionJson을 활용해주세요.
파라미터:
- title / Yes / String / 버튼 이름
- scenarioID / Yes / String / 버튼 클릭시 실행할 시나리오ID
- stepID / No / String / 시나리오의 스텝ID
- sectors / No / Object / 시나리오에 전달할 섹터 설정

### f.Message().addReceiver()
부르는 꼴: `f.Message().addReceiver(fBaseUserNo, isAlarmOff)`
addReceiver()를 통해 수신자를 설정할 수 있습니다.
파라미터:
- fBaseUserNo / Yes / String / 수신자 번호
- isAlarmOff / No / Boolean / true/false / 사용자 디바이스 알림 여부
예시:
```javascript

let title = _c.activeSector.Title
let contents = _c.activeSector.Content
let receiver = _c.activeSector.RecieverID

let msg = f.Message().setTitle(title);
msg.setBody(contents);
msg.addReceiver(receiver,false);    //
```

### f.Message().send()
send()를 통해 푸시알림을 발송합니다.
예시:
```javascript

let title = _c.activeSector.Title
let receiver = _c.activeSector.RecieverID
let contents = _c.activeSector.Content
let buttonName = _c.activeSector.ButtonName
let scnearioID = _c.activeSector.ScenarioID
let stepID = _c.activeSector.StepID
let packID = _base.PackIDs[0];

let msg = f.Message().setTitle(title).setBody(contents).addReceiver(receiver,false)
msg.setActionJson({
                title:buttonName,
// …
```

### f.Message().setActionJson()
부르는 꼴: `f.Message().setActionJson(actionJson)`
setActionJson()를 통해 사용자에 제공할 기능을 직접 구조화된 데이터 배열을 설정할 수 있습니다.
파라미터:
- actionJson / Yes / Object / action
예시:
```javascript
let msg = f.Message('Noti Title').setBody('Noti Content')
msg.addReceiver('{=fBaseUserNo}')
msg.setActionJson({
    title:"OK",
    scenarioid:"scnearioID",
    step:'Step2',
    packid:_base.PackIDs[0];,     
    linkParam:"paramTest" 
});
```

### f.Message().setBody()
부르는 꼴: `f.Message().setBody(content)`
setBody()를 통해 알림 내용을 설정할 수 있습니다.
파라미터:
- content / Yes / String / 알림 내용
예시:
```javascript

let title = _c.activeSector.Title
let contents = _c.activeSector.Content

let msg = f.Message().setTitle(title)
msg.setBody(contents) //제목이 설정된 메세지에 setBody()를 사용해서 알림 내용을 설정할 수 있습니다.
```

### f.Message().setTitle()
부르는 꼴: `f.Message().setTitle(title)`
setTitle()를 통해 알림 제목을 설정할 수 있습니다. f.Message(txtTitle) 을 통해서도 생성이 가능합니다.
파라미터:
- title / Yes / String / 알림 제목
예시:
```javascript
// 화면에 입력한 값을 받아와 알림 제목 설정하기

let title = _c.activeSector.Title // 현재 activeSector의 Title값

let msg = f.Message().setTitle(title)
```

### f.Message.clearBadge()
부르는 꼴: `f.Message.clearBadge(timestamp)`
clearBadge()를 통해 알림에 대한 읽음 처리를 스크립트로 제어할 수 있습니다.
파라미터:
- No / number / 해당 timestamp에 해당하는 메시지만을 읽음 처리 / timestamp
예시:
```javascript

const timestamp = _c.activeSector.fTimeStamp; //activeSector 타임스탬프 값을 timestamp에 저장 
f.Messsage.clearBadge(timestamp); //저장한 timestamp 변수 사용
```

### f.MessageBox()
부르는 꼴: `f.MessageBox(type)`
f.MessageBox()을 통해 메시지 박스를 띄울 수 있습니다
기능요소:
- type / 메세지박스의 유형
- setTitle() / 메세지박스 제목 설정 함수
- setDescription() / 메세지박스 내용 설정 함수
- addBtn() / 메세지박스에 추가할 버튼 설정
- show() / 메세지박스 띄우기

### f.MessageBox().addBtn()
부르는 꼴: `f.MessageBox().addBtn(title, eventName)`
addBtn()를 통해 메세지박스에 버튼을 설정을 할 수 있습니다.
버튼은 여러개 설정할 수 있습니다.
파라미터:
- title / Yes / String / 버튼 이름
- eventName / Yes / String / 버튼 클릭시 실행할 이벤트명
- color / No / Boolean / 버튼 회색 색상 사용 여부
예시:
```javascript
// Some code
let msgBox = f.MessageBox();
...
msgBox.addBtn("확인", "saveEvent");
msgBox.addBtn("취소", null, true); // 취소 버튼의 색상은 회색으로 사용합니다.
msgBox.show();
```

### f.MessageBox().setDescription()
부르는 꼴: `f.MessageBox().setDescription(description)`
setDescription()를 통해 메세지박스 내용을 설정할 수 있습니다.
파라미터:
- description / Yes / String / 메세지박스 내용
예시:
```javascript
// Some code
let msgBox = f.MessageBox();
msgBox.setDescription("변경 후 수정할 수 없습니다.");
...
msgBox.show();
```

### f.MessageBox().setTitle()
부르는 꼴: `f.MessageBox().setTitle(title)`
setTitle()를 통해 메세지박스 제목을 설정할 수 있습니다.
파라미터:
- title / Yes / String / 메세지박스 제목
예시:
```javascript
// Some code
let msgBox = f.MessageBox();
msgBox.setTitle("저장합니다.");
...
msgBox.show();
```

### f.MessageBox().show()
show()를 통해 메세지박스를 띄웁니다.
예시:
```javascript
// Some code
let msgBox = f.MessageBox();
...
msgBox.show();
```
