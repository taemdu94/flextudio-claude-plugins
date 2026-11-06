# 공식 스크립트 명세 요약: f.Auth ~ f.Date

이 파일이 답하는 질문: f.Auth ~ f.Date 함수의 뜻, 파라미터(필수 여부·타입·설명), 기본값, 예시

공식 스크립트 명세(https://docs.flextudio.com/flextudio)의 쪽마다 개요, 파라미터, 예시 앞부분을 옮긴 것입니다.
다른 참조 파일의 규칙(실측·검증된 동작)과 다르면 그쪽을 따르세요. 명세 예시 코드에는 오타가 있을 수 있으니 그대로 복사하지 말고 부르는 꼴을 기준으로 다시 쓰세요.

목차: f / f.Auth / f.Auth.add() / f.Auth.check() / f.Auth.list() / f.Auth.remove() / f.Barcode / f.Barcode.error / f.Barcode.value / f.Browser / f.Browser.open() / f.checkRequired / f.Collection / f.Collection.addSector() / f.Collection.createCategory() / f.Collection.filter() / f.Collection.moveCategory() / f.Collection.removeCategory() / f.Collection.removeSector() / f.Collection.updateSector() / f.Component() / f.Component().element / f.Component().focus() / f.Component().getInputValue() / f.Component().getSectors() / f.Component().getText() / f.Component().hide() / f.Component().setInputValue() / f.Component().setText() / f.Component().show() / f.Content() / f.Content().addRow() / f.Content().delRow() / f.Content().hide() / f.Content().reload() / f.Content().reloadWithAnimation() / f.Content().Scroll / f.Content().Scroll.offset / f.Content().Scroll.toBottom() / f.Content().Scroll.toSector() / f.Content().Scroll.toTop() / f.Content().show() / f.Date() / f.Date().calcTimezoneOffset() / f.Date().date / f.Date().format() / f.Date().getCalcDate() / f.Date().getDate() / f.Date().getDatetime() / f.Date().getDay() / f.Date().getFirstDateOfMonth() / f.Date().getHours() / f.Date().getLastDateOfMonth() / f.Date().getMinutes() / f.Date().getMonth() / f.Date().getRangeOfDate() / f.Date().getSecond() / f.Date().getTime() / f.Date().getTimezoneOffset() / f.Date().getUTCTime() / f.Date().getWeekDay() / f.Date().getYear() / f.Date().setDate() / f.Date().setDatetime() / f.Date().setDay() / f.Date().setHours() / f.Date().setMinutes() / f.Date().setMonth() / f.Date().setSecond() / f.Date().setTime() / f.Date().setUTCTime() / f.Date().setYear()

### f
부르는 꼴: `기능함수`
'f'는 Flextudio에서 제공하는 라이브러리로, 화면 제어, 네이티브 기능 사용, 그리고 편의 기능을 위한 스크립트를 포함하고 있습니다. 이 라이브러리는 Flextudio 플랫폼에서 다양한 솔루션을 활용할 수 있도록 지원하는 함수와 기능의 모음입니다. 사용자가 플랫폼에서 제공하는 다양한 기능을 손쉽게 활용할 수 있도록 돕습니다.
기능요소:
- Auth / 사용자 권한을 제어할 수 있습니다. / true / true
- Barcode / 바코드 정보에 대한 결과 값을 사용할 수 있습니다. / true / true
- Browser / 기기의 기본 브라우저를 실행 시킬 수 있습니다. / true / true
- Collection / 컬렉션을 조작할 수 있습니다. / true / true
- Component() / 컴포넌트를 제어할 수 있습니다. / true / true
- Content() / 그룹/레이아웃을 제어할 수 있습니다. / true / true
- Date() / 원하는 형식의 날짜를 가져올 수 있다. / true / true
- Event() / 이벤트를 제어할 수 있습니다. / false / true
- File / 파일 관련 함수에 접근할 수 있습니다. / true / true
- Frame / 앱 프레임에 접근할 수 있습니다. / true / true
- GPS / GPS 정보에 대한 결과 값을 사용할 수 있습니다. / true / false
- History / 시나리오나 스텝의 실행 히스토리를 알 수 있습니다. / true / false
- IP / IP 정보에 대한 결과 값을 사용할 수 있습니다. / true / false
- LoadingView / 로딩 화면을 제어할 수 있습니다. / true / false
- Mail() / 메일 기능을 사용할 수 있습니다. / true / false
- Message() / 푸시알림을 사용할 수 있습니다. / true / false
- MessageBox() / 메세지 박스를 사용할 수 있습니다. / true / false
- Native / 네이티브 레벨의 기능을 사용할 수 있습니다. / true / false
- Observer / 앱을 사용해 통신을 할 수 있는 기능을 제공합니다. / true / false
- Scanner / 바코드 입력처리 기능을 제공합니다. / false / false
- Script / 외부 스크립트를 실행할 수 있는 기능을 제공합니다. / true / false
- Scroll / 현재 스크롤의 위치를 제어 할 수 있습니다. / true / false
- Setting / 사용자에 대한 설정값을 관리할 수 있습니다. / true / false
- Sheet / 데이터를 엑셀로 다운로드하거나 업로드하는 기능을 제공합니다. / true / false
- Time / UTC의 절대값 시간을 가올 수 있습니다. / true / true
- Toast / 토스트 메시지 기능을 제공합니다. / true / false
- User / SNS 간편 로그인을 제공합니다. / true / false
- checkRequired / 필수입력인 컨트롤의 입력값에 대해서 확인 하는 기능을 제공합니다. / true / false
- SheetControl() / 시트 컨트롤을 제어할 수 있습니다. / false / false
- TeamsBot() / Teams Bot을 통해 사용자에게 메세지를 보낼 수 있습니다. / false / false
- numFormat() / 숫자의 소수점에 대하여 올림, 버림, 반올림이 가능합니다. / false / false
- Outlook() / Outlook 일정 관련 기능을 사용하실 수 있습니다. / false / false

### f.Auth
`f.Auth` 를 통해 사용자 권한을 제어할 수 있습니다.
해당 스크립트를 사용하기 전 권한키관리를 참고하여 권한키를 추가해주세요.
스크립트로 추가한 권한키는 현재 시나리오 내에서만 유효합니다.
기능요소:
- list() / 사용자가 보유한 권한키 목록을 반환합니다.
- add() / 사용자에게 특정 권한키를 추가합니다.
- remove() / 사용자의 특정 권한키를 회수합니다.
- check() / 사용자에게 특정 권한키가 존재하는지 확인합니다.

### f.Auth.add()
부르는 꼴: `f.Auth.add(authKey)`
사용자에게 특정 권한키를 추가합니다.
스크립트로 추가한 권한키는 현재 시나리오 내에서만 유효합니다.
파라미터:
- authKey / String / 추가할 권한키 명칭
예시:
```javascript
f.Auth.add("myAuthKey")
```

### f.Auth.check()
부르는 꼴: `f.Auth.check(authKey)`
사용자에게 특정 권한키가 존재하는지 확인합니다.
파라미터:
- authKey / String / 체크할 권한키 명칭
예시:
```javascript
f.Auth.check("myAuthKey") // true/false
```

### f.Auth.list()
사용자가 보유한 권한키 목록을 반환합니다.
예시:
```javascript
//사용자 권한 목록 (배열)
f.Auth.list() // ["myAuthKey", "myAuthKey2"]
```

### f.Auth.remove()
부르는 꼴: `f.Auth.remove(authKey)`
사용자의 특정 권한키를 회수합니다.
파라미터:
- authKey / String / 회수할 권한키 명칭
예시:
```javascript
f.Auth.remove("myAuthKey")
```

### f.Barcode
`f.Barcode`를 통해 f.Native.getBarcode()의 결과를 사용할 수 있습니다.
기능요소:
- value / 바코드 정보
- error / 오류메세지

### f.Barcode.error
f.Native.getBarcode() 호출이 실패했을 때 오류 메시지가 담긴 변수입니다. 에러 처리에 사용될 수 있습니다.
예시:
```javascript
// f.Native.getBarcode()의 eventName에 해당하는 이벤트에서
// 아래와 같이 확인할 수 있습니다.
const barcodeError = f.Barcode.error;
if (barcodeError) {
    console.log(barcodeError);
    // ... 바코드 호출 실패에 대한 처리
} else {
    const value = f.Barcode.value;
    // ... 바코드 정보 처리
}
```

### f.Barcode.value
f.Native.getBarcode()의 결과로 받은 바코드 정보를 담는 변수입니다. 바코드 정보를 처리하는 데 사용될 수 있습니다.
예시:
```javascript
// 바코드 정보
f.Barcode.value;
```

### f.Browser
`f.Browser`를 통해 기기의 기본 브라우저로 실행할 수 있습니다.
이벤트 스크립트에서만 사용가능합니다.
기능요소:
- open() / 기기의 기본 브라우저를 사용하여 웹 페이지를 엽니다.

### f.Browser.open()
부르는 꼴: `f.Browser.open(url)`
URL을 기기의 기본 브라우저에서 열 수 있습니다.
이벤트 스크립트에서만 사용가능합니다.
파라미터:
- url / true / String / 브라우저로 열 웹 페이지 주소
예시:
```javascript
f.Browser.open("https://flextudio.com/");
```

### f.checkRequired
부르는 꼴: `f.checkRequired()`
현재 스텝에서 컨트롤 상태가 필수입력인 컨트롤에 대해서 모든 입력값이 설정 되었는지 확인합니다.\
하나라도 입력되지 않았다면 true 를 반환합니다.
예시:
```javascript
if (f.checkRequired()) {
    f.Event().break();
    return;
} else {
    // 모든 필수 입력값이 설정 되었을 때
}
```

### f.Collection
`f.Collection`을 사용하여 컬렉션을 조작할 수 있습니다.
기능요소:
- addSector() / 대상 카테고리에 섹터를 추가합니다.
- removeSector() / 대상 카테고리의 대상 섹터를 삭제합니다.
- updateSector() / 대상 카테고리의 대상 섹터의 콜렉션키를 지정하여 값을 업데이트합니다.
- createCategory() / 카테고리를 추가합니다.
- removeCategory() / 대상카테고리를 삭제합니다.
- moveCategory() / 대상카테고리에서 섹터상태에 해당하는 섹터를 카테고리 이동시킵니다.
- filter() / 콜렉션에서 조건에 해당하는 콜렉션을 반환합니다.

### f.Collection.addSector()
부르는 꼴: `f.Collection.addSector(obj, categoryName)`
대상 카테고리에 특정 Object의 값을 섹터로 추가할 수 있습니다.
대상 카테고리명을 Param으로 주면 해당 카테고리로 등록을 해줍니다.
함수 자동 생성을 통해 생성 할 수 있습니다.
파라미터:
- obj / 필수 / Object / JSON Object / 섹터로 등록할 데이터
- categoryName / String / 대상 카테고리 명
예시:
```javascript
f.Collection.addSector({"key":"value", "key2": "value2"},"targetCategory");
// 새로 추가된 섹터 반환
```

### f.Collection.createCategory()
부르는 꼴: `f.Collection.createCategory(categoryName)`
새로운 카테고리를 생성하고, 새 카테고리 내에 새 섹터를 추가합니다.
파라미터:
- categoryName / 필수 / String / 추가할 카테고리 명
예시:
```javascript
f.Collection.createCategory('targetCategory'); //'targetCategory'에 생성된 새 섹터 반환
```

### f.Collection.filter()
부르는 꼴: `f.Collection.filter(collectionKey, Operator, value)`
지정한 컬렉션에서 특정 조건을 만족하는 섹터(Sector)를 필터링하는 데 사용됩니다. 이를 통해 조건에 맞는 데이터를 추출할 수 있습니다.
파라미터:
- collectionKey / 필수 / String / 대상 컬렉션 키
- Operator / 필수 / String / 비교할 방법
- value / 필수 / String, Number / 비교할 값
- status / 설명
- Not\_Exists / 특정 값이 존재하지 않는 데이터만을 선택
- Exists / 특정 값이 존재하는 데이터만을 선택
- == / 특정 값과 정확히 일치하는 데이터만을 선택
- != / 특정 값과 일치하지 않는 데이터만을 선택
- < / 특정 값보다 작은 데이터만을 선택
- <= / 특정 값 이하의 데이터만을 선택
- > / 특정 값보다 큰 데이터만을 선택
- >= / 특정 값 이상의 데이터만을 선택
- Like / 특정 패턴이나 문자열을 포함하는 데이터만을 선택
- RegExp / 정규 표현식 패턴에 맞는 데이터만을 선택
### Operator
데이터(Sector)의 필터 종류 입니다.
예시:
```javascript
f.Collection.filter('key','Exists',null); 
f.Collection.filter('key','Not_Exists',null);
f.Collection.filter('key','==','바나나')
f.Collection.filter('key','!=','바나나');
f.Collection.filter('key','<','10');
f.Collection.filter('key','>,'10');
f.Collection.filter('key','<=','10');
f.Collection.filter('key','>=','10');
// 단어 중간에 '나'가 있고 '나' 다음에 딱 한 글자가 있는 문자열
f.Collection.filter('key','Like','%나_');
// 010-XXXX-XXXX 인 휴대폰번호 필터링
f.Collection.filter('key','RegExp', /^010-\d{4}-\d{4}$/);
```

### f.Collection.moveCategory()
부르는 꼴: `f.Collection.moveCategory(targetCategory,  status, moveCategory)`
대상카테고리에서 섹터상태에 해당하는 섹터를 카테고리 이동시킬 수 있습니다.
함수자동 생성 기능(링크)을 통해 생성 할 수 있습니다.
파라미터:
- targetCategory / 필수 / String / 대상 카테고리 명
- status / 필수 / String / 이동할 섹터 상태(기본값은 all 입니다.)
- moveCategory / 필수 / String / 이동할 카테고리 명
### status
데이터(Sector)의 상태값 입니다.
예시:
```javascript
// targetCategory의 Active 상태인 섹터를 moveCategory로 이동
f.Collection.moveCategory('targetCategory','active','moveCategory'); //이동한 섹터를 반환
```

### f.Collection.removeCategory()
부르는 꼴: `f.Collection.removeCategory(categoryName)`
대상 카테고리를 삭제할 수 있습니다.
파라미터:
- categoryName / 필수 / String / 삭제할 카테고리 명
예시:
```javascript
f.Collection.removeCategory('targetCategory');
```

### f.Collection.removeSector()
부르는 꼴: `f.Collection.removeSector(status, categoryName)`
대상 카테고리에 섹터를 특정상태의 섹터를 삭제할 수 있습니다.
함수자동 생성 기능(링크)을 통해 생성 할 수 있습니다.
파라미터:
- status / String / 삭제할 섹터 상태(기본값은 all 입니다.)
- categoryName / String / 대상 카테고리 명
### status
데이터(Sector)의 상태값 입니다.
예시:
```javascript
// targetCategory의 Active 상태인 섹터 삭제
f.Collection.removeSector('active','targetCategory');
```

### f.Collection.updateSector()
부르는 꼴: `f.Collection.updateSector(status, collectionKey, value, categoryName)`
대상 카테고리에 특정상태의 섹터의 컬렉션 키 값을 업데이트 할 수 있습니다.
함수자동 생성 기능(링크)을 통해 생성 할 수 있습니다.
파라미터:
- status / String / 업데이트할 섹터 상태(기본값은 all 입니다.)
- collectionKey / 필수 / String / 대상섹터의 컬렉션 키
- value / 필수 / String, Number / 변경할 값
- categoryName / String / 대상 카테고리 명
### status
데이터(Sector)의 상태값 입니다.
예시:
```javascript
// targetCategory의 Active 상태인 섹터의 key의 값을 value2로 변경
f.Collection.updateSector('active','key','value2','targetCategory');//수정된 섹터 반
```

### f.Component()
부르는 꼴: `f.Component(fid, sectorObject)`
`f.Component()` 를 통해 컴포넌트를 쉽게 제어할 수 있습니다.
이벤트 스크립트에서만 사용가능합니다.
파라미터:
- fid / 필수 / String / 대상 컴포넌트 ID
- sectorObject / Object / 지정 섹터가 없으면 첫번 째 요소 반환
기능요소:
- element / 컴포넌트 요소 선택
- getInputValue() / input 컨트롤의 값을 가져오기
- setInputValue() / input 컨트롤의 값을 변경하기
- getText() / text 컨트롤의 값을 가져오기
- setText() / text 컨트롤의 값을 변경하기
- getSectors() / 컴포넌트를 그려주는 섹터 얻기
- focus() / input 컴포넌트 포커스

### f.Component().element
부르는 꼴: `f.Component(fid, sectorObject).element`
특정 컴포넌트의 HTML 요소를 반환받을 수 있습니다. 커스텀 이벤트를 생성하거나 스타일을 제어할 수 있습니다.
이벤트 스크립트에서만 사용가능합니다.
예시:
```javascript
// 섹터 미지정
const  layout1 = f.Component("f_1").element;
console.log(layout1)
//섹터 지정 
const sectors = f.Component("f_1").getSectors(); // 해당 컴포넌트와 관련된 섹터 배열
const  layout2 = f.Component("f_1", sectors[2]).element; // 타켓 섹터 지정
```

### f.Component().focus()
부르는 꼴: `f.Component(fid, sectorObject).focus()`
input 컴포넌트의 입력창에 포커스를 줄 수 있습니다.
이벤트 스크립트에서만 사용가능합니다.
대상 컨트롤 컴포넌트 : inputText, inputNumber, inputMask,inputMultiBox
예시:
```javascript
// 섹터 미지정
f.Component("f_3").focus();
// 섹터 지정
f.Component("f_3", sectorObject).focus();
```

### f.Component().getInputValue()
부르는 꼴: `f.Component(fid, sectorObject).getInputValue()`
InputText, InputNumber, InputMask 컴포넌트의 input값을 반환받을 수 있습니다.
이벤트 스크립트에서만 사용가능합니다.
대상 컨트롤 컴포넌트 : InputText, InputNumber, InputMask
예시:
```javascript
// 섹터 미지정
const textValue1 = f.Component("f_3").getInputValue();
// 섹터 지정
const textValue2 = f.Component("f_3", sectorObject).getInputValue();
```

### f.Component().getSectors()
부르는 꼴: `f.Component(fid).getSectors()`
대상 컴포넌트의 sector 리스트를 반환받을 수 있습니다.
이벤트 스크립트에서만 사용가능합니다.
예시:
```javascript
const sectors = f.Component("f_3").getSectors(); // [{"_SUID": "Yu8UBF42", ...}, ...]
```

### f.Component().getText()
부르는 꼴: `f.Component(fid, sectorObject).getText()`
text 컴포넌트의 text값을 반환받을 수 있습니다.
이벤트 스크립트에서만 사용가능합니다.
대상 컨트롤 컴포넌트 : text
예시:
```javascript
// 섹터 미지정
const textValue1 = f.Component("f_3").getText();
// 섹터 지정
const textValue2 = f.Component("f_3", sectorObject).getText();
```

### f.Component().hide()
부르는 꼴: `f.Component(fid, sectorObject).hide(animationDuration)`
컨트롤을 숨기는 스크립트 입니다. 필수 입력 체크 대상 컨트롤이 숨겨질 경우 필수입력체크 대상에서 해제 됩니다. 필수체크 대상에 다시 넣어주려면 f.Component.show()를 사용해야합니다.
 animationDuration을 통해 애니메이션 여부와 시간을 제어할 수 있습니다.
예시:
```javascript
// 섹터 미지정 => 같은 fid를 갖는 경우가 있을 때는 첫번째 요소가 숨겨집니다. 
if(조건){ 
    f.Component("f_3").show(1); //조건이 참인 경우 보여집니다.1초 동안 애니메이션 효과가 나타납니다.
}else{
    f.Component("f_3").hide(); //조건이 거짓인 경우 숨겨집니다. 애니메이션 효과가 없습니다.
}
// 섹터 지정 
if(조건){ 
    f.Component("f_3", sectorObject).show(); //조건이 참인 경우 숨겨집니다.
}else{
    f.Component("f_3", sectorObject).hide(2); 
    //조건이 거짓인 경우 숨겨집니다.2초 동안 애니메이션 효과가 나타나며 숨겨집니다.
// …
```

### f.Component().setInputValue()
부르는 꼴: `f.Component(fid, sectorObject).setInputValue(value)`
InputText, InputNumber, InputMask 컴포넌트의 input값을 변경할 수 있습니다. 컬렉션 키가 연결되어있는경우 컬렉션의 값을 변경해줍니다.
이벤트 스크립트에서만 사용가능합니다.
대상 컨트롤 컴포넌트 : InputText, InputNumber, InputMask
파라미터:
- value / 필수 / String, Number / 변경할 값
예시:
```javascript
// 섹터 미지정
f.Component("f_3").setInputValue('value2');
// 섹터 지정
f.Component("f_3", sectorObject).setInputValue('value2');
```

### f.Component().setText()
부르는 꼴: `f.Component(fid, sectorObject).setText(value)`
text 컴포넌트의 text값을 변경할 수 있습니다. text컨트롤의 타입이 텍스트인 경우, 일시적으로 값을 바꿔주고 콜렉션인 경우 해당 콜렉션의 값을 바꿔줍니다.
이벤트 스크립트에서만 사용가능합니다.
대상 컨트롤 컴포넌트 : text
파라미터:
- value / 필수 / String, Number / 변경할 값
예시:
```javascript
// 섹터 미지정
f.Component("f_3").setText('value2');
// 섹터 지정
f.Component("f_3", sectorObject).setText('value2');
```

### f.Component().show()
부르는 꼴: `f.Component(fid, sectorObject).show(animationDuration)`
컨트롤을 숨기는 스크립트 입니다. f.Compoent.hide()를 사용하여 숨겨졌던 컨트롤이 해당 함수로 다시 보여질 경우, 컨트롤이 필수체크 대상이면 필수입력체크 대상에서 복구됩니다.
 animationDuration을 통해 애니메이션 여부와 시간을 제어할 수 있습니다.

### f.Content()
부르는 꼴: `f.Content(fid, sectorSUID)`
`f.Content()` 를 통해 그룹/레이아웃을 쉽게 제어할 수 있습니다.
이벤트 스크립트에서만 사용가능합니다.
대상 컨트롤 컴포넌트 : Group, Layout
파라미터:
- fid / 필수 / String / 대상 컴포넌트 ID
- sectorSUID / String / 타겟 섹터의 SUID (SUID가 없으면 첫번째 요소 반환)
기능요소:
- addRow() / 레이아웃, 그룹 행추가
- delRow() / 레이아웃, 그룹 행삭제
- show() / 레이아웃, 그룹 보이기
- hide() / 레이아웃, 그룹 숨기기
- reload() / 레이아웃, 그룹 리로드
- reloadWithAnimation() / 레이아웃, 그룹 애니메이션과 함께 리로드
- Scroll / 레이아웃, 그룹의 스크롤을 제어

### f.Content().addRow()
부르는 꼴: `f.Content(fid, sectorSUID).addRow(categoryName, isFocus)`
그룹/레이아웃에 행을 추가합니다. sectorSUID를 지정하면 해당 섹터가 연결된 그룹/레이아웃에 섹터를 추가한다. 이때 지정한 fid에 해당하는 그룹/레이아웃이 이너블럭을 사용하는경우 이너블럭의 섹터로 추가됩니다.
이벤트 스크립트에서만 사용가능합니다.
대상 컨트롤 컴포넌트 : Group, Layout
파라미터:
- categoryName / 필수 / String / 섹터를 추가할 카테고리명
- isFocus / Boolean / 추가된 행이 보이는 위치로 이동여부 (기본값은 true)
예시:
```javascript
f.Content('f_10476').addRow('targetCategory')
f.Content('f_10476', 'ty30296N').addRow('targetCategory')
```

### f.Content().delRow()
부르는 꼴: `f.Content(fid).delRow(isReleaseSector)`
그룹/레이아웃에 행을 삭제합니다. 이때 삭제하려는 행에 연결된 컴포넌트의 이벤트를 활용해야 합니다.
이벤트 스크립트에서만 사용가능합니다.
대상 컨트롤 컴포넌트 : Group, Layout
파라미터:
- isReleaseSector / boolean / 강제삭제여부(false 면 Deleted상태가 되고, true면 완전삭제)
예시:
```javascript
f.Content('f_10476').delRow(false)
f.Content('f_10476', 'ty30296N').delRow(true)
```

### f.Content().hide()
부르는 꼴: `f.Content(fid, sectorSUID).hide()`
그룹/레이아웃을 보여지지 않도록 할 수 있습니다.
이벤트 스크립트에서만 사용가능합니다.
대상 컨트롤 컴포넌트 : Group, Layout
예시:
```javascript
f.Content('f_10476').hide()

// 특정 데이터로 그려진 그룹/레이아웃만 숨기기
f.Content('f_10476', 'ty30296N').hide()
```

### f.Content().reload()
부르는 꼴: `f.Content(fid, sectorSUID).reload()`
그룹/레이아웃을 리로드 할 수 있습니다.
이벤트 스크립트에서만 사용가능합니다.
대상 컨트롤 컴포넌트 : Group, Layout
예시:
```javascript
f.Content('f_10476').reload()

// 특정 데이터로 그려진 그룹/레이아웃만 리로드
f.Content('f_10476', 'ty30296N').reload()
```

### f.Content().reloadWithAnimation()
부르는 꼴: `f.Content(fid, sectorSUID).reloadWithAnimation()`
그룹/레이아웃을 애니메이션이 나오면서 리로드 할 수 있습니다.
이벤트 스크립트에서만 사용가능합니다.
대상 컨트롤 컴포넌트 : Group, Layout
예시:
```javascript
f.Content('f_10476').reloadWithAnimation()

// 특정 데이터로 그려진 그룹/레이아웃만 숨기기
f.Content('f_10476', 'ty30296N').reloadWithAnimation()
```

### f.Content().Scroll
부르는 꼴: `f.Content(fid, sectorSUID).Scroll`
그룹/레이아웃의 현재 스크롤의 위치를 제어 할 수 있습니다.
기능요소:
- offset / 스크롤 위치를 설정하거나 가져옵니다.
- toBottom() / 스크롤을 최하단으로 이동합니다.
- toSector() / 현재 섹터의 레이아웃으로 스크롤 이동합니다.
- toTop() / 스크롤을 최상단으로 이동합니다.

### f.Content().Scroll.offset
부르는 꼴: `f.Content(fid, sectorSUID).Scroll.offset`
현재 스크롤의 위치 offset을 설정하거나 가져옵니다.
예시:
```javascript
//그룹 혹은 레이아웃 기준
let currentOffset = f.Content("그룹/레이아웃 아이디").Scroll.offset 
f.Content("그룹/레이아웃 아이디").Scroll.offset  = 200
```

### f.Content().Scroll.toBottom()
부르는 꼴: `f.Content(fid, sectorSUID).Scroll.toBottom()`
스크롤의 위치를 최하단으로 이동합니다.
예시:
```javascript
//그룹 혹은 레이아웃 기준
f.Content("그룹/레이아웃 아이디").Scroll.toBottom()
```

### f.Content().Scroll.toSector()
부르는 꼴: `f.Content(fid, sectorSUID).Scroll.toSector(sector, isAnimate)`
섹터가 표현되는 레이아웃으로 스크롤을 이동합니다.
파라미터:
- sector / 필수 / Object / 섹터
- isAnimate / Boolean / 애니메이션 유무
### isAnimate
기본값은 true 입니다.
예시:
```javascript
//그룹 혹은 레이아웃 기준
f.Content("그룹/레이아웃 아이디").toSector(_c.activeSector, false) // 스크롤 이동 애니메이션 취소
f.Content("그룹/레이아웃 아이디").toSector(_c.lastSectors[0])  //스크롤 이동 애니메이션 적용

f.Content("그룹/레이아웃 아이디").toSector(_c.lastSectors[_c.lastSectors.length -1]) //새로 받아온 데이터의 맨 마지막으로 스크롤 이동.
```

### f.Content().Scroll.toTop()
부르는 꼴: `f.Content(fid, sectorSUID).Scroll.toTop()`
스크롤의 위치를 최상단으로 이동합니다.
예시:
```javascript
//그룹 혹은 레이아웃 기준
f.Content("그룹/레이아웃 아이디").Scroll.toTop()
```

### f.Content().show()
부르는 꼴: `f.Content(fid, sectorSUID).show()`
그룹/레이아웃을 보여지도록 할 수 있습니다.
이벤트 스크립트에서만 사용가능합니다.
대상 컨트롤 컴포넌트 : Group, Layout
컴포넌트 상태 - 숨기기인 경우 보이게 하지 않습니다.
예시:
```javascript
f.Content('f_10476').show()

// 특정 데이터로 그려진 그룹/레이아웃만 보여주기
f.Content('f_10476', 'ty30296N').show()
```

### f.Date()
부르는 꼴: `f.Date(DateString, FormatString)`
`f.Date()` 를 통해 원하는 형식의 날짜를 가져올 수 있다.
파라미터:
- DateString / String, Number / 얻고자 하는 날짜 정보를 나타내는 문자열 또는 타임스탬프 값입니다. 만약 매개변수를 사용하지 않으면 기본적으로 현재 날짜를 기준으로 합니다.
- FormatString / String / ISO 8601 형식 RFC 2822 형식 문자열 + 포맷 타임스탬프 Date 객체 / DateString의 날짜 형식을 지정하여 파싱하기 위한 값입니다. 이 매개변수를 생략하면 날짜 문자열은 ISO 8601와 RFC 2822 형식을 기반으로 파싱됩니다.
### f.Date가 지원하는 형식
* **ISO 8601 형식**
  * **`YYYY-MM-DD`**
  * **`YYYY-MM-DDTHH:mm`**
  * **`YYYY-MM-DDTHH:mm:ss`**
  * **`YYYY-MM-DDTHH:mm:ss.SSSZ`** (Z는 UTC를 의미하며, **`+hh:mm`** 또는 **`hh:mm`**&#xC73C;로 대체될 수 있음)
* **RFC 2822 형식**:
  * **`Day, DD MMM YYYY HH:mm:ss ZZ`**
* **문자열 + 포맷**: - 사용자 정의 포맷을 문자열과 함께 제공하여 파싱
  * **`f.Date("12-25-1995", "MM-DD-YYYY")`**
  * **`f.Date("2010 02", "YYYY MM")`**
* **유닉스 타임스탬프**:
  * 초 단위: **`f.Date(Number)`**
  * 밀리초 단위: **`f.Date(Number)`**
* **자바스크립트 Date 객체**:
  * **`f.Date(new Date())`**
기능요소:
- date / f.Date()로 생성된 Date객체의 ISO String을 반환
- format() / f.Date()로 생성된 Date객체를 포맷에 맞춰 반환
- getDatetime() / f.Date()로 생성된 Date객체를 'YYYYMMDDTHHmmss' 형식의 문자열로 반환
- getDate() / f.Date()로 생성된 Date객체를 'YYYYMMDD' 형식의 문자열로 반환
- getYear() / f.Date()로 생성된 Date객체의 연도를 문자열 형식으로 반환
- getMonth() / f.Date()로 생성된 Date객체의 월을 문자열 형식으로 반환
- getDay() / f.Date()로 생성된 Date객체의 일자를 문자열 형식으로 반환
- getWeekDay() / f.Date()로 생성된 Date객체의 요일을 문자열 형식으로 반환
- getTime() / f.Date()로 생성된 Date객체를 'HHmmss'형식의 문자열로 반환
- getHours() / f.Date()로 생성된 Date객체의 시를 문자열 형식으로 반환
- getMinutes() / f.Date()로 생성된 Date객체의 분을 문자열 형식으로 반환
- getSecond() / f.Date()로 생성된 Date객체의 초를 문자열 형식으로 반환
- getFirstDateOfMonth() / f.Date()로 생성된 Date객체의 첫번째 날을 Object 형태로 반환
- getLastDateOfMonth() / f.Date()로 생성된 Date객체의 마지막 날을 Object 형태로 반환
- getCalcDate() / f.Date()로 생성된 Date객체를 계산하여 날짜를 Object 형태로 반환
- getRangeOfDate() / fromDate ~ ToDate 까지의 기간의 날짜를 배열 형태로 반환
- setDatetime() / f.Date()로 생성된 Date객체의 일시를 변경
- setDate() / f.Date()로 생성된 Date객체의 일자를 변경
- setYear() / f.Date()로 생성된 Date객체의 년을 변경
- setMonth() / f.Date()로 생성된 Date객체의 월을 변경
- setDay() / f.Date()로 생성된 Date객체의 일을 변경
- setTime() / f.Date()로 생성된 Date객체의 시간을 변경
- setHours() / f.Date()로 생성된 Date객체의 시를 변경
- setMinutes() / f.Date()로 생성된 Date객체의 분을 변경
- setSecond() / f.Date()로 생성된 Date객체의 초를 변경
- getTimezoneOffset() / 현재 사용자의 타임존 offset을 반환
- getUTCTime() / 표준시에 따라 지정된 날짜의 시간에 해당하는 숫자 값을 반환
- setUTCTime() / 다른 Date 객체에 UTC 기준으로 같은 날짜와 시간을 현지 Timezone에 해당하는 시간을 반환
- calcTimezoneOffset() / f.Date()로 생성된 Date객체에 offset을 차이를 시간에 적용한 값을 반환
예시:
```javascript
f.Date(); // { "date": "1995-12-24T15:00:00.000Z" }

// ISO 8601 형식
f.Date("2024-01-01")
f.Date("2024-01-01T00:01")
f.Date("2024-01-01T00:01:00")
f.Date("2024-01-01T00:01:00.000Z")

// RFC 2822 형식
f.Date("Thu, 15 Apr 2024 09:30:00 +0900")

// 문자열 + 포멧
// …
```

### f.Date().calcTimezoneOffset()
부르는 꼴: `f.Date(DateString, FormatString).calcTimezoneOffset(offset)`
f.Date()로 생성된 Date객체에 offset을 차이를 시간에 적용한 값을 반환합니다.
 `f.Date().calcTimezoneOffset()` 만 사용 할 경우 `Object` 형태로 반환되기 때문에 원하는 값을 얻을 수 없다. 해당 메소드 뒤에 getDate(),format() 등의 문자열 반환 함수를 같이 사용하여야 한다.
파라미터:
- offset / 필수 / Number / 시간을 변경할 오프셋(분) 값
예시:
```javascript
//Seoul에 있는 사용자에게 날짜를 추출 
var SeoulDatetime = f.Date().getDatetime()
// 20220102T10:20:30
var SeoulTimezoneOffset = f.Date().getTimezoneOffset() 
// -540
var UTCDatetime = f.Date().calcTimezoneOffset(f.Date().getDatetime()).getDatetime()
```

### f.Date().date
부르는 꼴: `f.Date(DateString, FormatString).date`
f.Date()로 생성된 객체에서 날짜 값을 얻을 수 있습니다.
예시:
```javascript
// f.Date() 객체의 날짜
f.Date().date; // Tue Apr 30 2024 08:37:42 GMT+0900
```

### f.Date().format()
부르는 꼴: `f.Date(DateString, FormatString).format(formatToken)`
파라미터:
- YYYY / 4 digit year / 2014
- YY / 2 digit year / 14
- Y / Year with any number of digits and sign / -25
- Q / Quarter of year. Sets month to first month in quarter. / 1..4
- M MM / Month number / 1..12
- MMM MMMM / Month name in locale set by moment.locale() / Jan..December
- D DD / Day of month / 1..31
- Do / Day of month with ordinal / 1st..31st
- DDD DDDD / Day of year / 1..365
- ddd dddd / Day name in locale set by moment.locale() / Mon...Sunday
- H HH / Hours (24 hour time) / 0..23
- h hh / Hours (12 hour time used with a A.) / 1..12
- k kk / Hours (24 hour time from 1 to 24) / 1..24
- a A / Post or ante meridiem (Note the one character a p are also considered valid) / am pm
- m mm / Minutes / 0..59
- Z ZZ / Time zone / +09:00
- S SS SSS ... SSSSSSSSS / Fractional seconds / 0..999999999
- s ss / Offset from UTC as +-HH:mm, +-HHmm, or Z / +12:00
### Tokens
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
//f.Date() 는 현재시간을 가져오게 됩니다. 
f.Date().format('YYYY') //2020
f.Date().format('MM') // 10
f.Date().format('DD') // 22
f.Date().format('YYYYMM') //202010
f.Date().format('MMDD') //1022
f.Date().format('YYYY-MM-DD') //2020-10-22
f.Date().format('YYYY.MM.DD') //2020.10.22
f.Date().format('YYYY/MM/DD') //2020/10/22
f.Date().format('MM|DD') // 10|22
```

### f.Date().getCalcDate()
부르는 꼴: `f.Date(DateString, FormatString).getCalcDate(formatType, value)`
매개변수로 넘어온 formatToken, number 값을 통해 계산 된 날짜를 Object 형태로 반환합니다.
 `f.Date().getCalcDate()` 만 사용 할 경우 `Object` 형태로 반환되기 때문에 원하는 값을 얻을 수 없다. 해당 메소드 뒤에 getDate(),format() 등의 문자열 반환 함수를 같이 사용하여야 한다.
파라미터:
- Y / 년도를 변경
- M / 월을 변경
- D / 일을 변경
### Tokens
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().getCalcDate('Y',-1).getDate() // 20191022
f.Date().getCalcDate('M',1).getMonth() // 11
f.Date().getCalcDate('Y',1).format('YYYYMM') //202110
```

### f.Date().getDate()
부르는 꼴: `f.Date(DateString, FormatString).getDate()`
f.Date()로 생성된 Date객체를 'YYYYMMDD' 형식의 문자열로 반환합니다.
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().getDate() // 20201022
f.Date('2020-10-31').getDate() //20201031
```

### f.Date().getDatetime()
부르는 꼴: `f.Date(DateString, FormatString).getDatetime()`
f.Date()로 생성된 Date객체를 'YYYYMMDDTHHmmss' 형식의 문자열로 반환합니다.
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().getDatetime()   // 20201022T151029
```

### f.Date().getDay()
부르는 꼴: `f.Date(DateString, FormatString).getDay()`
f.Date()로 생성된 Date객체의 일자를 문자열 형식으로 반환합니다.
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().getDay// 22
f.Date('20200101').getDay() //1
```

### f.Date().getFirstDateOfMonth()
부르는 꼴: `f.Date(DateString, FormatString).getFirstDateOfMonth()`
f.Date()로 생성된 Date객체의 첫번째 날을 Object 형태로 반환합니다.
 `f.Date().getFirstDateOfMonth()` 만 사용 할 경우 `Object` 형태로 반환되기 때문에 원하는 값을 얻을 수 없다. 해당 메소드 뒤에 getDate(),format() 등의 문자열 반환 함수를 같이 사용하여야 한다.
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().getFirstDateOfMonth().getDate() // 20201001
f.Date().getFirstDateOfMonth().getDay() //1
f.Date().getFirstDateOfMonth().format('YYYY/MM/DD')  //2020/10/01
```

### f.Date().getHours()
부르는 꼴: `f.Date(DateString, FormatString).getHours()`
f.Date()로 생성된 Date객체의 시를 숫자 형식으로 반환합니다.
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().getHours()   // 15
```

### f.Date().getLastDateOfMonth()
부르는 꼴: `f.Date(DateString, FormatString).getLastDateOfMonth()`
f.Date()로 생성된 Date객체의 마지막 날을 Object 형태로 반환합니다.
 `f.Date().getLastDateOfMonth()` 만 사용 할 경우 `Object` 형태로 반환되기 때문에 원하는 값을 얻을 수 없다. 해당 메소드 뒤에 getDate(),format() 등의 문자열 반환 함수를 같이 사용하여야 한다.
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().getLastDateOfMonth().getDate() // 202010031
f.Date().getLastDateOfMonth().getDay() //31
f.Date().getLastDateOfMonth().format('YYYY/MM/DD')  //2020/10/31
```

### f.Date().getMinutes()
부르는 꼴: `f.Date(DateString, FormatString).getMinutes()`
f.Date()로 생성된 Date객체의 분을 숫자 형식으로 반환합니다.
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().getMinutes()   // 10
```

### f.Date().getMonth()
부르는 꼴: `f.Date(DateString, FormatString).getMonth()`
f.Date()로 생성된 Date객체의 월을 문자열 형식으로 반환합니다.
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().getMonth() // 10

var nextMonth = f.Date().getCalcDate('M',1).getDate() // 20201122
f.Date(nextMonth).getMonth() // 11
```

### f.Date().getRangeOfDate()
부르는 꼴: `f.Date(DateString, FormatString).getRangeOfDate(fromDate, toDate)`
fromDate \~ toDate 까지의 기간의 날짜를 배열 형태로 반환합니다.
파라미터:
- fromDate / 필수 / String / 시작일
- toDate / 필수 / String / 종료일
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 00:00:00 GMT+0900 (대한민국 표준시)
f.Date().getRangeOfDate('20210101','20210103')  // ['20200101', '20200102', '20200103']
```

### f.Date().getSecond()
부르는 꼴: `f.Date(DateString, FormatString).getSecond()`
f.Date()로 생성된 Date객체의 초를 숫자 형식으로 반환합니다.
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().getSecond()  // 29
```

### f.Date().getTime()
부르는 꼴: `f.Date(DateString, FormatString).getTime()`
f.Date()로 생성된 Date객체를 'HHmmss'형식의 문자열로 반환합니다.
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().getTime()   // 151029
```

### f.Date().getTimezoneOffset()
부르는 꼴: `f.Date(DateString, FormatString).getTimezoneOffset()`
현재 사용자의 타임존 offset을 반환합니다.
시간대 오프셋은 UTC와 현지 시간의 차이 (분)입니다. 이것은 로컬 시간대가 UTC보다 뒤떨어져 있으면 오프셋이 양수이고 앞에있을 경우 음수임을 의미합니다. 예를 들어, 시간대 UTC + 10 : 00 (오스트레일리아 동부 표준시, 블라디보스토크 시간, 차모로 표준시)의 경우 -600이 반환됩니다
예시:
```javascript
// 호스트 장치의 현재 시간대 시차를 시간으로 가져 오기
var x = f.Date();
var currentTimeZoneOffsetInHours = x.getTimezoneOffset() / 60;

// 서울에서의 타임존 offset
f.Date().getTimezoneOffset() // -540
```

### f.Date().getUTCTime()
부르는 꼴: `f.Date(DateString, FormatString).getUTCTime()`
표준시에 따라 지정된 날짜의 시간에 해당하는 값을 반환합니다.
1970 년 1 월 1 일 00:00:00 UTC와 주어진 날짜 사이의 경과 시간 (밀리 초)을 나타내는 숫자입니다.
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
var UTCTime = f.Date().getUTCTime();  // 1603347029000
```

### f.Date().getWeekDay()
부르는 꼴: `f.Date(DateString, FormatString).getWeekDay()`
f.Date()로 생성된 Date객체의 요일을 문자열 형식으로 반환합니다.
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().getWeekDay() //목
```

### f.Date().getYear()
부르는 꼴: `f.Date(DateString, FormatString).getYear()`
f.Date()로 생성된 Date객체의 연도를 문자열 형식으로 반환합니다.
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().getYear() // 2020
f.Date('20100101').getYear() // 2010

var nextYear = f.Date().getCalcDate('Y',1).getDate();  //20211022
f.Date(nextYear).getYear() // 2021
```

### f.Date().setDate()
부르는 꼴: `f.Date(DateString, FormatString).setDate(date)`
f.Date()로 생성된 Date객체의 일시를 변경합니다.
 `f.Date().setDate()` 만 사용 할 경우 `Object` 형태로 반환되기 때문에 원하는 값을 얻을 수 없다. 해당 메소드 뒤에 getDate(),format() 등의 문자열 반환 함수를 같이 사용하여야 한다.
파라미터:
- date / 필수 / String / 변경할 날짜 문자열
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().setDate('20210101').date  // Fri Jan 01 2021 15:10:29 GMT+0900 (대한민국 표준시)
```

### f.Date().setDatetime()
부르는 꼴: `f.Date(DateString, FormatString).setDatetime(datetime)`
f.Date()로 생성된 Date객체의 일시를 변경합니다.
 `f.Date().setDatetime()` 만 사용 할 경우 `Object` 형태로 반환되기 때문에 원하는 값을 얻을 수 없다. 해당 메소드 뒤에 getDate(),format() 등의 문자열 반환 함수를 같이 사용하여야 한다.
파라미터:
- datetime / 필수 / String / 변경할 dateTime 문자열
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().setDatetime('20210101T100520').date  // Fri Jan 01 2021 10:05:20 GMT+0900 (대한민국 표준시)
```

### f.Date().setDay()
부르는 꼴: `f.Date(DateString, FormatString).setDay(day)`
f.Date()로 생성된 Date객체의 일을 변경합니다.
 `f.Date().setDay()` 만 사용 할 경우 `Object` 형태로 반환되기 때문에 원하는 값을 얻을 수 없다. 해당 메소드 뒤에 getDate(),format() 등의 문자열 반환 함수를 같이 사용하여야 한다.
파라미터:
- day / 필수 / Number / 변경할 일 값
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().setDay(10).date  // Sat Oct 10 2020 15:10:29 GMT+0900 (대한민국 표준시)
```

### f.Date().setHours()
부르는 꼴: `f.Date(DateString, FormatString).setHours(hours)`
f.Date()로 생성된 Date객체의 시를 변경합니다.
 `f.Date().setHours()` 만 사용 할 경우 `Object` 형태로 반환되기 때문에 원하는 값을 얻을 수 없다. 해당 메소드 뒤에 getDate(),format() 등의 문자열 반환 함수를 같이 사용하여야 한다.
파라미터:
- hours / 필수 / Number / 변경할 시 값
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().setHours(10).date  // Thu Oct 22 2020 10:10:29 GMT+0900 (대한민국 표준시)
```

### f.Date().setMinutes()
부르는 꼴: `f.Date(DateString, FormatString).setMinutes(min)`
f.Date()로 생성된 Date객체의 분을 변경합니다.
 `f.Date().setMinutes()` 만 사용 할 경우 `Object` 형태로 반환되기 때문에 원하는 값을 얻을 수 없다. 해당 메소드 뒤에 getDate(),format() 등의 문자열 반환 함수를 같이 사용하여야 한다.
파라미터:
- min / 필수 / Number / 변경할 분 값
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().setMinutes(15).date  // Thu Oct 22 2020 15:15:29 GMT+0900 (대한민국 표준시)
```

### f.Date().setMonth()
부르는 꼴: `f.Date(DateString, FormatString).setMonth(month)`
f.Date()로 생성된 Date객체의 월을 변경합니다.
 `f.Date().setMonth()` 만 사용 할 경우 `Object` 형태로 반환되기 때문에 원하는 값을 얻을 수 없다. 해당 메소드 뒤에 getDate(),format() 등의 문자열 반환 함수를 같이 사용하여야 한다.
파라미터:
- month / 필수 / Number / 변경할 월 값
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().setMonth(11).date  // Sun Nov 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
```

### f.Date().setSecond()
부르는 꼴: `f.Date(DateString, FormatString).setSecond(sec)`
f.Date()로 생성된 Date객체의 초를 변경합니다.
 `f.Date().setSecond()` 만 사용 할 경우 `Object` 형태로 반환되기 때문에 원하는 값을 얻을 수 없다. 해당 메소드 뒤에 getDate(),format() 등의 문자열 반환 함수를 같이 사용하여야 한다.
파라미터:
- sec / 필수 / Number / 변경할 초 값
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().setSecond(5).date  // Thu Oct 22 2020 15:10:05 GMT+0900 (대한민국 표준시)
```

### f.Date().setTime()
부르는 꼴: `f.Date(DateString, FormatString).setTime(time)`
f.Date()로 생성된 Date객체의 시간을 변경합니다.
 `f.Date().setTime()` 만 사용 할 경우 `Object` 형태로 반환되기 때문에 원하는 값을 얻을 수 없다. 해당 메소드 뒤에 getDate(),format() 등의 문자열 반환 함수를 같이 사용하여야 한다.
파라미터:
- time / 필수 / String / 변경할 시간 문자열
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().setTime('101500').date  // Thu Oct 22 2020 10:15:00 GMT+0900 (대한민국 표준시)
```

### f.Date().setUTCTime()
부르는 꼴: `f.Date(DateString, FormatString).setUTCTime(UTCTime)`
다른 Date 객체에 UTC 기준으로 같은 날짜와 시간을 현지 Timezone에 해당하는 시간을 반환합니다.
 `f.Date().setUTCTime()` 만 사용 할 경우 `Object` 형태로 반환되기 때문에 원하는 값을 얻을 수 없다. 해당 메소드 뒤에 getDate(),format() 등의 문자열 반환 함수를 같이 사용하여야 한다.
파라미터:
- UTCTime / 필수 / Number / 변경할 UTCTime 값
예시:
```javascript
//Seoul에 있는 사용자에서 날짜를 추출 
var registeredDate = f.Date()
console.log(registeredDate) //Tue Dec 21 2021 09:03:03 GMT+0900 (Seoul 표준시)

var utcTime = registeredDate.getUTCTime()


//Hawai에 있는 사용자에게 날짜를 보여주기 
var currentDate = f.Date().setUTCTime(utcTime) // f.Date(tucTime)
console.log(currentDate) // Tue Dec 20 2021 14:03:03 GMT-1000 (Hawai 표준시)
```

### f.Date().setYear()
부르는 꼴: `f.Date(DateString, FormatString).setYear(year)`
f.Date()로 생성된 Date객체의 년을 변경합니다.
 `f.Date().setYear()` 만 사용 할 경우 `Object` 형태로 반환되기 때문에 원하는 값을 얻을 수 없다. 해당 메소드 뒤에 getDate(),format() 등의 문자열 반환 함수를 같이 사용하여야 한다.
파라미터:
- year / 필수 / Number / 변경할 년도 값
예시:
```javascript
//f.Date().date == Thu Oct 22 2020 15:10:29 GMT+0900 (대한민국 표준시)
f.Date().setYear(2021).date  // Fri Oct 22 2021 15:10:29 GMT+0900 (대한민국 표준시)
```
