# Flextudio plugin for Claude

플렉스튜디오(Flextudio) 로우코드로 업무 앱을 만드는 개발자를 돕는 Claude 플러그인입니다.
Studio 시나리오 화면, 이벤트·스크립트, 서비스(K-System SP·FlexAPI, FlexSQL), 배포·설치·출력, 신규 기능(플립프론트·플립백)에 대한 질문과 오류를, 플렉스튜디오 소스와 검증된 QnA 답변에 근거해 안내합니다.
모르는 것은 지어내지 않고 "확인 필요"로 답합니다.

This plugin adds the `flextudio-dev-helper` skill. It helps developers who build business apps with Flextudio, a low-code platform: Studio scenarios, events and scripts, K-System ERP integration through FlexAPI stored procedures, FlexSQL, deployment, device printing, and the new FlipFront and FlipBack features. Answers are grounded in verified platform behavior; unknown points are marked as needing confirmation.

## 설치 (Claude Code)

```
/plugin marketplace add <owner>/flextudio-claude-plugins
/plugin install flextudio@flextudio
```

## 포함된 것

| 구성 | 설명 |
|---|---|
| `skills/flextudio-dev-helper` | 개발 도우미 스킬(참조 문서 포함). 화면 만들기, SP 연결, 오류 해결을 물으면 Claude 가 자동으로 사용 |

## 문의

https://flextudio.com
