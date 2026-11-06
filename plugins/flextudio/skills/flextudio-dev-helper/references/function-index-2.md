# 공식 스크립트 함수 목록 2/2

이 파일이 답하는 질문: 이런 함수가 있나 / 정확한 이름과 부르는 꼴은 / 어디서 쓸 수 있나 (f 라이브러리 - f.event, f 라이브러리 - f.file, f 라이브러리 - f.frame, f 라이브러리 - f.gps, f 라이브러리 - f.history, f 라이브러리 - f.ip, f 라이브러리 - f.link, f 라이브러리 - f.loadingview, f 라이브러리 - f.mail, f 라이브러리 - f.message, f 라이브러리 - f.messagebox, f 라이브러리 - f.native, f 라이브러리 - f.numformat, f 라이브러리 - f.observer, f 라이브러리 - f.outlook, f 라이브러리 - f.scanner, f 라이브러리 - f.script, f 라이브러리 - f.scroll, f 라이브러리 - f.setting, f 라이브러리 - f.sheet, f 라이브러리 - f.sheetcontrol, f 라이브러리 - f.teamsbot, f 라이브러리 - f.time, f 라이브러리 - f.toast, f 라이브러리 - f.user, 기타)

이 목록은 플렉스튜디오 공식 스크립트 명세(https://docs.flextudio.com/flextudio)의 함수 이름과 부르는 꼴을 그대로 옮긴 것입니다.
두 파일(function-index-1.md, function-index-2.md)과 다른 참조 파일 본문 어디에도 없는 이름은 답에 쓰지 마세요.
목록에 이름만 있고 다른 참조 파일에 동작 설명이 없으면, 쓰는 법은 공식 명세 쪽을 보라고 안내하세요.

목차: 1 f 라이브러리 - f.event / 2 f 라이브러리 - f.file / 3 f 라이브러리 - f.frame / 4 f 라이브러리 - f.gps / 5 f 라이브러리 - f.history / 6 f 라이브러리 - f.ip / 7 f 라이브러리 - f.link / 8 f 라이브러리 - f.loadingview / 9 f 라이브러리 - f.mail / 10 f 라이브러리 - f.message / 11 f 라이브러리 - f.messagebox / 12 f 라이브러리 - f.native / 13 f 라이브러리 - f.numformat / 14 f 라이브러리 - f.observer / 15 f 라이브러리 - f.outlook / 16 f 라이브러리 - f.scanner / 17 f 라이브러리 - f.script / 18 f 라이브러리 - f.scroll / 19 f 라이브러리 - f.setting / 20 f 라이브러리 - f.sheet / 21 f 라이브러리 - f.sheetcontrol / 22 f 라이브러리 - f.teamsbot / 23 f 라이브러리 - f.time / 24 f 라이브러리 - f.toast / 25 f 라이브러리 - f.user / 26 기타

## 1. f 라이브러리 - f.event

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Event(eventName)` | 이벤트 스크립트 전용 |
| `f.Event().break()` | 이벤트 스크립트 전용 |
| `f.Event(eventName).runNext()` | 이벤트 스크립트 전용 |

## 2. f 라이브러리 - f.file

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.File` |  |
| `f.File.download(filekey, target, directory)` |  |

## 3. f 라이브러리 - f.frame

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Frame` | 디버거 미동작 |
| `f.Frame.popUp(secnarioID, stepID)` | 디버거 미동작 |
| `f.Frame.popUp().remove()` | 디버거 미동작 |
| `f.Frame.popUp().setOptions(target, key, value)` | 디버거 미동작 |
| `f.Frame.popUp().setSectors(sectors)` | 디버거 미동작 |
| `f.Frame.popUp().setTargetApp(sectors)` | 디버거 미동작 |
| `f.Frame.popUp().setTargetPack(sectors)` | 디버거 미동작 |
| `f.Frame.popUp().show()` | 디버거 미동작 |
| `f.Frame.scenario(scenarioID, stepID)` | 디버거 미동작 |
| `f.Frame.setTitle(title)` | 디버거 미동작 |
| `f.Frame.tab` | 디버거 미동작 |
| `f.Frame.tab.focus()` | 디버거 미동작 |
| `f.Frame.tab.hide()` | 디버거 미동작 |
| `f.Frame.tab.show()` | 디버거 미동작 |
| `f.Frame.topMenu` | 디버거 미동작 |
| `f.Frame.topMenu.button` | 디버거 미동작 |
| `f.Frame.topMenu.target` | 디버거 미동작 |
| `f.Frame.window` | 디버거 미동작 |
| `f.Frame.window.location(url, isReplace)` | 디버거 미동작 |

## 4. f 라이브러리 - f.gps

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.GPS` |  |

## 5. f 라이브러리 - f.history

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.History` |  |

## 6. f 라이브러리 - f.ip

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.IP` |  |

## 7. f 라이브러리 - f.link

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Link` |  |
| `f.Link.createAppLink(value, isPc)` |  |
| `f.Link.getLinkParam()` |  |
| `f.Link.init()` |  |

## 8. f 라이브러리 - f.loadingview

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.LoadingView` |  |
| `f.LoadingView.hide()` |  |
| `f.LoadingView.show()` |  |

## 9. f 라이브러리 - f.mail

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Mail()` |  |
| `f.Mail().addReceiver(mail)` |  |
| `f.Mail().send()` |  |
| `f.Mail().setBody(content)` |  |
| `f.Mail().setIsBodyHtml(isHtml)` |  |
| `f.Mail().setIsGroup(isGroup)` |  |
| `f.Mail().setTitle(title)` |  |

## 10. f 라이브러리 - f.message

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Message(txtTitle)` |  |
| `f.Message().addAction(title, scenarioID, stepID, sectors)` |  |
| `f.Message().addReceiver(fBaseUserNo, isAlarmOff)` |  |
| `f.Message().send()` |  |
| `f.Message().setActionJson(actionJson)` |  |
| `f.Message().setBody(content)` |  |
| `f.Message().setTitle(title)` |  |
| `f.Message.clearBadge(timestamp)` |  |

## 11. f 라이브러리 - f.messagebox

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.MessageBox(type)` |  |
| `f.MessageBox().addBtn(title, eventName)` |  |
| `f.MessageBox().setDescription(description)` |  |
| `f.MessageBox().setTitle(title)` |  |
| `f.MessageBox().show()` |  |

## 12. f 라이브러리 - f.native

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Native` |  |
| `f.Native.close()` |  |
| `f.Native.getBarcode(isSync, eventName, isMulti)` |  |
| `f.Native.getGPS(isSync, eventName, isNavigator)` |  |
| `f.Native.getIP(isAsync, eventName)` |  |
| `f.Native.isOn` |  |
| `f.Native.openCall(number)` |  |
| `f.Native.openSMS(number)` |  |
| `f.Native.scanNFC(text)` |  |
| `f.Native.share(text)` |  |
| `f.Native.writeClipboard(text)` |  |

## 13. f 라이브러리 - f.numformat

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.numFormat(value)` |  |
| `f.numFormat(value).ceil(digits)` |  |
| `f.numFormat(value).floor(digits)` |  |
| `f.numFormat(value).format(digits, toFix, mode)` |  |
| `f.numFormat(value).round(digits)` |  |

## 14. f 라이브러리 - f.observer

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Observer` |  |
| `f.Observer.init(eventName, target)` |  |
| `f.Observer.stop()` |  |
| `f.Observer.trigger(message)` |  |

## 15. f 라이브러리 - f.outlook

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Outlook()` |  |
| `f.Outlook().acceptEvent(id, comment, isSendResponse, callbackfunction)` |  |
| `f.Outlook().cancelEvent(id, comment, callbackFunction)` |  |
| `f.Outlook().createEvent(subject, startDateTime, endDateTime, location, attendees, callbackFunction, timezone)` |  |
| `f.Outlook().declineEvent(id, comment, callbackfunction)` |  |
| `f.Outlook(value).getEvents(startDateTime, endDateTime, callbackFunction)` |  |

## 16. f 라이브러리 - f.scanner

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Scanner` |  |
| `f.Scanner.getLastError()` |  |
| `f.Scanner.getLastScannedData()` |  |
| `f.Scanner.getLastScannedTimestamp()` |  |
| `f.Scanner.getScanHistory()` |  |
| `f.Scanner` |  |
| `f.Scanner.init(options)` |  |
| `f.Scanner.startScan()` |  |
| `f.Scanner.stopScan()` |  |

## 17. f 라이브러리 - f.script

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Script` |  |
| `f.Script.load(src,afterEvent, isSync)` |  |

## 18. f 라이브러리 - f.scroll

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Scroll` |  |
| `f.Scroll.offset` |  |
| `f.Scroll.toBottom()` |  |
| `f.Scroll.toSector(sector, isAnimate)` |  |
| `f.Scroll.toTop()` |  |

## 19. f 라이브러리 - f.setting

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Setting` |  |
| `f.Setting.User` |  |
| `f.Setting.User.get(key)` |  |
| `f.Setting.User.set(isAsync,key,value)` |  |

## 20. f 라이브러리 - f.sheet

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Sheet` |  |
| `f.Sheet.download(category, fileName, keys, headers, descriptions)` |  |
| `f.Sheet.formatDownload(fileName, keys, headers, descriptions)` |  |
| `f.Sheet.insert(categoryName, eventName)` |  |

## 21. f 라이브러리 - f.sheetcontrol

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.SheetControl(fid, sector)` | 이벤트 스크립트 전용, 대상: Sheet |
| `f.SheetControl(fid, sector).addEmptyRow(num)` | 이벤트 스크립트 전용, 대상: Sheet |
| `f.SheetControl(fid, sector).deleteRow(sector)` | 이벤트 스크립트 전용, 대상: Sheet |
| `f.SheetControl(fid, sector).Focus` |  |
| `f.SheetControl(fid, sector).Focus.toCellAtVisual(visualRowIdx, visualColIdx)` |  |
| `f.SheetControl(fid, sector).Focus.toCellByColKey(visualRowIdx, ckey)` |  |
| `f.SheetControl(fid, sector).Focus.toRowAtVisual(visualRowIdx)` |  |
| `f.SheetControl(fid, sector).Focus.toSectorCell(sector, ckey)` |  |
| `f.SheetControl(fid, sector).Focus.toSectorRow(sector)` |  |
| `f.SheetControl(fid, sector).reloadData()` | 이벤트 스크립트 전용, 대상: Sheet |
| `f.SheetControl(fid, sector).reloadSheet()` | 이벤트 스크립트 전용, 대상: Sheet |
| `f.SheetControl(fid, sector).Scroll` |  |
| `f.SheetControl(fid, sector).Scroll.toBottom()` |  |
| `f.SheetControl(fid, sector).Scroll.toCellAtVisual(visualRowIdx, visualColIdx)` |  |
| `f.SheetControl(fid, sector).Scroll.toPercent(percent)` |  |
| `f.SheetControl(fid, sector).Scroll.toRowAtVisual(visualRowIdx)` |  |
| `f.SheetControl(fid, sector).Scroll.toTop()` |  |
| `f.SheetControl(fid, sector).sort(keyOrFn, order)` |  |
| `f.SheetControl(fid, sector).syncData()` | 이벤트 스크립트 전용, 대상: Sheet |
| `f.SheetControl(fid, sector).syncSector(sector)` | 이벤트 스크립트 전용, 대상: Sheet |

## 22. f 라이브러리 - f.teamsbot

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.TeamsBot()` |  |
| `f.TeamsBot().addReceiver(fBaseUserNo)` |  |
| `f.TeamsBot().send(callBackFunction)` |  |
| `f.TeamsBot().setBody(content)` |  |
| `f.TeamsBot().setImageURL(URL)` |  |
| `f.TeamsBot().setTitle(title)` |  |
| `f.TeamsBot().setURL(URL)` |  |

## 23. f 라이브러리 - f.time

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Time` |  |
| `f.Time.error` |  |
| `f.Time.getServerTime(isAsync, eventName)` | 이벤트 스크립트 전용 |
| `f.Time.serverTime` |  |

## 24. f 라이브러리 - f.toast

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.Toast()` |  |
| `f.Toast().color(color)` |  |
| `f.Toast().delay(second)` |  |
| `f.Toast().description(descMessage)` |  |
| `f.Toast().icon(showIcon)` |  |
| `f.Toast().position(pos)` |  |
| `f.Toast().show()` |  |
| `f.Toast.title(titleMessage)` |  |

## 25. f 라이브러리 - f.user

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `f.User` |  |
| `f.User.isLogin()` |  |
| `f.User.logout()` |  |
| `f.User.snsLogin(isEventBreak)` |  |

## 26. 기타

| 부르는 꼴 | 쓰는 곳·대상 |
|---|---|
| `기능함수` |  |
