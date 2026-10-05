# PR 가이드 — 과제 하나를 올리고 합치기까지

이 문서는 **과제 하나를 끝내고 PR(Pull Request)을 올려서, 리뷰를 받고, main에 합쳐지기까지**의 과정을 순서대로 정리한 거예요.
처음에는 이 문서를 옆에 띄워 두고 그대로 따라 해 보세요. 몇 번 하다 보면 자연스럽게 손에 익어요.

---

## PR이 뭔가요?

> "제가 이 브랜치에서 이렇게 고쳤는데, main에 합쳐도 될지 봐 주세요" 하고 요청하는 거예요.

- 나는 **내 브랜치**에서만 작업해요. main은 직접 건드리지 않아요.
- PR을 올리면 멘토가 코드를 보고 코멘트를 달아요.
- 괜찮다고 승인되면 **멘토가** main에 합쳐요(머지).

```
main ──●────────────────────●──→
        \                  ↑ ⑥ 멘토가 머지
         task/01 ─●─●─●─●──┘
           ①  ②③   ④⑤
```

---

## 처음 한 번만: 준비

### 1. 저장소 받기

```bash
cd ~/Desktop
git clone https://github.com/mentoring-junior/mentoring-tutorial.git
cd mentoring-tutorial
flutter pub get
```

### 2. 내 이름과 이메일 설정

커밋에 누가 작업했는지 남기 위한 설정이에요. **GitHub 계정의 이메일**과 같게 맞춰 주세요.

```bash
git config --global user.name "내 이름"
git config --global user.email "내GitHub이메일@example.com"
```

### 3. GitHub 로그인 (push할 때 필요)

가장 쉬운 방법은 GitHub CLI를 쓰는 거예요.

```bash
brew install gh
gh auth login      # GitHub.com → HTTPS → 브라우저로 로그인 선택
```

> 💡 push할 때 비밀번호를 물어보면 GitHub **로그인 비밀번호는 안 돼요.** 위의 `gh auth login`을 먼저 해 주세요.

---

## ① 작업 시작: 최신 main에서 브랜치 만들기

```bash
git switch main
git pull                            # 다른 과제가 합쳐진 최신 main 받기
git switch -c task/01-show-list     # 이번 과제용 브랜치 만들고 이동
```

- **`git pull`을 꼭 먼저 해요.** 과제는 앞 단계 위에 쌓이기 때문에, 옛날 main에서 출발하면 이전 과제 코드가 빠져 있어요.
- 브랜치 이름 규칙: `task/번호-짧은영어설명`

| 과제 | 브랜치 이름 예시 |
|---|---|
| 00 | `task/00-first-pr` |
| 01 | `task/01-show-list` |
| 02 | `task/02-freezed-model` |
| 03 | `task/03-viewmodel` |
| 04 | `task/04-detail-favorite` |
| 05 | `task/05-loading-error` |
| 06 | `task/06-test` |

지금 어느 브랜치에 있는지 헷갈리면:

```bash
git branch --show-current
```

---

## ② 커밋하기

작업하다가 **의미 있는 단위로** 저장(커밋)해요. 한 과제에 커밋이 여러 개여도 괜찮아요.

```bash
git status                  # 무엇이 바뀌었는지 보기
git diff                    # 바뀐 내용을 자세히 보기
git add .                   # 바뀐 파일 전부 담기
git commit -m "과제01: JSON 파일 읽기 추가"
```

**커밋 메시지 규칙**: `과제번호: 무엇을 했는지`

```
과제01: Sound 모델과 fromJson 추가
과제01: 목록 화면에 로딩 표시
과제01: 프리미엄 음원에 자물쇠 아이콘
```

> 💡 커밋 전에 `git status`로 **엉뚱한 파일이 들어가지 않았는지** 꼭 확인해요.
> (`.DS_Store`, `build/` 같은 파일은 `.gitignore`에 등록돼 있어서 보통 안 들어가요)

---

## ③ push 하기 (내 브랜치를 GitHub에 올리기)

```bash
git push -u origin task/01-show-list    # 이 브랜치에서 처음 push할 때만
git push                                # 그다음부터는 이것만
```

---

## ④ PR 만들기

### PR 올리기 전 체크리스트

```bash
flutter analyze          # No issues found! 가 나와야 해요
dart format lib          # 코드 모양 정리
dart run build_runner build -d   # (과제 02부터) 모델을 고쳤다면 다시 생성
flutter run              # 마지막으로 직접 실행해서 확인
```

수정한 게 있으면 다시 커밋하고 push해요.

### GitHub에서 PR 만들기

1. 저장소 페이지(https://github.com/mentoring-junior/mentoring-tutorial)에 들어가요.
2. 방금 push했다면 위쪽에 노란 띠로 **"task/01-show-list had recent pushes"** 가 보여요 → **Compare & pull request** 클릭
   - 안 보이면: **Pull requests** 탭 → **New pull request** → `compare:`에서 내 브랜치 선택
3. 위쪽의 방향을 확인해요: **`base: main` ← `compare: task/01-show-list`**
4. **제목**: `과제 01 — JSON 읽어서 목록 띄우기`
5. **본문**: PR 양식이 자동으로 채워져 있어요. 항목을 하나씩 채워요.
   - 스크린샷은 이미지 파일을 본문에 **끌어다 놓으면** 올라가요.
   - 완료 기준 체크박스는 `- [ ]` → `- [x]` 로 바꾸면 체크돼요.
   - "생각해볼 질문"은 모르겠으면 **"모르겠다"** 라고 써도 돼요. 그것도 좋은 답이에요.
6. 오른쪽 **Reviewers** ⚙️ 클릭 → 멘토 선택
7. **Create pull request** 클릭

🎉 끝! 이제 리뷰를 기다려요.

> 리뷰를 기다리는 동안 **다음 과제는 아직 시작하지 않아요.** 대신 다음 과제 문서를 미리 읽고 키워드를 찾아봐요.

---

## ⑤ 리뷰 받고 반영하기

### 리뷰 확인하기

- PR 페이지의 **Conversation** 탭: 전체 코멘트
- **Files changed** 탭: 코드 줄마다 달린 코멘트

리뷰 결과는 보통 둘 중 하나예요.

| 표시 | 뜻 |
|---|---|
| 🔴 **Changes requested** | 고칠 부분이 있어요 → 아래처럼 반영해요 |
| 🟢 **Approved** | 통과! 멘토가 머지할 거예요 |

> 💡 코멘트가 많아도 당황하지 마세요. **혼나는 게 아니라 같이 코드를 다듬는 과정**이에요.
> 질문 형태의 코멘트("여기서 ~하면 어떻게 될까요?")는 답이 정해져 있는 게 아니라 같이 생각해 보자는 뜻이에요.

### 반영하기

**같은 브랜치에서** 고치고 push하면 돼요. **PR을 새로 만들 필요가 없어요.** 기존 PR에 자동으로 추가돼요.

```bash
git branch --show-current     # task/01-show-list 인지 확인
# ... 코드 수정 ...
git add .
git commit -m "과제01: 리뷰 반영 - initState에서 로딩하도록 변경"
git push
```

### 코멘트에 답 달기

각 코멘트에 짧게라도 답을 달아 주세요.

- 반영했을 때: `반영했어요! (커밋 abc1234)`
- 이해가 안 될 때: `혹시 ~라는 뜻일까요? 제가 이해한 건 …인데 맞나요?`
- 다르게 생각할 때: `저는 …해서 이렇게 했는데, 혹시 이 방법은 어떨까요?` ← **이런 답도 정말 좋아요**

다 반영했으면 오른쪽 **Reviewers**의 멘토 이름 옆 🔄 버튼(Re-request review)을 눌러 다시 봐 달라고 알려요.

> `Resolve conversation` 버튼은 **멘토가** 누를게요. 확인이 끝났다는 표시예요.

---

## ⑥ 머지 후 정리하고 다음 과제로

멘토가 머지하면 PR에 보라색 **Merged** 표시가 떠요.

```bash
git switch main
git pull                              # 내 과제가 합쳐진 main 받기
git branch -D task/01-show-list       # 다 쓴 로컬 브랜치 지우기
```

> 💡 왜 `-d`가 아니라 `-D`인가요?
> 멘토가 **Squash and merge**(여러 커밋을 하나로 묶어서 합치기)로 머지해서, git은 내 브랜치가 합쳐졌는지 알아보지 못해요.
> 그래서 `-d`는 "아직 안 합쳐졌는데요?" 하고 거절해요. **PR이 Merged인 걸 확인했다면** `-D`로 지워도 괜찮아요.

그다음은 다시 **① 작업 시작**부터 해요. 🔁

---

## 문제가 생겼을 때

> 아래 방법이 잘 안 되거나 불안하면 **아무것도 더 하지 말고 멘토에게 물어봐 주세요.**
> git은 웬만한 실수는 되돌릴 수 있어요. 오히려 급하게 이것저것 해보다가 꼬이는 경우가 더 많아요.

### main에서 작업해 버렸어요 (아직 커밋 전)

괜찮아요. 고친 내용을 그대로 들고 새 브랜치로 옮길 수 있어요.

```bash
git switch -c task/01-show-list   # 고친 내용이 그대로 따라와요
```

### main에서 커밋까지 해 버렸어요 (아직 push 전)

**멘토에게 먼저 알려 주세요.** 같이 해 봐요. (참고용 순서)

```bash
git switch -c task/01-show-list   # 지금 커밋을 새 브랜치에 보관
git switch main
git reset --hard origin/main      # main을 GitHub 상태로 되돌리기 ⚠️ 첫 줄을 꼭 먼저!
git switch task/01-show-list
```

### push 했더니 `rejected` 라고 나와요

```
! [rejected]  task/01-show-list -> task/01-show-list (fetch first)
```

GitHub에 있는 내 브랜치가 내 컴퓨터보다 앞서 있다는 뜻이에요. (다른 컴퓨터에서 push했거나, GitHub 웹에서 고쳤을 때)

```bash
git pull
git push
```

main에 push했다가 거절됐다면, main은 PR로만 합치게 되어 있다는 뜻이에요. 위의 "main에서 커밋까지 해 버렸어요"를 봐 주세요.

### PR에 `This branch has conflicts` 가 떠요

내 브랜치와 main이 같은 곳을 다르게 고쳤다는 뜻이에요. (보통 `git pull`을 잊고 옛날 main에서 출발했을 때 생겨요)

```bash
git switch main
git pull
git switch task/01-show-list
git merge main
```

충돌난 파일을 열면 이런 표시가 있어요.

```
<<<<<<< HEAD
내 브랜치의 코드
=======
main의 코드
>>>>>>> main
```

둘 중 맞는 걸 남기고(또는 합치고) `<<<<<<<`, `=======`, `>>>>>>>` 줄을 지운 다음:

```bash
git add .
git commit -m "과제01: main 변경사항 합치기"
git push
```

> 처음 한두 번은 멘토와 **같이** 해 봐요. 한 번 해보면 별거 아니에요.

### 커밋 메시지에 오타가 났어요 (아직 push 전)

```bash
git commit --amend -m "고친 메시지"
```

push한 뒤라면 그냥 두세요. 머지할 때 하나로 묶이니까 괜찮아요.

### `.g.dart`, `.freezed.dart` 파일도 커밋해야 하나요?

**네, 커밋해요** (우리 팀 방식이에요). 모델을 고쳤다면 `dart run build_runner build -d`로 다시 생성한 다음 같이 커밋해요.

---

## 한 장 요약

```bash
# ① 시작
git switch main && git pull
git switch -c task/NN-설명

# ② ③ 작업 · 커밋 · push
git add . && git commit -m "과제NN: 무엇을 했는지"
git push -u origin task/NN-설명     # 처음만, 이후엔 git push

# ④ GitHub에서 PR 만들기 → 양식 채우기 → 리뷰어 지정

# ⑤ 리뷰 반영: 같은 브랜치에서 고치고 git push → Re-request review

# ⑥ 머지 후
git switch main && git pull
git branch -D task/NN-설명
```
