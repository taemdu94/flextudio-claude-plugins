# 공식 스크립트 명세 요약: sector, Load

이 파일이 답하는 질문: sector, Load 함수의 뜻, 파라미터(필수 여부·타입·설명), 기본값, 예시

공식 스크립트 명세(https://docs.flextudio.com/flextudio)의 쪽마다 개요, 파라미터, 예시 앞부분을 옮긴 것입니다.
다른 참조 파일의 규칙(실측·검증된 동작)과 다르면 그쪽을 따르세요. 명세 예시 코드에는 오타가 있을 수 있으니 그대로 복사하지 말고 부르는 꼴을 기준으로 다시 쓰세요.

목차: Load / Load.control / Load.control.activeIndex() / Load.control.activeTabClick() / Load.control.activeValue() / Load.control.addClass() / Load.control.arrow() / Load.control.authkey / Load.control.authkey.add() / Load.control.authkey.remove() / Load.control.badge() / Load.control.bg / Load.control.bg.color() / Load.control.bg.shadow() / Load.control.bg.useImage() / Load.control.caption / Load.control.caption.align() / Load.control.caption.bold() / Load.control.caption.color() / Load.control.caption.position() / Load.control.caption.size() / Load.control.caption.text() / Load.control.controlkey() / Load.control.dateformat() / Load.control.dlg / Load.control.dlg.maxHeight() / Load.control.dlg.width() / Load.control.expandAll() / Load.control.font / Load.control.font.align() / Load.control.font.bold() / Load.control.font.color() / Load.control.font.size() / Load.control.font.underline() / Load.control.image / Load.control.image.color() / Load.control.image.name() / Load.control.image.size() / Load.control.placeholder() / Load.control.style() / Load.control.text() / Load.layout / Load.layout.addClass() / Load.layout.controlkey() / Load.layout.style() / Load.sector / Sector 객체의 프로퍼티 및 함수 활용 / sector.activate() / sector.delete() / sector.isActive / sector.isAdded / sector.isDeleted / sector.isLast / sector.isSelected / sector.isUpdated / sector.keys / sector.mergeSector() / sector.release() / sector.remove() / sector.replaceSector() / sector.select() / sector.set() / sector.unSelect()

### Load
부르는 꼴: `{% hint style="warning" %}`
Load 되는 현재 시점에 대해서 데이터를 제공합니다.
기능요소:
- sector / Layout, Group, Control이 연결된 섹터 값을 반환합니다.
- layout / Layout, Group에 대한 설정을 할 수 있습니다.
- control / Control에 대한 설정을 할 수 있습니다.

### Load.control
부르는 꼴: `Current.control`
`Load.control`을 통해 컴포넌트가 스텝에 Load되는 시점의 컨트롤을 조작할 수 있습니다.
기능요소:
- controlkey() / 컴포넌트의 상태 값을 설정 할 수 있습니다.
- font / 폰트에 대한 설정을 할 수 있습니다.
- bg / 백그라운드에 대한 설정을 할 수 있습니다.
- image / 아이콘에 대한 설정을 할 수 있습니다.
- style() / 스타일 속성을 설정할 수 있습니다.
- text() / 문구를 설정할 수 있습니다.
- badge() / 뱃지를 설정할 수 있습니다.
- arrow() / Arrow 아이콘 사용 여부를 설정할 수 있습니다.
- placeholder() / placeholder를 설정할 수 있습니다.
- authkey / 권한키를 추가하고 제거할 수 있습니다.
- caption / 캡션를 설정할 수 있습니다.
- dateformat() / 날짜 형식을 설정할 수 있습니다.
- activeIndex() / active tab을 index기준으로 설정할 수 있습니다.
- activeValue() / active tab을 Value기준으로 설정할 수 있습니다.
- activeTabClick() / active tab의 이벤트를 실행할 수 있습니다.
- expandAll() / Tree 컨트롤의 노드를 전체 펼쳐서 볼 수 있습니다.
- addClass() / 클래스를 추가할 수 있습니다.
- dlg / PC버전에서 다이얼로그 크기를 설정 할 수 있습니다.

### Load.control.activeIndex()
부르는 꼴: `Load.control.activeIndex(index)`
현재 Load된 Tab컨트롤의 선택된 탭을 설정할 수 있습니다. 탭을 선택하는 동작만 수행하고, 해당 탭과 관련된 이벤트 처리는 별도의 Current.control.activeTabClick() 함수를 통해 수행되어야 합니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Tab
파라미터:
- index / Number / 탭 index(첫번째 탭은 index 0)
예시:
```javascript
Load.control.activeIndex(0); // 첫번째 탭(HOME) 선택
Load.control.arrow(1); // 두번째 탭(COFFEE) 선택
```

### Load.control.activeTabClick()
부르는 꼴: `Load.control.activeTabClick(isClick)`
현재 Load된 Tab컨트롤의 선택된 탭의 이벤트를 실행합니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Tab
파라미터:
- isClick / Boolean / 선택할 탭 항목 값
예시:
```javascript
Load.control.activeTabClick(); // true (탭 이벤트 실행)
Load.control.activeTabClick(true); // true (탭 이벤트 실행)
Load.control.activeTabClick(false); // false
```

### Load.control.activeValue()
부르는 꼴: `Load.control.activeValue(value)`
현재 Load된 Tab컨트롤의 선택된 탭을 설정할 수 있습니다. 탭을 선택하는 동작만 수행하고, 해당 탭과 관련된 이벤트 처리는 별도의 Current.control.activeTabClick() 함수를 통해 수행되어야 합니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Tab
파라미터:
- value / String / 선택할 탭 항목 값
예시:
```javascript
Load.control.activeValue("BOTTLE"); // 탭 항목 값이 BOTTLE인 탭 선택
```

### Load.control.addClass()
부르는 꼴: `Load.control.addClass(param1);`
control에 클래스를 직접 추가할 수 있습니다.
로드 스크립트에서만 사용가능합니다.
클래스명은 cust\_ 로 시작해야하며, 띄어쓰기로 구분하여 한번에 입력 또는 매개변수 파람으로 입력 모두 지원합니다.
파라미터:
- param1 / String / 클래스명은 "cust\_"로 시작해야합니다.
예시:
```javascript
Load.control.addClass(”cust_class1”, ”cust_class2”, ”cust_class3”)
Load.control.addClass(”cust_class1 cust_class2 cust_class3”)
```

### Load.control.arrow()
부르는 꼴: `Load.control.arrow(useIcon)`
현재 Load된 버튼의 버튼 뱃지에 표시될 값을 설정할 수 있습니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Button
파라미터:
- useIcon / String / 버튼 Arrow 아이콘 사용 여부
예시:
```javascript
Load.control.arrow(); // true
Load.control.arrow(true); // true
Load.control.arrow(false); // false
```

### Load.control.authkey
컨트롤의 권한키를 추가하고 삭제할 수 있습니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : InputText , InputNumber, InputMask, TextArea, InputDate, Label
기능요소:
- add() / 권한키 추가
- remove() / 권한키 삭제

### Load.control.authkey.add()
부르는 꼴: `Load.control.authkey.add(authkey)`
현재 컨트롤에 권한키를 추가합니다.
파라미터:
- authkey / 필수 / String / 권한키 명
예시:
```javascript
Load.control.authkey.add('auth')
```

### Load.control.authkey.remove()
부르는 꼴: `Load.control.authkey.remove(authkey)`
현재 컨트롤에 권한키를 삭제합니다.
파라미터:
- authkey / 필수 / String / 권한키 명
예시:
```javascript
Load.control.authkey.remove('auth')     // 삭제할 권한 키 입력
```

### Load.control.badge()
부르는 꼴: `Load.control.badge(value)`
현재 Load된 버튼의 버튼 뱃지에 표시될 값을 설정할 수 있습니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Button
파라미터:
- value / String / 표시될 값
예시:
```javascript
Load.control.badge('뱃지')
```

### Load.control.bg
컨트롤의 배경 속성을 설정합니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Button, InputText , InputNumber, InputMask,TextArea, InputDate, Label
기능요소:
- color() / 배경색을 설정합니다.
- shadow() / 배경 그림자를 설정합니다.
- useImage() / 배경 이미지를 설정합니다.

### Load.control.bg.color()
부르는 꼴: `Load.control.bg.color(color)`
배경 색상을 설정합니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Button, InputText, InputNumber, InputMask, TextArea, InputDate, Label, ComboBox, InputCodehelp
파라미터:
- color / 필수 / String / 배경색
예시:
```javascript
if (Load.sector.StatusSeq == 1) { 
    Load.control.bg.color('rgba(54, 116, 227, 0.1)');
    //Load.control.bg.color('#cccccc') 
}
```

### Load.control.bg.shadow()
부르는 꼴: `Load.control.bg.shadow(useShadow)`
배경 그림자를 설정합니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Button, InputText, InputNumber, InputMask, TextArea, InputDate, Label, ComboBox, InputCodehelp
파라미터:
- useShadow / Boolean / 그림자 유무
### useShadow
기본값을 true 입니다.
예시:
```javascript
if (Load.sector.StatusSeq == 1) { 
    Load.control.bg.shadow(false); 
}
```

### Load.control.bg.useImage()
부르는 꼴: `Load.control.bg.useImage(useImage)`
배경 이미지의 사용 유무를 설정합니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Button, InputText, InputNumber, InputMask, TextArea, InputDate, Label, ComboBox, InputCodehelp
파라미터:
- useImage / Boolean / 사용 유무
### useImage
기본값은 true 입니다.
예시:
```javascript
if (Load.sector.StatusSeq == 1) { 
    Load.control.bg.useImage(false);
}
```

### Load.control.caption
컨트롤의 캡션 속성을 설정합니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : InputText , InputNumber, InputMask, TextArea, InputDate
기능요소:
- align() / 캡션을 정렬합니다.
- bold() / 캡션 폰트 bold 사용여부를 설정합니다.
- color() / 캡션 폰트 색상을 설정합니다.
- position() / 캡션 위치를 설정합니다.
- size() / 캡션 폰트 크기를 설정합니다.
- text() / 캡션명을 설정합니다.

### Load.control.caption.align()
부르는 꼴: `Load.control.caption.align(align)`
캡션 정렬을 정렬합니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : InputText, InputNumber, InputMask, TextArea, InputDate, ComboBox, InputCodehelp
파라미터:
- align / 필수 / String / Current.control.caption.position() 값이 Top(기본값)으로 설정되어 있어야 캡션 정렬이 적용됩니다. / 정렬 타입
### align
정렬 타입은 아래 중 하나를 선택합니다.
* left (좌측정렬)
* center (중앙정렬)
* right (우측정렬)
예시:
```javascript
if (Load.sector.StatusSeq == 1) { 
    Load.control.caption.align('left'); 
}
```

### Load.control.caption.bold()
부르는 꼴: `Current.control.caption.bold(useBold)`
캡션 폰트의 bold 속성 사용여부를 설정합니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : InputText, InputNumber, InputMask, TextArea, InputDate, ComboBox, InputCodehelp
파라미터:
- useBold / Boolean / bold 사용여부
### useBold
기본값은 true 입니다.
예시:
```javascript
if (Load.sector.StatusSeq == 1) { 
    Load.control.caption.bold(false); 
}
```

### Load.control.caption.color()
부르는 꼴: `Load.control.caption.color(color)`
캡션 폰트의 색상을 설정합니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : InputText, InputNumber, InputMask, TextArea, InputDate, ComboBox, InputCodehelp
파라미터:
- color / 필수 / String / 캡션 색상
예시:
```javascript
if (Load.sector.StatusSeq == 1) { 
    Load.control.caption.color('rgba(54, 116, 227, 0.1)');
    //Load.control.bg.color('#cccccc')  
}
```

### Load.control.caption.position()
부르는 꼴: `Load.control.caption.position(pos)`
캡션 폰트의 위치를 설정합니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : InputText, InputNumber, InputMask, TextArea, InputDate, ComboBox, InputCodehelp
파라미터:
- pos / String / 캡션 위치
### pos
빈 값일 때 상단의 위치로 설정되고 "left"의 값으로 좌측에 위치하도록 설정할 수 있습니다.
예시:
```javascript
if (Load.sector.StatusSeq == 1) { 
    Load.control.caption.position();
    //    Load.control.caption.position('left');
}
```

### Load.control.caption.size()
부르는 꼴: `Load.control.caption.size(size)`
캡션 폰트의 크기를 설정합니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : InputText, InputNumber, InputMask, TextArea, InputDate, ComboBox, InputCodehelp
파라미터:
- size / 필수 / Number / 캡션 크기
예시:
```javascript
if (Load.sector.StatusSeq == 1) { 
    Load.control.caption.size(12);
}
```

### Load.control.caption.text()
부르는 꼴: `Load.control.caption.text(text)`
캡션명을 설정합니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : InputText, InputNumber, InputMask, TextArea, InputDate, ComboBox, InputCodehelp
파라미터:
- text / 필수 / String / 캡션명
예시:
```javascript
if (Load.sector.StatusSeq == 1) { 
    Load.control.caption.text('캡션명입니다.')
}
```

### Load.control.controlkey()
부르는 꼴: `Load.control.controlkey(status)`
현재 Load된 컴포넌트의 상태를 변경 할 수 있습니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Button, InputText , InputNumber, InputMask,TextArea, InputDate
파라미터:
- '' / 활성화
- 'dis' / 비활성화
- 'hid' / 숨기기
- 'nos' / 필수입력
- 'readonly' / 읽기전용
### status
예시:
```javascript
Load.control.controlkey('');      // 초기화
Load.control.controlkey('hid')    // 숨김
```

### Load.control.dateformat()
부르는 꼴: `Load.control.dateformat(format)`
현재 Load된 날짜 선택시 보여지는 Format 설정을 할 수 있습니다. 컬렉션 키를 설정한 경우에만 선택된 날짜 값이 inputBox에 보여지게됩니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : InputDate
파라미터:
- YYYY.MM.DD / 2024.12.31
- YYYY/MM/DD / 2024/12/31
- YYYY-MM-DD / 2024-12-31
- YYYY년MM월DD일 / 2024년12월31일
- YYYY.MM / 2024.12
- YYYY/MM / 2024/12
- YYYY-MM / 2024-12
- YYYY년MM월 / 2024년12월
- YYYY년 / 2024년
### format
예시:
```javascript
Load.control.dateformat('YYYY.MM.DD');
```

### Load.control.dlg
combo, search 컨트롤을 대상으로 하는 스크립트입니다. **PC에서의 다이얼로그 크기**를 지정할 수 있게 합니다.
로드 스크립트에서만 사용가능합니다. PC버전에서만 동작합니다.
대상컨트롤 :  InputCombo,InputSearch
기능요소:
- width() / 다이얼로그의 너비를 설정합니다.
- maxHeight() / 다이얼로그의 최대 높이를 설정합니다.

### Load.control.dlg.maxHeight()
부르는 꼴: `Load.control.dlg.maxHeight(maxHeight)`
combo, search 컨트롤의 **PC에서의 다이얼로그 최대 높이**를 지정할 수 있게 하는 스크립트 입니다.
로드 스크립트에서만 사용가능합니다. PC버전에서만 동작합니다.
대상컨트롤 : InputCombo,InputSearch
파라미터:
- maxHeight / 필수 / String / 최대 높이 값
예시:
```javascript
Load.control.dlg.maxHeight("200px") //PC버전에서 다이얼로그 높이가 최대 200px로 보여짐
```

### Load.control.dlg.width()
부르는 꼴: `Load.control.dlg.width(width)`
combo, search 컨트롤의 **PC에서의 다이얼로그 너비**를 지정할 수 있게 하는 스크립트 입니다.
로드 스크립트에서만 사용가능합니다. PC버전에서만 동작합니다.
대상컨트롤 : InputCombo,InputSearch
파라미터:
- width / 필수 / String / 너비값
예시:
```javascript
Load.control.dlg.width("100px") //PC버전에서 다이얼로그 너비가 100px로 보여짐
```

### Load.control.expandAll()
부르는 꼴: `Load.control.expandAll(Param1)`
Tree 컨트롤이 Load 될 때 Tree의 노드가 전체 펼쳐진 상태로 보이게 할 수 있습니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Tree
파라미터:
- Param1 / Boolean / true/false
예시:
```javascript
Load.control.expandAll(true);    // 트리 펼쳐짐 상태
```

### Load.control.font
컨트롤의 폰트 속성을 설정합니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Button, InputText , InputNumber, InputMask,TextArea, InputDate, Label
기능요소:
- align() / 폰트 정렬을 설정합니다.
- bold() / 폰트 bold 사용유무를 설정합니다.
- color() / 폰트 색상을 설정합니다.
- size() / 폰트 크기를 설정합니다.
- underline() / 폰트 밑줄의 사용유무를 설정합니다.

### Load.control.font.align()
부르는 꼴: ` Load.control.font.align(align)`
폰트 정렬을 설정합니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Button, InputText, InputNumber, InputMask, TextArea, InputDate, Label, ComboBox, InputCodehelp
파라미터:
- align / 필수 / String / 정렬 타입
### align
정렬 타입은 아래 중 하나를 선택합니다.
* left (좌측정렬)
* center (중앙정렬)
* right (우측정렬)
예시:
```javascript
if (Load.sector.StatusSeq == 1) { 
    Load.control.font.align('left');
}
```

### Load.control.font.bold()
부르는 꼴: ` Load.control.font.bold(usebold)`
폰트의 bold 속성 사용여부를 설정합니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Button, InputText, InputNumber, InputMask, TextArea, InputDate, Label, ComboBox, InputCodehelp
파라미터:
- usebold / Boolean / bold 사용여부
### usebold
기본값은 true 입니다.
예시:
```javascript
if (Load.sector.StatusSeq == 1) { 
    Load.control.font.bold(false); 
}
```

### Load.control.font.color()
부르는 꼴: ` Load.control.font.color(color)`
폰트의 색상을 설정합니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Button, InputText, InputNumber, InputMask, TextArea, InputDate, Label, ComboBox, InputCodehelp
파라미터:
- color / 필수 / String / 폰트 색상
예시:
```javascript
if (Load.sector.StatusSeq == 1) { 
    Load.control.font.color('rgba(54, 116, 227, 0.1)');
    //Load.control.font.color('#cccccc')  
}
```

### Load.control.font.size()
부르는 꼴: `Current.control.font.size(size)`
폰트의 크기를 설정합니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Button, InputText, InputNumber, InputMask, TextArea, InputDate, Label, ComboBox, InputCodehelp
파라미터:
- size / 필수 / Number / 폰트 크기
예시:
```javascript
if (Load.sector.StatusSeq == 1) { 
    Load.control.font.size(12);
}
```

### Load.control.font.underline()
부르는 꼴: `Current.control.font.underline(useUnderline)`
폰트의 밑줄 사용여부를 설정합니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Button, InputText, InputNumber, InputMask, TextArea, InputDate, Label, ComboBox, InputCodehelp
파라미터:
- useUnderline / Boolean / 폰트 밑줄 사용유무
### useUnderline
기본값은 true 입니다.
예시:
```javascript
if (Load.sector.StatusSeq == 1) { 
    Load.control.font.underline();
    //Current.control.font.underline(false);
}
```

### Load.control.image
현재 Load된 버튼의 아이콘 이미지를 설정할 수 있습니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Button, Label
기능요소:
- name() / 아이콘 지정
- color() / Line icon의 아이콘 색상 설정
- size() / 아이콘 크기 설정

### Load.control.image.color()
부르는 꼴: `Load.control.image.color(color)`
현재 Load된 버튼의 Line Icon 색상 값을 설정할 수 있습니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Button
파라미터:
- color / String / HTML 색상 값으로 사용하는 색상 이름 값, RGB, HEX 등의 값들이 사용 가능합니다.
예시:
```javascript
Load.control.image.color('Tomato')
Load.control.image.color('rgb(244, 67, 54)')
Load.control.image.color('#F44335')
```

### Load.control.image.name()
부르는 꼴: `Load.control.image.name(imageName)`
현재 Load된 버튼의 아이콘 이미지를 설정할 수 있습니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Button
파라미터:
- imageName / String / 아이콘 구성요소 값
### imageName
아이콘 이미지 페이지의 아이콘을 선택합니다. 좌측 구정요소의 구성요소 값을 imageName 에 입력합니다.
1페이지는 일반 아이콘이고, 2페이지는 Line Icon으로 색상을 변경할 수 있습니다.
<figure><figcaption></figcaption></figure>
예시:
```javascript
//일반 아이콘
Load.control.image.name('C_000_001')
//Line Icon
Load.control.image.name('B_000_002')
```

### Load.control.image.size()
부르는 꼴: `Load.control.image.size(size)`
현재 Load된 버튼의 버튼 아이콘의 크기를 설정할 수 있습니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Button
파라미터:
- size / String / 사이즈 값
예시:
```javascript
Load.control.image.size(100)
```

### Load.control.placeholder()
부르는 꼴: `Load.control.placeholder(hint)`
현재 Load된 입력 컨트롤의 도움말을 설정할 수 있습니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : InputText , InputNumber, InputMask, TextArea
파라미터:
- hint / String / 입력필드 도움말
예시:
```javascript
Load.control.placeholder('사원명')
```

### Load.control.style()
부르는 꼴: `Load.control.style(param1);`
컨트롤의 스타일을 설정 할 수 있습니다. style 사용시 동일한 디자인 속성의 경우 프로퍼티의 설정보다 스크립트의 설정이 우선됩니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Button, InputText , InputNumber, InputMask,TextArea, Label
파라미터:
- param1 / String / property:value;  형식으로 사용 가능 / property 는 css 속성이고 value는 css 값 입니다.
예시:
```javascript
Load.control.style('width:30px; height:100%;');
```

### Load.control.text()
부르는 꼴: `Load.control.text(name)`
현재 Load된 버튼의 컨트롤 명칭을 설정할 수 있습니다.
로드 스크립트에서만 사용가능합니다.
대상컨트롤 : Button, Label
파라미터:
- name / String / 명칭
예시:
```javascript
Load.control.text('저장')
```

### Load.layout
`Load.layout` 을 통해 컴포넌트가 스텝에 Load되는 시점의 Group을 조작할 수 있습니다.
기능요소:
- controlkey() / 컴포넌트의 상태 값을 설정 할 수 있습니다.
- style() / 스타일 속성을 설정할 수 있습니다.
- addClass() / 클래스를 추가할 수 있습니다.

### Load.layout.addClass()
부르는 꼴: `Load.layout.addClass(param1);`
Group에 클래스를 직접 추가할 수 있습니다.
로드 스크립트에서만 사용가능합니다.
클래스명은 cust\_ 로 시작해야하며, 띄어쓰기로 구분하여 한번에 입력 또는 매개변수 파람으로 입력 모두 지원합니다.
파라미터:
- param1 / String / 클래스명은 "cust\_"로 시작해야합니다.
예시:
```javascript
Load.layout.addClass('cust_class1', 'cust_class2', 'cust_class3')
Load.layout.addClass('cust_class1 cust_class2 cust_class3')
```

### Load.layout.controlkey()
부르는 꼴: `Load.layout.controlkey(param1)`
현재 Load된 컴포넌트의 상태를 변경 할 수 있습니다.
로드 스크립트에서만 사용가능합니다.
파라미터:
- param1 / String / 컴포넌트 상태값
예시:
```javascript
Load.layout.controlkey('');      // 초기화
Load.layout.controlkey('hid')    // 숨김


if(Load.sector.id === ’show’) {  //로드되는 섹터의 컬렉션키가 id인 값이 ‘show’인 경우 
	Load.layout.controlkey('') //보여짐
}else{
	Load.layout.controlkey(‘hid’) //숨김
}
```

### Load.layout.style()
부르는 꼴: `Load.layout.style(param1);`
Group의 스타일을 설정 할 수 있습니다. style 사용시 동일한 디자인 속성의 경우 프로퍼티의 설정보다 스크립트의 설정이 우선됩니다.
로드 스크립트에서만 사용가능합니다.
파라미터:
- param1 / String / property:value;  형식으로 사용 가능 / property 는 css 속성이고 value는 css 값 입니다.
예시:
```javascript
Load.layout.style('width:30px; height:100%;');
```

### Load.sector
`Load.sector`를 통해 현재 Load되는 Layout, Group, Control이 연결된 섹터를 리턴합니다.
예시:
```javascript
// 컬렉션키 improvementsstatus의 값으로 if문에 활용하는 예시

let status = Load.sector.improvementsstatus;
 
if (status == '대기') {
  ...
}
else if (status == '진행중') {
  ...
}
else if (status == '완료') {
  ...
// …
```

### Sector 객체의 프로퍼티 및 함수 활용
부르는 꼴: `Sector.property`
Flextudio에서 섹터(Sector)는 컬렉션(Collection)과 카테고리(Category) 라는 데이터 단위 내의 개별 요소로, 객체 형식입니다. 섹터에 접근한 후에는 기능요소에 소개되어 있는 프로퍼티와 함수를 사용할 수 있습니다.
컬렉션(Collection)과 카테고리(Category)에 대한 자세한 설명은 \_c 페이지를 참고바랍니다.
{% content-ref url="/pages/4mTp6naFMwmt5du0zxiI" %}
\_c
{% endcontent-ref %}
기능요소:
- activate() / 해당 sector를 Active로 등록
- delete() / 삭제 이벤트에 따라 sector를 삭제
- isActive / get sector의 active 여부를 반환
- isAdded / get sector의 added 여부를 반환
- isLast / get sector의 last 여부를 반환
- isDeleted / get sector의 삭제 여부를 반환
- isSelected / get sector의 selecte 여부를 반환
- isUpdated / get sector의 수정 여부를 반환
- keys / get sector에 있는 모든 key들을 배열로 반환
- mergeSector() / '_suid'를 제외한 넘겨진 섹터의 key, value들을 현재 sector에 덮어씀
- release() / 추가된 sector를 해제
- remove() / 해당 sector에서 파라미터에 담긴 key를 삭제
- replaceSelect() / '_suid'를 제외한 모든 값을 넘겨진 sector의 값으로 대체
- select() / select 여부를 부여
- set() / sector의  key, value 값을 설정
- unSelect() / select 여부를 해제

### sector.activate()
해당 sector를 Active로 등록합니다. Outer 섹터가 있을 경우 Outer 섹터도 Active로 등록되며, 기존 Acitve는 해제됩니다.

### sector.delete()
sector를 삭제합니다. 추가된 sector는 'release()' , 원래 있던 sector는 삭제 상태만 부여되며 디스플레이 시 제거됩니다.
예시:
```javascript
//_c.카테고리명
// 카테고리에서 첫 번째 sector 삭제. 정상적으로 삭제시 return true
if (_c.category[0].delete()) {
    console.log('Sector successfully deleted.');
}
```

### sector.isActive
sector의 active 여부를 반환합니다.
예시:
```javascript
let isActive = _c.category[0].isActive; //_c.카테고리명

console.log(isActive);  // 출력: true 또는 false
```

### sector.isAdded
sector의 추가 여부를 반환합니다. 런타임상에서 sector가 추가된 경우 true를 반환합니다.
예시:
```javascript
//_c.카테고리명
if (_c.category[0].isAdded) {
    console.log('This sector has been added.');
}
```

### sector.isDeleted
sector의 삭제 여부를 반환합니다. 사용자가 삭제했거나, script 상에서 `delete()`함수를 사용한 경우 true를 반환합니다.
예시:
```javascript
//_c.카테고리명
if (_c.category[0].isDeleted) {
    console.log('This sector has been deleted.');
}
```

### sector.isLast
sector의 마지막 여부를 출력합니다.
예시:
```javascript
let isLast = _c.category[0].isLast; //_c.카테고리명

console.log(isLast);  // 출력: true 또는 false
```

### sector.isSelected
sector의 선택 여부를 반환입니다.
예시:
```javascript
//_c.카테고리명
if (_c.category[0].isSelected) { 
    console.log('This sector is selected.');
}
```

### sector.isUpdated
sector의 수정  여부를 반환합니다. 런타임상에서 사용자의 입력을 통해 내부의 값이 변경된 경우 true를 반환합니다.
예시:
```javascript
//_c.카테고리명
if (_c.category[0].isUpdated) {
    console.log('This sector has been updated.');
}
```

### sector.keys
sector에 있는 모든 key들을 배열로 반환합니다.
예시:
```javascript
let keys = _c.category[0].keys; //_c.카테고리명

console.log(keys);  // 출력: ['key1', 'key2', ...]
```

### sector.mergeSector()
부르는 꼴: `mergeSector(targetSector)`
넘겨진 sector의 key, value들을 현재 sector에 덮어 씁니다. `_suid`는 제외됩니다.
예시:
```javascript
// 덮어쓰고 싶은 sector값 설정 - 카테고리에서 첫 번째 sector 접근
let targetSector = _c.newCategory[0]; //_c.카테고리명
 
/** 
* 카테고리에서 첫 번째 sector가 targetSector값으로 덮어써지며 
* _c.category에 원래 있던 key의 value는 유지된채로 targetSector의 key와 value가 추가
*/
_c.category[0].mergeSector(targetSector);
```

### sector.release()
sector를 해제합니다. block과 mapper에서 삭제하고 상태값도 모두 삭제합니다.
예시:
```javascript
//_c.카테고리명
// 정상적으로 sector가 삭제되면 true를 반환
if (_c.category[0].release()) {
    console.log('Sector successfully released.');
}
```

### sector.remove()
부르는 꼴: `remove(..keys)`
해당 sector에서 파라미터에 담긴 key를 삭제합니다.
예시:
```javascript
//_c.카테고리명
// 카테고리의 첫 번째 sector의 키 ItemSeq, Amt를 삭제 
_c.category[0].remove('ItemSeq', 'Amt');
```

### sector.replaceSector()
부르는 꼴: `replaceSector(targetSector)`
`_suid`를 제외한 모든 값을 넘겨진 sector의 값으로 대체합니다.
예시:
```javascript
// 대체 하고싶은 sector값 설정 - 카테고리에서 두 번째 sector 접근
let targetSector = _c.category[1]; //_c.카테고리명

/**
* 카테고리에서 첫 번째 sector가 targetSector값으로 대체
* 두개의 sector의 key가 다르다면 _c.category[0]의 key의 value들은 Null 
* 대체하려는 targetSector key와 value는 새로 생성
*/
_c.category[0].replaceSector(targetSector);
```

### sector.select()
sector를 선택 상태로 설정합니다.
예시:
```javascript
// 카테고리에서 첫 번째 sector 접근
let firstSector = _c.category[0]; //_c.카테고리명

// sector를 선택 상태로 설정
firstSector.select();
```

### sector.set()
부르는 꼴: `set(key1, value, key2, value..)`
sector의 값을 설정하는 함수입니다. key, value를 sector에 반영하고, 해당 섹터가 바인딩된 레이아웃을 새로 로드합니다. (화면상에 sector의 데이터 변화를 바로 반영합니다.)
예시:
```javascript
//_c.카테고리명
// 카테고리의 첫 번째 sector 값을 설정
_c.category[0].set('ItemUnit', 'package', 'ItemSpec', 'Software', 'Price', '230000', 'Name', 'flextudio');

// actvieSector 값을 설정
_c.activeSector.set('status', “선택완료”)
```

### sector.unSelect()
sector의 선택 상태를 해제합니다.
예시:
```javascript
// 카테고리에서 첫 번째 sector 접근
let firstSector = _c.category[0]; //_c.카테고리명

// sector를 선택 상태로 설정
firstSector.unSelect()
```
