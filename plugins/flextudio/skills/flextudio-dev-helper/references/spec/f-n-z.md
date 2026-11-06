# 공식 스크립트 명세 요약: f.Native ~ f.User

이 파일이 답하는 질문: f.Native ~ f.User 함수의 뜻, 파라미터(필수 여부·타입·설명), 기본값, 예시

공식 스크립트 명세(https://docs.flextudio.com/flextudio)의 쪽마다 개요, 파라미터, 예시 앞부분을 옮긴 것입니다.
다른 참조 파일의 규칙(실측·검증된 동작)과 다르면 그쪽을 따르세요. 명세 예시 코드에는 오타가 있을 수 있으니 그대로 복사하지 말고 부르는 꼴을 기준으로 다시 쓰세요.

목차: f.Native / f.Native.close() / f.Native.getBarcode() / f.Native.getGPS() / f.Native.getIP() / f.Native.isOn / f.Native.openCall() / f.Native.openSMS() / f.Native.scanNFC() / f.Native.share() / f.Native.writeClipboard() / f.numFormat() / f.numFormat().ceil() / f.numFormat().floor() / f.numFormat().format() / f.numFormat().round() / f.Observer / f.Observer.init() / f.Observer.stop() / f.Observer.trigger() / f.Outlook() / f.Outlook.acceptEvent() / f.Outlook.cancelEvent() / f.Outlook.createEvent() / f.Outlook.declineEvent() / f.Outlook.getEvents() / f.Scanner / f.Scanner.getLastError() / f.Scanner.getLastScannedData() / f.Scanner.getLastScannedTimestamp() / f.Scanner.getScanHistory() / f.Scanner.getStatus() / f.Scanner.init() / f.Scanner.startScan() / f.Scanner.stopScan() / f.Script / f.Script.load() / f.Scroll / f.Scroll.offset / f.Scroll.toBottom() / f.Scroll.toSector() / f.Scroll.toTop() / f.Setting / f.Setting.User / f.Setting.User.get() / f.Setting.User.set() / f.Sheet / f.Sheet.download() / f.Sheet.formatDownload() / f.Sheet.insert() / f.SheetControl() / f.SheetControl().addEmptyRow() / f.SheetControl().deleteRow() / f.SheetControl().Focus / f.SheetControl().Focus.toCellAtVisual() / f.SheetControl().Focus.toCellByColKey() / f.SheetControl().Focus.toRowAtVisual() / f.SheetControl().Focus.toSectorCell() / f.SheetControl().Focus.toSectorRow() / f.SheetControl().reloadData() / f.SheetControl().reloadSheet() / f.SheetControl().Scroll / f.SheetControl().Scroll.toBottom() / f.SheetControl().Scroll.toCellAtVisual() / f.SheetControl().Scroll.toPercent() / f.SheetControl().Scroll.toRowAtVisual() / f.SheetControl().Scroll.toTop() / f.SheetControl().sort() / f.SheetControl().syncData() / f.SheetControl().syncSector() / f.TeamsBot() / f.TeamsBot().addReceiver() / f.TeamsBot().send() / f.TeamsBot().setBody() / f.TeamsBot().setImageURL() / f.TeamsBot().setTitle() / f.TeamsBot().setURL() / f.Time / f.Time.error / f.Time.getServerTime() / f.Time.serverTime / f.Toast / f.Toast().color() / f.Toast().delay() / f.Toast().description() / f.Toast().icon() / f.Toast().position() / f.Toast().show() / f.Toast().title() / f.User / f.User.isLogin() / f.User.logout() / f.User.snsLogin()

### f.Native
f.Native를 통해 네이티브 레벨의 기능을 사용할 수 있습니다.
기능요소:
- getGPS() / 현재 GPS 위경도를 가져오고 지정한 이벤트 실행
- getIP() / 연결 중인 IP 주소를 가져오고 지정한 이벤트 실행
- openCall() / 전화 앱으로 연결
- openSMS() / 문자 앱으로 연결
- getBarcode() / 바코드 이미지를 스캔하고 지정한 이벤트 실행
- writeClipboard() / 클립보드에 복사
- isOn / 모바일 앱을 사용하고 있는지 확인

### f.Native.close()
close()를 통해 앱을 강제 종료시킬 수 있습니다.
예시:
```javascript
//앱 강제종료
f.Native.close()  // 반환값 : 없음
```

### f.Native.getBarcode()
부르는 꼴: `f.Native.getBarcode(isSync, eventName, isMulti)`
getBarcode() 함수로 코드스캐너를 실행하여 스캔한 바코드/QR코드에 대한 데이터를 받아올 수 있습니다.
* 코드스캐너는 디버거 및 PC 환경에서는 카메라 해상도와 정확도 문제로 실제 모바일에서 보다 낮은 인식률을 보이게 됩니다.
* 기기에 내장된 카메라의 해상도에 따라 인식률에 차이가 있습니다. 이는 매우 작은 코드의 경우 특히 디바이스에 따른 인식률의 차이가 나게 됩니다.
파라미터:
- isSync / Yes / Boolean / true / false / Barcode 정보를 새로 받아 온 후에 하위 이벤트 액션을 실행하는 여부.
- eventName / Yes / String / 실행할 이벤트 이름(지정한 이벤트에서 f.Barcode.value로 바코드 정보를 받아올 수 있습니다.)
- isMulti / No / Boolean / true / false / Barcode 다중 스캔 여부한번의 스캔에 여러 바코드를 읽을 수 있습니다.
예시:
```javascript
// 비동기여부가 false이므로 바코드 정보를 받아오지 못한 경우에도 이벤트 'setBarcode'를 실행합니다.
f.Native.getBarcode(false,"setBarcode")
```

### f.Native.getGPS()
부르는 꼴: `f.Native.getGPS(isSync, eventName, isNavigator)`
getGPS()를 통해 위도와 경도 데이터를 받아올 수 있습니다.
디버거 및 PC 환경에서는 GPS 를 못가져올 수도 있습니다. 모바일은 상시 GPS 위치를 반환하지만 PC는 기기 및 GPS 신호 수신여부에 따라 반환되지 못할 수 있습니다.
모바일에서도 아주 아래와 같은 특정한 환경에서 는 상이한 위치를 받을 수도 있습니다.
* 실내 또는 GPS 수신이 되지 않고
* 중계기의 위치 정보나 IP 변화가 있을 경우
실내의 경우는 위치 대신에 공유기 IP(고정IP라면) 를 함께 확인하면 이런 문제를 줄일 수 있습니다.
앱 사용자에게는 일반적으로 아래와 같은 가이드로 GPS 위치 정보의 정확도를 올려 해결하실 수 있습니다. ​
* 모바일 와이파이 사용 (와이파이를 연결하지 않고, 사용만 하시더라도 정확도를 올릴 수 있으므로 사용을 추천함)
* 모바일 위치 정보 관리 > 지정한 위치 반경 범위를 길게 설정
* **Android** \
         \[모바일 설정 > 위치 > 위치 서비스 > Google 위치 정확도 > ON]\
         \[모바일 설정 > 애플리케이션 > FlexApp(앱 명칭) > 권한 > 위치 > 정확한 위치 사용 > ON]
* **iO …
파라미터:
- isSync / Yes / Boolean / true / false / GPS 정보를 새로 받아 온 후에 하위 이벤트 액션을 실행하는 여부.
- eventName / Yes / String / 실행할 이벤트 이름
- isNavigator / No / Boolean / true / false / GPS 정확도가 네비게이션 수준의 위치추적을 실행하는 설정
이 함수의 결과인 GPS 정보는 바로 반영되지 않습니다.  기기의 상태에 따라 시간이 다르게 걸릴 수 있기 때문에 새로 받아온 GPS 정보를 활용하기 위해서는 isSync를 활용하거나, eventName 을 주어서 새 GPS 정보를 받아 온 후에 다음 이벤트(액션)이 실행 되도록 해주세요.
함수 실행 결과는 f.GPS에서 접근해 사용할 수 있습니다.
예시:
```javascript
// GPS의 결과값을 받아올 때까지 대기한 후 displayGPS 이벤트를 실행합니다.
f.Native.getGPS(true, "displayGPS", true);
return;
```

### f.Native.getIP()
부르는 꼴: `f.Native.getIP(isAsync, eventName)`
getIP()를 통해 IP주소 데이터를 받아올 수 있습니다.
파라미터:
- isAsync / Yes / Boolean / true / false / IP정보를 받아올 때까지 다음 이벤트를 실행하지 않는 설정
- eventName / Yes / String / 실행할 이벤트 이름
함수 실행 결과는 f.IP에서 접근해 사용할 수 있습니다.

### f.Native.isOn
isOn 변수를 통해 모바일 앱을 사용하고 있는지 알 수 있습니다.
예시:
```javascript
// 모바일 앱을 사용하고 있는지 확인할 수 있습니다.
f.Native.isOn  // 모바일 앱인 경우 : true, 브라우저인 경우 : false
```

### f.Native.openCall()
부르는 꼴: `f.Native.openCall(number)`
openCall()를 통해 전화 앱으로 연결할 수 있습니다.
파라미터:
- number / Yes / String / 전화 앱에 연결할 연락처를 String 형태로 기입

### f.Native.openSMS()
부르는 꼴: `f.Native.openSMS(number)`
openSMS()를 통해 문자 앱으로 연결할 수 있습니다.
파라미터:
- number / Yes / String / 문자 앱에 연결할 연락처를 String 형태로 기입

### f.Native.scanNFC()
부르는 꼴: `f.Native.scanNFC(text)`
scanNFC() 함수로 모바일기기로 NFC를 스캔하고 결과 값을 확인할 수 있습니다.
예시:
```javascript
// 모바일기기로 NFC를 스캔하고 Promise 객체를 반환합니다.
f.Native.scanNFC()  // 반환값 : Promise 객체

// 모바일기기로 NFC를 스캔하는 경우, 성공 여부에 따른 처리 방법
f.Native.scanNFC()
.then((d) => {
    //결과값 형식은 문자열 배열입니다.
    console.log('성공:', d);
})
.catch((e) => {
    //오류메세지 형식은 문자열입니다.
    console.error('실패:', e);
// …
```

### f.Native.share()
부르는 꼴: `f.Native.share(text)`
share() 함수로 텍스트를 외부 앱을 통해 공유할 수 있도록 합니다.
파라미터:
- text / String / 공유시 사용할 텍스트
예시:
```javascript
// 반환값 : 없음
f.Native.share("[개발자 밈 월드컵] https://app.flextudio.com 참여하시고 상품 받아가세요!")
```

### f.Native.writeClipboard()
부르는 꼴: `f.Native.writeClipboard(text)`
writeClipboard() 함수로 클립보드에 원하는 내용을 복사할 수 있습니다.
파라미터:
- text / String / 클립보드에 복사할 텍스트.
예시:
```javascript
// 클립보드에 텍스트를 복사하고 Promise 객체를 반환합니다.
f.Native.writeClipboard("Hello, World!")  // 반환값 : Promise 객체

// 클립보드 복사 성공 여부에 따른 처리 방법
f.Native.writeClipboard("Hello, World!")
    .then((d) => {
        console.log('클립보드에 텍스트 복사 성공:', d);
    })
    .catch((e) => {
        console.error('클립보드에 텍스트 복사 실패:', e);
    });
```

### f.numFormat()
부르는 꼴: `f.numFormat(value)`
숫자의 소수점에 대하여 올림, 버림, 반올림이 가능합니다.
### 파라미터
| 파라미터명 | 필수여부 | 타입             | 제약사항 | 설명              |
| ----- | ---- | -------------- | ---- | --------------- |
| value | YES  | String, Number |      | 자릿수 처리 대상 값입니다. |

### f.numFormat().ceil()
부르는 꼴: `f.numFormat(value).ceil(digits)`
지정한 자리까지 올림합니다.
파라미터:
- digits / NO / Number, String / 미입력 시 소수점 이하를 올림 처리하여 정수로 반환합니다. / 숫자를 올림할 소수점 자릿수 입니다.
예시:
```javascript
f.numFormat(12.156).ceil(2); // output 12.16
f.numFormat(12.156).ceil(); // output 13
```

### f.numFormat().floor()
부르는 꼴: `f.numFormat(value).floor(digits)`
지정한 자리까지 버림합니다.
파라미터:
- digits / NO / Number, String / 미입력 시 소수점 이하를 버림 처리하여 정수로 반환합니다. / 숫자를 버림할 소수점 자릿수 입니다.
예시:
```javascript
f.numFormat(12.156).floor(2); // output 12.15
f.numFormat(12.156).floor(); // output 12
```

### f.numFormat().format()
부르는 꼴: `f.numFormat(value).format(digits, toFix, mode)`
올림, 버림, 반올림 하여 문자열로 반환합니다.
파라미터:
- digits / YES / Number, String / 숫자를 올림할 자릿수 입니다.
- toFix / YES / Boolean / value의  자릿수보다 digits값이 크다면 자릿수까지 0으로 채워넣습니다.
- mode / NO / String / 미입력 버림 처리하여 반환합니다. / 올림, 버림, 반올림 중 선택하여 처리합니다.
예시:
```javascript
f.numFormat(12.156).format(2, false, "ceil"); // output "12.16"
f.numFormat(12.156).format(5, true); // output "12.15600"
```

### f.numFormat().round()
부르는 꼴: `f.numFormat(value).round(digits)`
지정한 자리까지 반올림합니다.
파라미터:
- digits / NO / Number, String / 미입력 시 소수점 이하를 반올림 처리하여 정수로 반환합니다. / 숫자를 반올림할 자릿수 입니다.
예시:
```javascript
f.numFormat(12.156).round(2); // output 12.16
f.numFormat(12.153).round(2); // output 12.15
f.numFormat(12.156).round(); // output 12
```

### f.Observer
f.Observer를 통해 앱을 사용중인 사용자들끼리 통신을 할 수 있도록 합니다. 앱이 실행 중일 때 업데이트 내용을 바로 반영이 필요할 때 유용하게 쓰일 수 있습니다.
* Observer는 앱이 실행 중일 때 2시간 까지 커넥션이 유지되며 디버거에서는 10분간 유지됩니다.
* 앱이 백그라운드로 에서 포그라운드로 돌아오면 자동으로 재 연결이 되나 백그라운드 상태에서 Trigger 된 이벤트는 놓치게 됩니다.
* 한 타겟당 최대 동시 접속자는 1,000명으로 제한 됩니다.
기능요소:
- init() / Observer 실행 함수
- trigger() / init에 등록한 event를 호출하는 함수받은 message는 f.Observer.message에 저장됩니다.
- stop() / Observer 종료 함수
- message / 전달받은 메세지를 갖는 변수
- status / trigger 요청이 정상으로 추적되었는지 결과를 갖는 변수
- eventName / trigger가 일어날 경우 실행되는 이벤트명
- targetID / trigger가 발생할 타겟 ID

### f.Observer.init()
부르는 꼴: `f.Observer.init(eventName, target)`
init()를 통해 옵저버를 실행할 수 있습니다.
같은 target명으로 init()한 Observer에서 trigger가 일어날 경우 해당 EventName에 해당하는 이벤트를 실행시킵니다. 앱에서는 하나의 target만 init 가능하며 이전에 다른 target이 init 된 경우 자동으로 stop()후 새로운 Observer 활성화합니다.
파라미터:
- eventName / Yes / String / 실행할 이벤트 이름
- target / Yes / String / 옵저버 이름
예시:
```javascript
// MyObserver 라는 이름의 옵저버를 실행 후 trigger 시 동작할 이벤트로 Execute_Observer를 설정합니다.
f.Observer.init('Execute_Observer', 'MyObserver');
```

### f.Observer.stop()
trigger()를 통해 옵저버를 종료할 수 있습니다.
예시:
```javascript
// targetID와 이벤트를 확인하여 조건에 맞지 않을 경우 기존 옵저버를 종료하고 
// 원하는 옵저버로 실행합니다.
if (!f.Observer 
    || f.Observer.targetID != "MyObserver" 
    || f.Observer.eventName != "Execute_Observer") 
{
    f.Observer.stop();
    f.Observer.init("Execute_Observer", "MyObserver");
}
```

### f.Observer.trigger()
부르는 꼴: `f.Observer.trigger(message)`
trigger()를 통해 init()에서 등록한 이벤트를 실행합니다.
파라미터:
- message / Yes / String / 이벤트에 전달할 메세지
예시:
```javascript
// 설정한 이벤트로 'call observer' 메시지를 전달합니다.
f.Observer.trigger("call observer");
```

### f.Outlook()
Outlook 캘린더 앱을 연동할 수 있습니다.

### f.Outlook.acceptEvent()
부르는 꼴: `f.Outlook().acceptEvent(id, comment, isSendResponse, callbackfunction)`
요청받은 일정을 수락합니다.
파라미터:
- id / YES / String / 일정의 id 입니다.
- comment / YES / String / 일정 수락 메세지입니다.
- isSendResponse / YES / Boolean / false일 경우 comment 내용이 전달되지 않습니다. / 일정 생성자에게 응답 메일 전송 여부입니다.
- callbackFunction / NO / function / 파라미터isSuccess / 일정 수락 후 실행되는 함수입니다.
예시:
```javascript
var outlook = f.Outlook();
let id = "일정 ID";
let comment = "일정 수락합니다."; // or null
let isSendResponse = true;

outlook.acceptEvent(id, comment, isSendResponse, function(isSuccess) {
    if(status) {
        f.MessageBox('Completed').setTitle('처리 완료').setDescription('일정을 수락하였습니다.').addBtn('완료',null).show();
    }
});
```

### f.Outlook.cancelEvent()
부르는 꼴: `f.Outlook().cancelEvent(id, comment, callbackFunction)`
생성한 일정을 취소합니다.
파라미터:
- id / YES / String / 일정의 id 입니다.
- comment / YES / String / 일정의 취소 메세지입니다.
- callbackFunction / NO / Function / 파라미터isSuccess / 일정을 취소한 후 실행되는 콜백 함수입니다.
예시:
```javascript
var outlook = f.Outlook();
let id = "일정 ID";
let comment = "일정이 변경되었습니다."; // or null

outlook.cancelEvent(id, comment, function(isSuccess) {
    if(status) {
        f.MessageBox('Completed').setTitle('처리 완료').setDescription('취소가 완료되었습니다.').addBtn('완료',null).show();
    }
});
```

### f.Outlook.createEvent()
부르는 꼴: `f.Outlook().createEvent(subject, startDateTime, endDateTime, location, attendees, callbackFunction, timezone)`
새로운 일정을 생성합니다.
파라미터:
- subject / YES / String / 일정의 제목입니다.
- startDateTime / YES / Date / 일정의 시작 시간입니다.
- endDateTime / YES / Date / startDateTime 보다 이후여야 함 / 일정의 종료 시간입니다.
- location / YES / String / 일정의 장소입니다.
- attendees / YES / Array&#x3C;Object> / 아래 예시 참고 / 참석자 목록입니다.
- callbackFunction / NO / function / 파라미터isSuccess, result / 일정을 생성한 후 실행되는 콜백 함수입니다.
- timezone / NO / String / 기본 값 "Asia/Seoul" / 일정을 생성할때 적용할 기준 시간대입니다.
예시:
```javascript
let outlook = f.Outlook();
let startDateTime = f.Date("2026.01.01 09:00").date;
let endDateTime = f.Date("2026.01.01 10:00").date;
let subject = "개발 회의입니다.";
let location = "19층 회의실"; // or null
let attendees = [{ emailAddress: { address: "<메일 주소>", name: "홍길동" }, type: "required" }]
let timeZone = "Asia/Seoul"

outlook.createEvent(subject, startDateTime, endDateTime, location, attendees, function(status, result) {
    console.log(result);
    }, timeZone)

// …
```

### f.Outlook.declineEvent()
부르는 꼴: `f.Outlook().declineEvent(id, comment, callbackfunction)`
요청받은 일정을 거절합니다.
파라미터:
- id / YES / String / 일정의 id입니다.
- comment / YES / String / 일정 거절 메세지입니다.
- callbackFunction / NO / function / 파라미터isSuccess / 일정 거절 후 실행하는 함수입니다.
예시:
```javascript
var outlook = f.Outlook();
let id = "일정 ID";
let comment = "이미 일정이 있습니다."; // or null

outlook.declineEvent(id, comment, function(isSuccess) {
    if(status) {    
        f.MessageBox('Completed').setTitle('처리 완료').setDescription('일정을 거절하였습니다.').addBtn('완료',null).show();
    }
});
```

### f.Outlook.getEvents()
부르는 꼴: `f.Outlook(value).getEvents(startDateTime, endDateTime, callbackFunction)`
일정 목록을 반환합니다.
파라미터:
- startDateTime / YES / Date / 일정 범위의 시작일 입니다.
- endDateTime / YES / Date / startDateTime 보다 이후여야 함 / 일정 범위의 종료일 입니다.
- callbackFunction / NO / function / 파라미터isSuccess, result / 일정을 가져온 후 실행되는 콜백 함수입니다.
예시:
```javascript
let outlook = f.Outlook();
let startDateTime = f.Date("2026.01.01 09:00").date;
let endDateTime = f.Date("2026.01.01 10:00").date;

outlook.getEvents(startDate, endDate, function(isSuccess, result) {
    if (isSuccess) {
        console.log(result);
    }
})
/* example result
{
    "@odata.context": "https://graph.microsoft.com…",
// …
```

### f.Scanner
f.Scenner 는 바코드 입력 처리를 위한 스캐너 함수입니다.
PDA 를 통한 스캔을 지원하며, 디버거에서는 카메라를 통한 스캔으로 동작합니다.
기능요소:
- init() / 스캐너 설정 초기화 함수
- startScan() / 스캔 시작 함수
- stopScan() / 스캔 종료 함수
- getStatus() / 현재 스캐너 상태 조회 함수
- getLastScannedData() / 마지막으로 스캔된 값 반환 함수
- getLastScannedTimestemp() / 마지막 스캔 시각 반환 (timestamp) 함수
- getScanHistory() / 전체 스캔 이력 배열 반환 함수
- getLastError() / 마지막 오류 객체 반환 함수
- SCAN_STATUS / 스캐너 상태값

### f.Scanner.getLastError()
getLastError()를 통해 마지막에 발생했던 Error 객체를 확인할 수 있습니다.
예시:
```javascript
// Sample code

// 마지막 오류 객체 확인
// Error 객체
let lastErrObj = f.Scanner.getLastError()

// 마지막 오류 메시지
let lastErrMsg = lastErrObj.message;
```

### f.Scanner.getLastScannedData()
getLastScannedData()를 통해 마지막으로 스캔 성공한 값을 확인할 수 있습니다.
예시:
```javascript
// Sample code
f.Scanner.getLastScannedData(); // 마지막 스캔 성공한 값
```

### f.Scanner.getLastScannedTimestamp()
getLastScannedTimestamp()를 통해 마지막으로 스캔 성공한 시간을 확인할 수 있습니다.
예시:
```javascript
// Sample code

//마지막 스캔성공 시간 timestamp 
f.Scanner.getLastScannedTimestamp(); // ex)1750226419026
```

### f.Scanner.getScanHistory()
getScanHistory()를 통해 `f.Scanner.startScan()` 후 스캔성공한 값들을 확인할 수 있습니다.
예시:
```javascript
// Sample code

// 스캔 성공한 값 배열 반환
// ex) ["bacodeString1", "bacodeString2", ...]
let scanHistoryDatas = f.Scanner.getScanHistory();
```

### f.Scanner.getStatus()
부르는 꼴: `f.Scanner`
getStatus()를 통해 현재 스캐너 상태를 확인할 수 있습니다.
예시:
```javascript
// Sample code

// 현재 스캔중인지 반환하는 _v 함수
_v.checkIsScanning = () => {
    const CurScannerStatus = f.Scanner.getStatus()
    const scannerStaus = f.Scanner.SCAN_STATUS;
    
    if (CurScannerStatus == scannerStaus.DISABLED || CurScannerStatus == scannerStaus.STOPPED || CurScannerStatus == scannerStaus.IDLE) {
        return false;
    }
    else {
        return true
// …
```

### f.Scanner.init()
부르는 꼴: `f.Scanner.init(options)`
init() 을 통해 스캐너 설정 초기화 할 수 있습니다.
파라미터:
- options / Yes / JSON / 설정할 옵션 JSON
예시:
```javascript
// Sample code
f.Scanner.init({
    categoryName : 'tempScanItem',
    ckey: "BarcodeString",
    scanSuffix: "#",
    eventName : "Check_ScanItem",
    usePDAModels : ["PM84"],
    maxScanCount : 3,
    scanValidator: function (value, state) {
        return /^[0-9]+$/.test(value);
    },
    scanStopCondition: function (value, state) {
// …
```

### f.Scanner.startScan()
startScan() 를 통해 스캐너를 시작할 수 있습니다.
* DS60S, PM95, 그리고 usePDAModels 옵션에 지정된 모델이 아닌 경우,\
  상단에 토스트 알림으로 경고 메시지가 표시됩니다.
* 기기 검사와 상태 변경이 완료된 후\
  화면 리로드 등 후속 작업을 `.then()`을 통해 이어서 처리할 수 있습니다.
예시:
```javascript
// Sample code
f.Scanner.startScan().then(()=>{
    // 기기검사 후 스캐너 상태변경된것을 반영하기 위해 리로드
    // PDA 의 경우 성능이 낮기 때문에 리로드가 필요한 영역만 리로드 시키는것을 권장합니다.
    
    // 스캔 버튼영역
    f.Content("f_1").reload()
})
```

### f.Scanner.stopScan()
stopScan()를 종료할 수 있습니다.
* 스캔이 활성화된 동안에는 별도의 input 컨트롤 등에서 직접 입력이 불가능합니다.
* 화면 이동, 탭 전환 등 페이지를 떠날 때(`OnLeave` 이벤트 등)에는 반드시 `stopScan()`으로 스캔을 종료하도록 처리하는 것을 권장합니다.
예시:
```javascript
// Sample code
f.Scanner.stopScan()
```

### f.Script
`f.Script`를 통해 외부 스크립트를 가져와서 실행할 수 있도록 해주는 기능입니다. 이 기능은 외부 라이브러리, 사용자 정의 스크립트를 동적으로 불러와 기능을 확장하는데 유용합니다.
기능요소:
- load() / 외부 스크립트를 로드합니다.

### f.Script.load()
부르는 꼴: `f.Script.load(src,afterEvent, isSync)`
외부 스크립트를 로드합니다. 같은 src의 스크립트를 이미 받은 경우 다시 받아오지 않습니다.
파라미터:
- src / 필수 / String / 외부 스크립트 주소
- afterEvent / 필수 / String / 스크립트 로드 완료 후 실행할 이벤트명
- isSync / Boolean / 동기화 여부
### isSync
기본값은 false 입니다. true 일 경우 스크립트를 로드하는 동안 로딩뷰가 활성화됩니다.
예시:
```javascript
// 네이버 지도 API 사용 예시
// 네이버 지도 API v3를 로드합니다.
// 로드가 끝난 후 afterMapScript 이벤트를 실행합니다.
f.Script.load("https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=xxxxx&callback=initMap"
, 'afterMapScript');
return;
```

### f.Scroll
Step의 현재 스크롤의 위치를 제어 할 수 있습니다.
기능요소:
- offset / 스크롤 위치를 설정하거나 가져옵니다.
- toBottom() / 스크롤을 최하단으로 이동합니다.
- toSector() / 현재 섹터의 레이아웃으로 스크롤 이동합니다.
- toTop() / 스크롤을 최상단으로 이동합니다.

### f.Scroll.offset
현재 스크롤의 위치 offset을 설정하거나 가져옵니다.
예시:
```javascript
//스텝 기준
let currentOffset = f.Scroll.offset 
f.Scroll.offset  = 200

//그룹 혹은 레이아웃 기준
let currentOffset = f.Content("그룹/레이아웃 아이디").Scroll.offset 
f.Content("그룹/레이아웃 아이디").Scroll.offset  = 200
```

### f.Scroll.toBottom()
스크롤의 위치를 최하단으로 이동합니다.
예시:
```javascript
//스텝 기준
f.Scroll.toBottom()

//그룹 혹은 레이아웃 기준
f.Content("그룹/레이아웃 아이디").Scroll.toBottom()
```

### f.Scroll.toSector()
부르는 꼴: `f.Scroll.toSector(sector, isAnimate)`
섹터가 표현되는 레이아웃으로 스크롤을 이동합니다.
파라미터:
- sector / 필수 / Object / 섹터
- isAnimate / Boolean / 애니메이션 유무
### isAnimate
기본값은 true 입니다.
예시:
```javascript
//스텝 기준
f.Scroll.toSector(_c.activeSector, false) // 스크롤 이동 애니메이션 취소
f.Scroll.toSector(_c.lastSectors[0])  //스크롤 이동 애니메이션 적용

f.Scroll.toSector(_c.lastSectors[_c.lastSectors.length -1]) //새로 받아온 데이터의 맨 마지막으로 스크롤 이동.

//그룹 혹은 레이아웃 기준
f.Content("그룹/레이아웃 아이디").Scroll.toSector(_c.lastSectors[0])
```

### f.Scroll.toTop()
스크롤의 위치를 최상단으로 이동합니다.
예시:
```javascript
//스텝 기준
f.Scroll.toTop()

//그룹 혹은 레이아웃 기준
f.Content("그룹/레이아웃 아이디").Scroll.toTop()
```

### f.Setting

### f.Setting.User
사용자에 대한 설정값을 사용자 계정 정보 안에서 함께 관리 할 수 있습니다. f.Setting을 이용해서 설정된 값들은 해당 사용자에 대해 언제나 같은 값을 반환합니다. 사용자 계정이 유지되는 한 해당 값은 계속 사용이 가능합니다.
f.Setting을 통한 설정값은 용량 제한이 있습니다. 1 Kbyte 이내의 정보만 담을 수 있습니다.
기능요소:
- get() / 사용자 설정값을 가져옵니다.
- set() / 사용자 설정값을 저장합니다.

### f.Setting.User.get()
부르는 꼴: `f.Setting.User.get(key)`
key 에 해당하는 사용자의 설정값을 가져 옵니다. 값이 설정된 적이 없다면, undefined를 리턴합니다.
파라미터:
- key / 필수 / String / 사용자 설정 key
예시:
```javascript
if(f.Setting.User.get('isPolicyAgreed') == true){
  f.Frame.popUp("mydesk-private-policy-agreement")
```

### f.Setting.User.set()
부르는 꼴: `f.Setting.User.set(isAsync,key,value)`
key 에 해당하는 설정값으로 value를 저장합니다.
해당 값은 서버의 사용자 계정 데이터에 함께 저장됩니다. 혹시 사용자의 서버 접속이 원활하지 않거나 오류가 발생했을 경우에는 경고 메세지를 띄웁니다.
파라미터:
- isAsync / 필수 / Boolean / 비동기여부
- key / 필수 / String / 사용자 설정 key
- value / 필수 / 사용자 설정 값
예시:
```javascript
f.Setting.User.set(true, 'isPolicyAgreed', true);
return;
f.Setting.User.set(true, 'isUserAgreed', true);
```

### f.Sheet
컬렉션의 데이터를 엑셀로 다운로드하거나 업로드하는 방법을 설명합니다. Sheet의 각 Row는 하나의 Sector와 매칭되며, 업로드시에는 Row가 하나의 Sector로 생성됩니다.
기능요소:
- download() / 카테고리 내 Sector정보로 가공된 엑셀 파일을 다운로드 받을 수 있습니다.
- formatDownload() / 입력 된 정보로 엑셀 포맷 파일을 다운로드 받을 수 있습니다.
- insert() / 엑셀 시트정보로 카테고리 내 Sector에 삽입됩니다.

### f.Sheet.download()
부르는 꼴: `f.Sheet.download(category, fileName, keys, headers, descriptions)`
카테고리 내 Sector 정보로 가공된 엑셀 파일을 다운로드 합니다.
파라미터:
- category / 필수 / String / 카테고리 명칭
- fileName / 필수 / String / 파일 명칭
- keys / Array / 특정 항목만 다운로드 받고 싶을 경우 기입(첫번째 행에 입력됩니다.)
- headers / 필수 / Array / 사용자에게 전달할 컬럼명(두번째 행에 입력됩니다.)
- descriptions / Array / 사용자에게 전달할 컬럼별 설명(세번째 행에 입력됩니다.)
### keys
값이 없을 경우 카테고리내의 모든 키를 기준으로 생성합니다.
### descriptions
값이 없을 경우 기본값은 'Flextudio 호환을 위해 셀 서식은 텍스트를 권장합니다.' 로 설정합니다.
예시:
```javascript
f.Sheet.download("UserList"
,"UserList_${f.Date().format('YYYY-MM-DD')}"
,["fBaseUserNo", "fBaseUserName"]
,["사번", "이름"]
,["사번을 입력하세요.", "이름을 입력하세요."]);
```

### f.Sheet.formatDownload()
부르는 꼴: `f.Sheet.formatDownload(fileName, keys, headers, descriptions)`
설정한 포맷으로 엑셀 파일을 다운로드 합니다.
파라미터:
- fileName / 필수 / String / 파일 명칭
- keys / 필수 / Array / sector의 key(첫번째 행에 입력됩니다.)
- headers / 필수 / Array / 사용자에게 전달할 컬럼명(두번째 행에 입력됩니다.)
- descriptions / Array / 사용자에게 전달할 컬럼별 설명(세번째 행에 입력됩니다.)
### descriptions
값이 없을 경우 기본값은 'Flextudio 호환을 위해 셀 서식은 텍스트를 권장합니다.' 로 설정합니다.
예시:
```javascript
f.Sheet.formatDownload("sales_data"
, ["date", "product", "customer"]
, ["일자", "상품명", "고객명"]
, ["주문일자를 입력하세요.", "구매 시, 영수증에 있던 상품명을 입력하세요.", "마이페이지의 성명을 입력하세요."])
```

### f.Sheet.insert()
부르는 꼴: `f.Sheet.insert(categoryName, eventName)`
사용자로부터 엑셀파일을 업로드 받도록 하여 시트내 정보를 Cateogry의 Sector로 insert 합니다.\
입력되는 데이터의 시작은 A4열입니다.
파라미터:
- categoryName / 필수 / String / 카테고리 명칭
- eventName / 필수 / String / 이벤트 명칭
예시:
```javascript
//사용자에게 업로드할 엑셀 파일을 선택할 수 있는 파일 선택 창을 표시합니다. 
//선택한 파일의 데이터를 "inventory" 카테고리에 업로드합니다. 
//이미 "inventory" 카테고리에 섹터가 있으면 유지한 채로 엑셀 파일의 데이터가 insert 됩니다.
f.Sheet.insert("inventory")

//eventName을 넣어준 경우, insert된 직후 afterInsertEvent를 실행시켜줍니다. 
f.Sheet.insert("inventory", 'afterInsertEvent')
```

### f.SheetControl()
부르는 꼴: `f.SheetControl(fid, sector)`
`f.SheetControl()` 를 사용하여 시트 컨트롤을 제어할 수 있습니다.
이벤트 스크립트에서만 사용가능합니다.
대상 컨트롤 컴포넌트 : Sheet
파라미터:
- fid / 필수 / String / 대상 컴포넌트 ID
- sector / Sector / 타겟 섹터 (없으면 첫번째 요소 반환)
기능요소:
- reloadSheet() / 시트 리로드 함수
- reloadData() / 시트 데이터 리로드 함수
- syncData() / 시트 데이터 동기화 함수
- syncSector() / 타겟 섹터 동기화 함수
- syncSectors() / 타겟 섹터 배열 동기화 함수
- addEmptyRow() / 빈행추가 함수
- deleteRow() / 특정 행 삭제 함수
- Scroll / 시트 스크롤 이동 함수 모음
- Focus / 시트 포커스 이동 함수 모음
- sort() / 시트 정렬 함수

### f.SheetControl().addEmptyRow()
부르는 꼴: `f.SheetControl(fid, sector).addEmptyRow(num)`
`addEmptyRow()`를 통해 시트 컨트롤에 빈행을 추가합니다.
이벤트 스크립트에서만 사용가능합니다.
대상 컨트롤 컴포넌트 : Sheet
파라미터:
- num / Number / 추가할 빈행 수 (기본값 : 1)
예시:
```javascript
// 빈행 추가
f.SheetControl('f_10476').addEmptyRow()
f.SheetControl('f_10476', _c.testCategory.activeSector).addEmptyRow()

// 빈행 3개 추가
f.SheetControl('f_10476').addEmptyRow(3)
f.SheetControl('f_10476', _c.testCategory.activeSector).addEmptyRow(3)
```

### f.SheetControl().deleteRow()
부르는 꼴: `f.SheetControl(fid, sector).deleteRow(sector)`
`deleteRow()`를 통해 시트 컨트롤에 타겟 섹터 또는 섹터들로 그리고 있는 행을 삭제하고, 연결된섹터 (파라미터로 준 섹터) 를 삭제합니다.
이벤트 스크립트에서만 사용가능합니다.
대상 컨트롤 컴포넌트 : Sheet
파라미터:
- sectors / Yes / Sector \ / Array\<Sector> / 삭제할 섹터 또는 섹터배열
예시:
```javascript
// 단일섹터 삭제
f.SheetControl('f_10476').deleteRow(_c.sheetCategory.activeSector)
f.SheetControl('f_10476', _c.testCategory.activeSector).deleteRow(_c.sheetCategory.activeSector)

let deleteSectorArr = [_c.sheetCategory[0], _c.sheetCategory[1]]
// 멀티 섹터 삭제
f.SheetControl('f_10476').deleteRow(deleteSectorArr)
f.SheetControl('f_10476', _c.testCategory.activeSector).deleteRow(deleteSectorArr)
```

### f.SheetControl().Focus
부르는 꼴: `f.SheetControl(fid, sector).Focus`
`Focus`를 통해 시트에 특정 행 / 셀에 포커스가 이동되도록 합니다.
기능요소:
- toRowAtVisual() / 특정 행에 포커스 설정
- toCellAtVisual() / 특정 셀에 포커스 설정
- toCellByColKey() / 특정 ckey를 기준으로 포커스 설정
- toSectorRow() / 특정 섹터가 연결된 행 전체에 포커스 설정
- toSectorCell() / 특정 섹터와 ckey 기준으로 셀 포커스 설정

### f.SheetControl().Focus.toCellAtVisual()
부르는 꼴: `f.SheetControl(fid, sector).Focus.toCellAtVisual(visualRowIdx, visualColIdx)`
`toCellAtVisual()`을 통해 시트 컨트롤의 특정 셀에 포커스를 설정합니다.
파라미터:
- visualRowIdx / Number / 포커스할 행 인덱스
- visualColIdx / Number / 포커스할 컬럼 인덱스
시트상은 1부터 시작이지만 visualRowIdx, visualColIdx는 0 부터 시작입니다.
예시:
```javascript
// 1,5번 셀로 포커스
f.SheetControl('f_10476').Focus.toRowAtVisual(0, 4)
f.SheetControl('f_10476', _c.testCategory.activeSector).Focus.toRowAtVisual(0, 4)

// 2, 10번 셀로 포커스
f.SheetControl('f_10476').Focus.toRowAtVisual(1, 9)
f.SheetControl('f_10476', _c.testCategory.activeSector).Focus.toRowAtVisual(1, 9)
```

### f.SheetControl().Focus.toCellByColKey()
부르는 꼴: `f.SheetControl(fid, sector).Focus.toCellByColKey(visualRowIdx, ckey)`
`toCellByColKey()`을 통해 시트 컨트롤의 특정 행에 Ckey에 해당하는 셀에 포커스를 설정합니다.
파라미터:
- visualRowIdx / Number / 포커스할 행 인덱스
- ckey / String / 포커스할 컬럼 Ckey
시트상은 1부터 시작이지만 visualRowIdx는 0 부터 시작입니다.
예시:
```javascript
// 1번 행에 콜렉션키 'key1'가 연결된 셀 포커스
f.SheetControl('f_10476').Focus.toCellByColKey(0, 'key1')
f.SheetControl('f_10476', _c.testCategory.activeSector).Focus.toCellByColKey(0, 'key1')

// 2번 행에 콜렉션키 'key2'가 연결된 셀 포커스
f.SheetControl('f_10476').Focus.toCellByColKey(1, 'key2')
f.SheetControl('f_10476', _c.testCategory.activeSector).Focus.toCellByColKey(1, 'key2')
```

### f.SheetControl().Focus.toRowAtVisual()
부르는 꼴: `f.SheetControl(fid, sector).Focus.toRowAtVisual(visualRowIdx)`
`toRowAtVisual()`을 통해 시트 컨트롤의 특정 행 전체에 포커스를 설정합니다.
파라미터:
- visualRowIdx / Number / 포커스할 행 인덱스
시트상은 1부터 시작이지만 visualRowIdx는 0 부터 시작입니다.
예시:
```javascript
// 1번 행으로 포커스
f.SheetControl('f_10476').Focus.toRowAtVisual(0)
f.SheetControl('f_10476', _c.testCategory.activeSector).Focus.toRowAtVisual(0)

// 2번 행으로 포커스
f.SheetControl('f_10476').Scroll.toRowAtVisual(1)
f.SheetControl('f_10476', _c.testCategory.activeSector).Focus.toRowAtVisual(1)

// 11번 행으로 포커스
f.SheetControl('f_10476').Scroll.toRowAtVisual(10)
f.SheetControl('f_10476', _c.testCategory.activeSector).Focus.toRowAtVisual(10)
```

### f.SheetControl().Focus.toSectorCell()
부르는 꼴: `f.SheetControl(fid, sector).Focus.toSectorCell(sector, ckey)`
`toSectorCell()`을 통해 시트 컨트롤의 특정 섹터가 연결된 행에 포커스를 설정합니다.
파라미터:
- sector / Sector / 포커스를 줄 섹터
- ckey / String / 포커스를 줄 Ckey
예시:
```javascript
// sheetCategory의 activeSector 로 그리고 있는 행의 'key1'가 연결된 셀 포커스
f.SheetControl('f_10476').Focus.toSectorCell(_c.sheetCategory.activeSector. 'key1')
f.SheetControl('f_10476', _c.testCategory.activeSector).Focus.toSectorCell(_c.sheetCategory.active, 'key1')
```

### f.SheetControl().Focus.toSectorRow()
부르는 꼴: `f.SheetControl(fid, sector).Focus.toSectorRow(sector)`
`toSectorRow()`을 통해 시트 컨트롤의 시트 컨트롤의 특정 섹터가 연결된 행에 포커스를 설정합니다.
파라미터:
- sector / Sector / 포커스를 줄 섹터
예시:
```javascript
// sheetCategory의 activeSector 로 그리고 있는 행으로 포커스 이동
f.SheetControl('f_10476').Focus.toSectorRow(_c.sheetCategory.activeSector)
f.SheetControl('f_10476', _c.testCategory.activeSector).Focus.toSectorRow(_c.sheetCategory.active)
```

### f.SheetControl().reloadData()
부르는 꼴: `f.SheetControl(fid, sector).reloadData()`
`reloadData()`를 통해 시트 컨트롤의 데이터를 리로드할 수 있습니다.
이벤트 스크립트에서만 사용가능합니다.
대상 컨트롤 컴포넌트 : Sheet
예시:
```javascript
f.SheetControl('f_10476').reloadData()
f.SheetControl('f_10476', _c.testCategory.activeSector).reloadData()
```

### f.SheetControl().reloadSheet()
부르는 꼴: `f.SheetControl(fid, sector).reloadSheet()`
`reloadSheet()`를 통해 시트 컨트롤를 리로드할 수 있습니다.
이벤트 스크립트에서만 사용가능합니다.
대상 컨트롤 컴포넌트 : Sheet
예시:
```javascript
f.SheetControl('f_10476').reloadSheet()
f.SheetControl('f_10476', _c.testCategory.activeSector).reloadSheet()
```

### f.SheetControl().Scroll
부르는 꼴: `f.SheetControl(fid, sector).Scroll`
`Scroll`를 통해 시트 컨트롤의 스크롤 위치를 이동시킬 수 있습니다.
기능요소:
- toTop() / 최상단으로 스크롤 이동
- toBottom() / 최하단으로 스크롤 이동
- toPercent() / 전체 row 대비 n% 위치로 스크롤 이동
- toRowAtVisual() / 특정 행으로 스크롤 이동
- toCellAtVisual() / 특정 셀로 스크롤 이동

### f.SheetControl().Scroll.toBottom()
부르는 꼴: `f.SheetControl(fid, sector).Scroll.toBottom()`
`toBottom()`을 통해 시트 컨트롤의 최상단으로 스크롤 이동합니다.
예시:
```javascript
f.SheetControl('f_10476').Scroll.toBottom()
f.SheetControl('f_10476', _c.testCategory.activeSector).Scroll.toBottom()
```

### f.SheetControl().Scroll.toCellAtVisual()
부르는 꼴: `f.SheetControl(fid, sector).Scroll.toCellAtVisual(visualRowIdx, visualColIdx)`
`toCellAtVisual()`을 통해 시트 컨트롤의 특정 행이 보이는 위치로 스크롤 이동합니다.
파라미터:
- visualRowIdx / Number / 보여줄 행 인덱스
- visualColIdx / Number / 보여줄 컬럼 인덱스
시트상은 1부터 시작이지만 visualRowIdx, visualColIdx는 0 부터 시작입니다.
예시:
```javascript
// 1,5번 셀로 이동
f.SheetControl('f_10476').Scroll.toRowAtVisual(0, 4)
f.SheetControl('f_10476', _c.testCategory.activeSector).Scroll.toRowAtVisual(0, 4)

// 2, 10번 셀로 이동
f.SheetControl('f_10476').Scroll.toRowAtVisual(1, 9)
f.SheetControl('f_10476', _c.testCategory.activeSector).Scroll.toRowAtVisual(1, 9)
```

### f.SheetControl().Scroll.toPercent()
부르는 꼴: `f.SheetControl(fid, sector).Scroll.toPercent(percent)`
`toPercent()`을 통해 시트 컨트롤의 전체 row 대비 n% 위치로 스크롤 이동합니다.
파라미터:
- percent / Number / 이동시킬 스크롤 위치(0~100)
예시:
```javascript
// 중간으로 이동
f.SheetControl('f_10476').Scroll.toPercent(50)
f.SheetControl('f_10476', _c.testCategory.activeSector).Scroll.toPercent(50)
```

### f.SheetControl().Scroll.toRowAtVisual()
부르는 꼴: `f.SheetControl(fid, sector).Scroll.toRowAtVisual(visualRowIdx)`
`toRowAtVisual()`을 통해 시트 컨트롤의 특정 행이 보이는 위치로 스크롤 이동합니다.
파라미터:
- visualRowIdx / Number / 보여줄 행 인덱스
시트상은 1부터 시작이지만 visualRowIdx는 0 부터 시작입니다.
예시:
```javascript
// 1번 행으로 이동
f.SheetControl('f_10476').Scroll.toRowAtVisual(0)
f.SheetControl('f_10476', _c.testCategory.activeSector).Scroll.toRowAtVisual(0)

// 2번 행으로 이동
f.SheetControl('f_10476').Scroll.toRowAtVisual(1)
f.SheetControl('f_10476', _c.testCategory.activeSector).Scroll.toRowAtVisual(1)

// 11번 행으로 이동
f.SheetControl('f_10476').Scroll.toRowAtVisual(10)
f.SheetControl('f_10476', _c.testCategory.activeSector).Scroll.toRowAtVisual(10)
```

### f.SheetControl().Scroll.toTop()
부르는 꼴: `f.SheetControl(fid, sector).Scroll.toTop()`
`toTop()`을 통해 시트 컨트롤의 최상단으로 스크롤 이동합니다.
예시:
```javascript
f.SheetControl('f_10476').Scroll.toTop()
f.SheetControl('f_10476', _c.testCategory.activeSector).Scroll.toTop()
```

### f.SheetControl().sort()
부르는 꼴: `f.SheetControl(fid, sector).sort(keyOrFn, order)`
`sort()`를 통해 시트 컨트롤의 행을 정렬시킬 수 있습니다.
* 첫 번째 인자로 컬렉션 키(String)를 전달하면,
  해당 키의 값을 기준으로 지정한 정렬 방향(order)에 따라 정렬합니다.
* 첫 번째 인자로 **함수**를 전달하면,
  커스텀 정렬 로직(예: 2개 이상의 조건을 이용한 복합 정렬 등)에 따라 자유롭게 정렬할 수 있습니다.
이벤트 스크립트에서만 사용가능합니다.
대상 컨트롤 컴포넌트 : Sheet
파라미터:
- keyOrFn / Yes / String / Function / 정렬할 기준 콜렉션 키 또는 비교 함수
- order / Literal / 'asc' \ / 'desc’ 만 가능 / 콜렉션키 사용시 정렬방향을 지정 인자 (기본값 : “asc”)
예시:
```javascript
// 단일 키 기준 오름차순 정렬
f.SheetControl('f_10476').sort('qty', 'asc');
f.SheetControl('f_10476', _c.testCategory.activeSector).sort('qty', 'asc');


// 1. ItemName(오름차순), qty(내림차순) 복합 정렬
f.SheetControl('f_10476').sort((a, b) => {
  // 1순위: ItemName 알파벳 오름차순
  const nameCompare = a.ItemName.localeCompare(b.ItemName);
  if (nameCompare !== 0) return nameCompare;

  // 2순위: qty(수량) 내림차순
// …
```

### f.SheetControl().syncData()
부르는 꼴: `f.SheetControl(fid, sector).syncData()`
`syncData()`를 통해 시트 컨트롤에 연결된 카테고리의 모든 섹터를 동기화합니다.
이벤트 스크립트에서만 사용가능합니다.
대상 컨트롤 컴포넌트 : Sheet
상태 “D” 가 아닌 완전삭제된 섹터의 경우 동기화되지 않습니다.\
완전 삭제된 데이터가 있는경우 reloadData를 사용해야합니다.
예시:
```javascript
f.SheetControl('f_10476').syncData()
f.SheetControl('f_10476', _c.testCategory.activeSector).syncData()
```

### f.SheetControl().syncSector()
부르는 꼴: `f.SheetControl(fid, sector).syncSector(sector)`
`syncSector()`를 통해 시트 컨트롤에 타겟 섹터 또는 섹터들의 현재 값을 동기화 합니다.
이벤트 스크립트에서만 사용가능합니다.
대상 컨트롤 컴포넌트 : Sheet
상태 “D” 가 아닌 완전삭제된 섹터의 경우 동기화되지 않습니다.\
완전 삭제된 데이터가 있는경우 reloadData를 사용해야합니다.
파라미터:
- sectors / Yes / Sector \ / Array\<Sector> / 동기화 할 섹터 또는 섹터 배열
예시:
```javascript
// 단일섹터 동기화
f.SheetControl('f_10476').syncSector(_c.sheetCategory.activeSector)
f.SheetControl('f_10476', _c.testCategory.activeSector).syncSector(_c.sheetCategory.activeSector)

// 멀티 섹터 동기화
f.SheetControl('f_10476').syncSector(_c.sheetCategory)
f.SheetControl('f_10476', _c.testCategory.activeSector).syncSector(_c.sheetCategory)
```

### f.TeamsBot()
Azure Entra에 등록된 Teams Bot을 사용해 사용자에게 메세지를 전송할 수 있습니다.

### f.TeamsBot().addReceiver()
부르는 꼴: `f.TeamsBot().addReceiver(fBaseUserNo)`
addReceiver()를 통해 Teams Bot 메세지 수신자를 설정할 수 있습니다.
파라미터:
- fBaseUserNo / YES / String 또는 String Array / 수신자 번호
예시:
```javascript
f.TeamsBot().addReceiver('1'); // String
f.TeamsBot().addReceiver(['1', '2']) // String Array
```

### f.TeamsBot().send()
부르는 꼴: `f.TeamsBot().send(callBackFunction)`
Teams Bot 메세지를 전송합니다. 파라미터로 callBackFunction을 포함하여 호출할 경우 메세지 전송의 성공 여부 및 결과를 받아 처리할 수 있습니다.
파라미터:
- callbackFunction(isSuccess, result) / NO / function / 메세지 전송 후 실행될 콜백 함수입니다.
isSuccess - Boolean
메세지 전송 결과가 아닌, 메세지 전송 요청의 서버  통신 성공 여부입니다.
result - JSON Object
* Success : 메세지 전송에 성공한 사용자의 fBaseUserNo 목록
* Failed : 메세지 전송에 실패한 사용자 fBaseUserNo 및 실패 사유
아래는 result 데이터의 예시 입니다.
예시:
```javascript
var teams = f.TeamsBot()
teams.setTitle('결재 알림')
teams.setBody('결재가 완료되었습니다.')
teams.setURL('https://www.flextudio.com')
teams.setImageURL('https://ws.flextudio.com/flex/FlextudioCommonImg/FlextudioBN.png')
teams.addReceiver('1')
teams.send(function (isSuccess, result) {
    if (!isSuccess) {
        // 메세지 전송 요청 실패
        return;
    }
    // 성공한 수신자
// …
```

### f.TeamsBot().setBody()
부르는 꼴: `f.TeamsBot().setBody(content)`
Teams Bot 메세지의 내용을 설정합니다.
파라미터:
- content / YES / String / 메세지 내용
예시:
```javascript
f.TeamsBot().setBody('결재가 완료되었습니다.');
```

### f.TeamsBot().setImageURL()
부르는 꼴: `f.TeamsBot().setImageURL(URL)`
Teams Bot 메세지에 이미지를 추가합니다.
파라미터:
- URL / YES / String
예시:
```javascript
f.TeamsBot().setImageURL('https://ws.flextudio.com/...')
```

### f.TeamsBot().setTitle()
부르는 꼴: `f.TeamsBot().setTitle(title)`
Teams Bot 메세지의 제목을 설정합니다.
파라미터:
- title / YES / String / 메세지 제목
예시:
```javascript
f.TeamsBot().setTitle('결재 알림');
```

### f.TeamsBot().setURL()
부르는 꼴: `f.TeamsBot().setURL(URL)`
Teams Bot 메세지에 URL을 열 수 있는 버튼을 추가합니다.
파라미터:
- URL / YES / String
예시:
```javascript
f.TeamsBot().setURL('https://www.flextudio.com');
```

### f.Time
`f.Time` 를 통해 서버 호출이 필요한 함수를 사용합니다.
기기에서는 시간을 임의로 조정하여 서버시간과 다른 경우가 있기도 합니다. 이런 경우에 f.Time 함수를 통해 UTC의 절대값 시간을 사용할 수 있습니다.
기능요소:
- getServerTime() / 서버에서 UTC 절대값 시간을 받아서 f.API.serverTime에 넣어줍니다.
- serverTime / UTC 타임 절대값
- error / 오류메세지

### f.Time.error
f.Time.getServerTime() 호출이 실패했을 때 오류 메시지가 담긴 변수입니다. 에러 처리에 사용될 수 있습니다.
예시:
```javascript
// 오류 메시지
f.Time.error;
```

### f.Time.getServerTime()
부르는 꼴: `f.Time.getServerTime(isAsync, eventName)`
서버로부터 UTC 시간의 절대값을 가져온 후, 지정된 이벤트를 실행합니다.
이벤트 스크립트에서만 사용가능합니다.
파라미터:
- isAsync / Boolean / 비동기여부 true
- eventName / String / 다음 실행할 이벤트 명
예시:
```javascript
f.Time.getServerTime(false , "NextEvent")
```

### f.Time.serverTime
f.Time.getServerTime()의 결과로 받은 UTC 타임의 절대값을 담는 변수입니다. 시간 정보를 처리하는 데 사용될 수 있습니다.
예시:
```javascript
// UTC 타임 절대값
f.Time.serverTime;
```

### f.Toast
부르는 꼴: `f.Toast()`
사용자에게 짧게 전달하는 메시지입니다.
최소 delay(), position(), show() 함수를 모두 사용해야 토스트 메시지가 나타납니다.
기능요소:
- color() / 배경색을 설정합니다.
- delay() / 메시지 표시 시간(초)을 설정합니다.
- description() / 부가 메시지를 입력합니다.
- icon() / 아이콘 표시 여부를 설정합니다.
- position() / 메시지 표시 위치를 설정합니다.
- show() / 메시지를 나타냅니다.
- title() / 주요 메시지를 입력합니다.
- 파라미터명 / 필수여부 / 타입 / 제약사항 / 설명
- color / 필수 / String / 색상
- 파라미터명 / 필수여부 / 타입 / 제약사항 / 설명
- second / Number / 표시 시간
- 파라미터명 / 필수여부 / 타입 / 제약사항 / 설명
- descMessage / String / 메시지 내용
- 파라미터명 / 필수여부 / 타입 / 제약사항 / 설명
- showIcon / 필수 / Boolean / 아이콘 유무
- 파라미터명 / 필수여부 / 타입 / 제약사항 / 설명
- pos / String / 위치
- 파라미터명 / 필수여부 / 타입 / 제약사항 / 설명
- titleMessage / String / 메시지 제목
### color
color 함수를 사용하지 않을 경우 검은색을 기본 배경색으로 설정합니다.
#### 파라미터
color 파라미터는 아래의 옵션 중 하나를 선택합니다.
* red
* black
* blue
* green
* yellow
#### 예시
### delay()
#### 파라미터
파라미터를 입력하지 않을 경우 기본값은 3입니다.
#### 예시
### description()
#### 파라미터
#### 예시
### icon()
#### 파라미터
#### 예시
### position()
#### 파라미터
pos 파라미너틑 아래의 옵션 중 하나를 선택합니다. 입력하지 않을 경우 기본값은 'bottom' 입니다.
* top
* center
* bottom
#### 예시
### show()
#### 예시
### title()
#### 파라미터
#### 예시

### f.Toast().color()
부르는 꼴: `f.Toast().color(color)`
메시지의 배경색을 설정합니다.
파라미터:
- color / 필수 / String / 색상
### color
아래의 옵션 중 하나를 선택합니다.
* red
* black
* blue
* green
* yellow
예시:
```javascript
f.Toast.color('yellow')
```

### f.Toast().delay()
부르는 꼴: `f.Toast().delay(second)`
메시지 표시 시간(초)을 설정합니다.
파라미터:
- second / Number / 표시 시간
### second
입력하지 않을 경우 기본값은 3입니다.
예시:
```javascript
f.Toast.delay(5)
```

### f.Toast().description()
부르는 꼴: `f.Toast().description(descMessage)`
사용자에게 전달할 메시지의 내용을 입력합니다.
파라미터:
- descMessage / String / 메시지 내용
예시:
```javascript
f.Toast.description('내용을 입력합니다.')
```

### f.Toast().icon()
부르는 꼴: `f.Toast().icon(showIcon)`
메시지에 아이콘을 추가할지 설정합니다.
파라미터:
- showIcon / 필수 / Boolean / 아이콘 유무
예시:
```javascript
f.Toast.icon(true)
```

### f.Toast().position()
부르는 꼴: `f.Toast().position(pos)`
메시지 위치를 설정합니다.
파라미터:
- pos / String / 위치
### pos
아래의 옵션 중 하나를 선택합니다. 입력하지 않을 경우 기본값은 'bottom' 입니다.
* top
* center
* bottom
예시:
```javascript
f.Toast.position('center')
```

### f.Toast().show()
토스트 메시지를 사용자에게 보여줍니다.
예시:
```javascript
f.Toast.show()
```

### f.Toast().title()
부르는 꼴: `f.Toast.title(titleMessage)`
사용자에게 전달할 메시지의 제목을 입력합니다.
파라미터:
- titleMessage / String / 메시지 제목
예시:
```javascript
f.Toast.title('제목을 입력합니다.')
```

### f.User
카카오, 네이버, 구글 계정으로 간편 로그인을 제공합니다.
기능요소:
- isLogin() / 간편 로그인이 되어 있는지 확인합니다.
- logout() / 간편 로그인의 로그아웃을 합니다.
- snsLogin() / 간편 로그인 페이지로 이동합니다.
### 특징
해당 스크립트는 디버거에서 상황에 따라 다른 동작을 수행합니다.
* 공통 동작
  로그아웃상태에서 로그아웃, 로그인 상태에서 로그인 시 동작하지않고 디버거 로그 추가
* 초대 기반 앱
  초대기반앱인 경우 로그아웃사용시 디버거 로그 추가.초대기반앱은 디버거에서 로그아웃이 되지 않습니다.
* 공개 앱(오픈앱)
  snsLogin 스크립트 사용시 로그인 타입 설정 팝업창이 나와서 현재 디버거 사용자로 로그인할지 새사용자로 sns로그인 추가할지 팝업이 나옵니다.

### f.User.isLogin()
간편 로그인을 통해 사용자가 로그인 되어 있는 상태인지 확인합니다. 로그인이 되어있다면 true를, 되어 있지 않다면 false를 반환합니다.
예시:
```javascript
if (f.User.isLogin()) {
    // 사용자가 간편 로그인 되어 있는 상태
} else {
    // 로그아웃 되어 있는 상태
}
```

### f.User.logout()
간편 로그인을 통한 로그인 상태를 로그아웃합니다.
로그아웃 후 사용자에 대한 처리는 `_base.User` 를 활용하여 개발자가 직접 개발합니다.
예시:
```javascript
f.User.logout()
```

### f.User.snsLogin()
부르는 꼴: `f.User.snsLogin(isEventBreak)`
현재 앱을 기준으로 간편 로그인을 진행할 수 있는 새로운 페이지가 열립니다. 카카오, 네이버, 구글 계정을 지원하고 로그인이 성공적으로 완료되면 앱의 시작주소로 리다이렉트 합니다.
f.User.snsLogin() 함수는 공개 앱(오픈 앱)에서만 로그인을 지원합니다.
파라미터:
- isEventBreak / Boolean / 로그인 페이지로 이동하는 경우 이벤트 중단 유무
**isEventBreak**
기본값은 false 입니다.
예시:
```javascript
f.User.snsLogin() // 로그인 페이지로 이동되었을때 이후 이벤트가 모두 실행됩니다.
f.User.snsLogin(true) // 로그인 페이지로 이동되었을때 이후 이벤트가 중단됩니다.
```
