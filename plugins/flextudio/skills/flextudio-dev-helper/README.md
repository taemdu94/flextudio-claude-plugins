# 플렉스튜디오 개발 도우미 스킬 설치 안내

이 스킬을 AI 도구에 넣으면 플렉스튜디오 Studio 개발(시나리오, 이벤트, 스크립트, 서비스, SP, FlexSQL, 배포) 질문에 검증된 규칙으로 답을 받을 수 있습니다.
쓰는 AI 도구에 맞는 설치 방법을 고르세요.

| 쓰는 도구 | 받을 파일 | 설치 방법 |
|---|---|---|
| Claude Code | `claude-code` 폴더 | 1번 |
| Claude.ai (웹·데스크톱) | `flextudio-dev-helper-claude-ai.zip` | 2번 |
| Codex, Cursor | `agents-skills` 폴더 | 3번 |
| ChatGPT (GPT, 프로젝트) | `chatgpt-pack` 폴더 | 4번 |
| 그 밖의 AI | `flextudio-dev-helper-single.md` | 5번 |

## 1. Claude Code

1. 작업 폴더에 `.claude/skills/` 폴더를 만드세요.
2. `flextudio-dev-helper` 폴더를 그 안에 복사하세요.
3. Claude Code 를 다시 시작하세요.

확인: 질문 창에 `/flextudio-dev-helper` 를 입력했을 때 목록에 보이면 설치된 것입니다.

## 2. Claude.ai

1. Claude.ai 의 [설정] > [기능]에서 코드 실행 기능이 켜져 있는지 보세요. 스킬은 이 기능이 켜진 요금제에서만 올릴 수 있습니다.
2. 스킬 메뉴에서 zip 파일을 올리세요. 압축을 풀지 말고 그대로 올리세요.
3. 스킬은 사람마다 따로 올립니다. 팀원도 각자 올려야 합니다.

확인: 새 대화에서 "플렉스튜디오에서 조회 화면을 만들고 싶어요"라고 물었을 때 스킬을 쓴다는 표시가 보이면 됩니다.

## 3. Codex, Cursor

1. 작업 폴더에 `.agents/skills/` 폴더를 만드세요.
2. `flextudio-dev-helper` 폴더를 그 안에 복사하세요.
3. 늘 이 스킬을 쓰게 하려면 `AGENTS.md.snippet.md` 내용을 작업 폴더의 `AGENTS.md` 에 붙여 넣으세요.
4. 도구를 다시 시작하세요.

## 4. ChatGPT

ChatGPT 는 스킬 폴더를 그대로 읽지 못합니다.
대신 지시문과 지식 파일로 넣습니다.

1. GPT 만들기 또는 프로젝트를 여세요.
2. `instructions.txt` 내용을 지시문(Instructions) 칸에 붙여 넣으세요.
3. 번호가 붙은 md 파일 5개를 지식(Knowledge) 파일로 올리세요.

## 5. 그 밖의 AI

`flextudio-dev-helper-single.md` 파일을 대화에 첨부하고 "이 파일의 SKILL 지시를 따라 답해 주세요"라고 먼저 적으세요.

## 자동으로 안 불릴 때

질문에 "플렉스튜디오" 또는 "Flextudio" 를 넣으세요.
그래도 안 되면 스킬 이름으로 직접 부르세요(Claude Code `/flextudio-dev-helper`, Codex `$flextudio-dev-helper`).

## 새 버전이 나오면

Claude Code, Codex, Cursor 는 폴더를 새 판으로 바꾸면 됩니다.
Claude.ai 와 ChatGPT 는 자동으로 바뀌지 않으니 새 파일을 다시 올리세요.
바뀐 내용은 `CHANGELOG.md` 에 있습니다.
