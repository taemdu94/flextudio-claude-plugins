# 공식 스크립트 함수 목록 1/2

이 파일이 답하는 질문: 이런 함수가 있나 / 정확한 이름과 부르는 꼴은 / 어디서 쓸 수 있나 (앱·고객·사용자·언어 정보 (_base), 컬렉션 접근 (_c), 전역 변수 (_v), 현재 시점 정보 (Current), 섹터 객체 (sector), 로드 스크립트 전용 (Load), f 라이브러리 - f.auth, f 라이브러리 - f.barcode, f 라이브러리 - f.browser, f 라이브러리 - f.checkrequired, f 라이브러리 - f.collection, f 라이브러리 - f.component, f 라이브러리 - f.content, f 라이브러리 - f.date)

이 목록은 플렉스튜디오 공식 스크립트 명세(https://docs.flextudio.com/flextudio)의 함수 이름과 부르는 꼴을 그대로 옮긴 것입니다.
두 파일(function-index-1.md, function-index-2.md)과 다른 참조 파일 본문 어디에도 없는 이름은 답에 쓰지 마세요.
목록에 이름만 있고 다른 참조 파일에 동작 설명이 없으면, 쓰는 법은 공식 명세 쪽을 보라고 안내하세요.

목차: 1 앱·고객·사용자·언어 정보 (_base) / 2 컬렉션 접근 (_c) / 3 전역 변수 (_v) / 4 현재 시점 정보 (Current) / 5 섹터 객체 (sector) / 6 로드 스크립트 전용 (Load) / 7 f 라이브러리 - f.auth / 8 f 라이브러리 - f.barcode / 9 f 라이브러리 - f.browser / 10 f 라이브러리 - f.checkrequired / 11 f 라이브러리 - f.collection / 12 f 라이브러리 - f.component / 13 f 라이브러리 - f.content / 14 f 라이브러리 - f.date

## 1. 앱·고객·사용자·언어 정보 (_base)

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `_base` |  |
| `_base.App` |  |
| `_base.Company` |  |
| `_base.LanguageSeq` |  |
| `_base.linkParam` | 지원 종료 예정 |
| `_base.User` |  |

## 2. 컬렉션 접근 (_c)

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `_c` |  |
| `_c.active` |  |
| `_c.activeSector` |  |
| `_c.added` |  |
| `_c.addSector(Object)` |  |
| `_c.deleted` |  |
| `_c.keys` |  |
| `_c.last` |  |
| `_c.lastSectors` |  |
| `_c.remove(...suids)` |  |
| `_c.selected` |  |
| `_c.status` |  |
| `_c.suids` |  |
| `_c.updated` |  |

## 3. 전역 변수 (_v)

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `_v` |  |

## 4. 현재 시점 정보 (Current)

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `Current` |  |
| `Current._parentSector` |  |
| `Current.scenario` |  |
| `Current.scenario.id` |  |
| `Current.scenario.title` |  |
| `Current.step` |  |
| `Current.step.id` |  |
| `Current.step.moveToFirst()` |  |
| `Current.step.moveToNext(stepId, ignoreRequired, stepAnimation)` |  |
| `Current.step.moveToParent()` |  |
| `Current.step.moveToPrev(stepId, isRestored, checkRequired)` |  |
| `Current.step.prev` |  |
| `Current.step.prev.id` |  |
| `Current.step.reload(isPositionReset)` |  |
| `Current.step.reloadWithAnimation()` |  |
| `Current.step.restart()` |  |

## 5. 섹터 객체 (sector)

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `Sector.property` |  |
| `sector.activate()` |  |
| `sector.delete()` |  |
| `sector.isActive` |  |
| `sector.isAdded` |  |
| `sector.isDeleted` |  |
| `sector.isLast` |  |
| `sector.isSelected` |  |
| `sector.isUpdated` |  |
| `sector.keys` |  |
| `mergeSector(targetSector)` |  |
| `sector.release()` |  |
| `remove(..keys)` |  |
| `replaceSector(targetSector)` |  |
| `sector.select()` |  |
| `set(key1, value, key2, value..)` |  |
| `sector.unSelect()` |  |

## 6. 로드 스크립트 전용 (Load)

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `Load` |  |
| `Current.control` |  |
| `Load.control.activeIndex(index)` | 로드 스크립트 전용, 대상: Tab |
| `Load.control.activeTabClick(isClick)` | 로드 스크립트 전용, 대상: Tab |
| `Load.control.activeValue(value)` | 로드 스크립트 전용, 대상: Tab |
| `Load.control.addClass(param1);` | 로드 스크립트 전용 |
| `Load.control.arrow(useIcon)` | 로드 스크립트 전용, 대상: Button |
| `Load.control.authkey` | 로드 스크립트 전용, 대상: InputText , InputNumber, InputMask, TextArea, InputDate, Label |
| `Load.control.authkey.add(authkey)` |  |
| `Load.control.authkey.remove(authkey)` |  |
| `Load.control.badge(value)` | 로드 스크립트 전용, 대상: Button |
| `Load.control.bg` | 로드 스크립트 전용, 대상: Button, InputText , InputNumber, InputMask,TextArea, InputDate, Label |
| `Load.control.bg.color(color)` | 로드 스크립트 전용, 대상: Button, InputText, InputNumber, InputMask, TextArea, InputDate, Label, ComboBox, InputCodehelp |
| `Load.control.bg.shadow(useShadow)` | 로드 스크립트 전용, 대상: Button, InputText, InputNumber, InputMask, TextArea, InputDate, Label, ComboBox, InputCodehelp |
| `Load.control.bg.useImage(useImage)` | 로드 스크립트 전용, 대상: Button, InputText, InputNumber, InputMask, TextArea, InputDate, Label, ComboBox, InputCodehelp |
| `Load.control.caption` | 로드 스크립트 전용, 대상: InputText , InputNumber, InputMask, TextArea, InputDate |
| `Load.control.caption.align(align)` | 로드 스크립트 전용, 대상: InputText, InputNumber, InputMask, TextArea, InputDate, ComboBox, InputCodehelp |
| `Current.control.caption.bold(useBold)` | 로드 스크립트 전용, 대상: InputText, InputNumber, InputMask, TextArea, InputDate, ComboBox, InputCodehelp |
| `Load.control.caption.color(color)` | 로드 스크립트 전용, 대상: InputText, InputNumber, InputMask, TextArea, InputDate, ComboBox, InputCodehelp |
| `Load.control.caption.position(pos)` | 로드 스크립트 전용, 대상: InputText, InputNumber, InputMask, TextArea, InputDate, ComboBox, InputCodehelp |
| `Load.control.caption.size(size)` | 로드 스크립트 전용, 대상: InputText, InputNumber, InputMask, TextArea, InputDate, ComboBox, InputCodehelp |
| `Load.control.caption.text(text)` | 로드 스크립트 전용, 대상: InputText, InputNumber, InputMask, TextArea, InputDate, ComboBox, InputCodehelp |
| `Load.control.controlkey(status)` | 로드 스크립트 전용, 대상: Button, InputText , InputNumber, InputMask,TextArea, InputDate |
| `Load.control.dateformat(format)` | 로드 스크립트 전용, 대상: InputDate |
| `Load.control.dlg` | 로드 스크립트 전용, 대상: InputCombo,InputSearch |
| `Load.control.dlg.maxHeight(maxHeight)` | 로드 스크립트 전용, 대상: InputCombo,InputSearch |
| `Load.control.dlg.width(width)` | 로드 스크립트 전용, 대상: InputCombo,InputSearch |
| `Load.control.expandAll(Param1)` | 로드 스크립트 전용, 대상: Tree |
| `Load.control.font` | 로드 스크립트 전용, 대상: Button, InputText , InputNumber, InputMask,TextArea, InputDate, Label |
| ` Load.control.font.align(align)` | 로드 스크립트 전용, 대상: Button, InputText, InputNumber, InputMask, TextArea, InputDate, Label, ComboBox, InputCodehelp |
| ` Load.control.font.bold(usebold)` | 로드 스크립트 전용, 대상: Button, InputText, InputNumber, InputMask, TextArea, InputDate, Label, ComboBox, InputCodehelp |
| ` Load.control.font.color(color)` | 로드 스크립트 전용, 대상: Button, InputText, InputNumber, InputMask, TextArea, InputDate, Label, ComboBox, InputCodehelp |
| `Current.control.font.size(size)` | 로드 스크립트 전용, 대상: Button, InputText, InputNumber, InputMask, TextArea, InputDate, Label, ComboBox, InputCodehelp |
| `Current.control.font.underline(useUnderline)` | 로드 스크립트 전용, 대상: Button, InputText, InputNumber, InputMask, TextArea, InputDate, Label, ComboBox, InputCodehelp |
| `Load.control.image` | 로드 스크립트 전용, 대상: Button, Label |
| `Load.control.image.color(color)` | 로드 스크립트 전용, 대상: Button |
| `Load.control.image.name(imageName)` | 로드 스크립트 전용, 대상: Button |
| `Load.control.image.size(size)` | 로드 스크립트 전용, 대상: Button |
| `Load.control.placeholder(hint)` | 로드 스크립트 전용, 대상: InputText , InputNumber, InputMask, TextArea |
| `Load.control.style(param1);` | 로드 스크립트 전용, 대상: Button, InputText , InputNumber, InputMask,TextArea, Label |
| `Load.control.text(name)` | 로드 스크립트 전용, 대상: Button, Label |
| `Load.layout` |  |
| `Load.layout.addClass(param1);` | 로드 스크립트 전용 |
| `Load.layout.controlkey(param1)` | 로드 스크립트 전용 |
| `Load.layout.style(param1);` | 로드 스크립트 전용 |
| `Load.sector` |  |

## 7. f 라이브러리 - f.auth

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Auth` |  |
| `f.Auth.add(authKey)` |  |
| `f.Auth.check(authKey)` |  |
| `f.Auth.list()` |  |
| `f.Auth.remove(authKey)` |  |

## 8. f 라이브러리 - f.barcode

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Barcode` |  |
| `f.Barcode.error` |  |
| `f.Barcode.value` |  |

## 9. f 라이브러리 - f.browser

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Browser` | 이벤트 스크립트 전용 |
| `f.Browser.open(url)` | 이벤트 스크립트 전용 |

## 10. f 라이브러리 - f.checkrequired

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.checkRequired()` |  |

## 11. f 라이브러리 - f.collection

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Collection` |  |
| `f.Collection.addSector(obj, categoryName)` |  |
| `f.Collection.createCategory(categoryName)` |  |
| `f.Collection.filter(collectionKey, Operator, value)` |  |
| `f.Collection.moveCategory(targetCategory, status, moveCategory)` |  |
| `f.Collection.removeCategory(categoryName)` |  |
| `f.Collection.removeSector(status, categoryName)` |  |
| `f.Collection.updateSector(status, collectionKey, value, categoryName)` |  |

## 12. f 라이브러리 - f.component

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Component(fid, sectorObject)` | 이벤트 스크립트 전용 |
| `f.Component(fid, sectorObject).element` | 이벤트 스크립트 전용 |
| `f.Component(fid, sectorObject).focus()` | 이벤트 스크립트 전용, 대상: inputText, inputNumber, inputMask,inputMultiBox |
| `f.Component(fid, sectorObject).getInputValue()` | 이벤트 스크립트 전용, 대상: InputText, InputNumber, InputMask |
| `f.Component(fid).getSectors()` | 이벤트 스크립트 전용 |
| `f.Component(fid, sectorObject).getText()` | 이벤트 스크립트 전용, 대상: text |
| `f.Component(fid, sectorObject).hide(animationDuration)` |  |
| `f.Component(fid, sectorObject).setInputValue(value)` | 이벤트 스크립트 전용, 대상: InputText, InputNumber, InputMask |
| `f.Component(fid, sectorObject).setText(value)` | 이벤트 스크립트 전용, 대상: text |
| `f.Component(fid, sectorObject).show(animationDuration)` |  |

## 13. f 라이브러리 - f.content

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Content(fid, sectorSUID)` | 이벤트 스크립트 전용, 대상: Group, Layout |
| `f.Content(fid, sectorSUID).addRow(categoryName, isFocus)` | 이벤트 스크립트 전용, 대상: Group, Layout |
| `f.Content(fid).delRow(isReleaseSector)` | 이벤트 스크립트 전용, 대상: Group, Layout |
| `f.Content(fid, sectorSUID).hide()` | 이벤트 스크립트 전용, 대상: Group, Layout |
| `f.Content(fid, sectorSUID).reload()` | 이벤트 스크립트 전용, 대상: Group, Layout |
| `f.Content(fid, sectorSUID).reloadWithAnimation()` | 이벤트 스크립트 전용, 대상: Group, Layout |
| `f.Content(fid, sectorSUID).Scroll` |  |
| `f.Content(fid, sectorSUID).Scroll.offset` |  |
| `f.Content(fid, sectorSUID).Scroll.toBottom()` |  |
| `f.Content(fid, sectorSUID).Scroll.toSector(sector, isAnimate)` |  |
| `f.Content(fid, sectorSUID).Scroll.toTop()` |  |
| `f.Content(fid, sectorSUID).show()` | 이벤트 스크립트 전용, 대상: Group, Layout |

## 14. f 라이브러리 - f.date

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Date(DateString, FormatString)` |  |
| `f.Date(DateString, FormatString).calcTimezoneOffset(offset)` |  |
| `f.Date(DateString, FormatString).date` |  |
| `f.Date(DateString, FormatString).format(formatToken)` |  |
| `f.Date(DateString, FormatString).getCalcDate(formatType, value)` |  |
| `f.Date(DateString, FormatString).getDate()` |  |
| `f.Date(DateString, FormatString).getDatetime()` |  |
| `f.Date(DateString, FormatString).getDay()` |  |
| `f.Date(DateString, FormatString).getFirstDateOfMonth()` |  |
| `f.Date(DateString, FormatString).getHours()` |  |
| `f.Date(DateString, FormatString).getLastDateOfMonth()` |  |
| `f.Date(DateString, FormatString).getMinutes()` |  |
| `f.Date(DateString, FormatString).getMonth()` |  |
| `f.Date(DateString, FormatString).getRangeOfDate(fromDate, toDate)` |  |
| `f.Date(DateString, FormatString).getSecond()` |  |
| `f.Date(DateString, FormatString).getTime()` |  |
| `f.Date(DateString, FormatString).getTimezoneOffset()` |  |
| `f.Date(DateString, FormatString).getUTCTime()` |  |
| `f.Date(DateString, FormatString).getWeekDay()` |  |
| `f.Date(DateString, FormatString).getYear()` |  |
| `f.Date(DateString, FormatString).setDate(date)` |  |
| `f.Date(DateString, FormatString).setDatetime(datetime)` |  |
| `f.Date(DateString, FormatString).setDay(day)` |  |
| `f.Date(DateString, FormatString).setHours(hours)` |  |
| `f.Date(DateString, FormatString).setMinutes(min)` |  |
| `f.Date(DateString, FormatString).setMonth(month)` |  |
| `f.Date(DateString, FormatString).setSecond(sec)` |  |
| `f.Date(DateString, FormatString).setTime(time)` |  |
| `f.Date(DateString, FormatString).setUTCTime(UTCTime)` |  |
| `f.Date(DateString, FormatString).setYear(year)` |  |
