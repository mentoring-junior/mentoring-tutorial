# 과제 00 — 첫 PR 올려보기

> 예상 시간: 1~2시간 · 코드는 거의 안 짜요. **흐름에 익숙해지는 게** 목표예요.

## 목표

앱을 실행해 보고, 아주 작은 변경을 해서 PR → 리뷰 → 머지까지 한 바퀴 돌아봅니다.

## 할 일

1. `flutter pub get` → `flutter run`으로 앱을 실행해 보세요.
2. 브랜치를 만드세요: `git switch -c task/00-first-pr`
3. `lib/presentation/sound_list/sound_list_page.dart`에서
   - 안내 문구를 `안녕하세요, {내 이름}의 사운드 앱입니다`로 바꿔 보세요.
   - 앱을 끄지 말고 터미널에서 **`r`** 을 눌러 보세요 (hot reload).
4. `lib/main.dart`의 `colorSchemeSeed`를 좋아하는 색으로 바꿔 보세요.
   - 이번에는 `r`로 바뀌나요? 안 바뀌면 **`R`** (hot restart)을 눌러 보세요.
5. `flutter analyze`를 돌려서 `No issues found!`가 나오는지 확인하세요.
6. 커밋하고 push한 다음 PR을 올리세요.

## 완료 기준

- [ ] 앱에 내 이름이 보인다
- [ ] 앱 색이 바뀌었다
- [ ] `flutter analyze` 결과가 깨끗하다
- [ ] PR 양식을 채웠다

## 생각해볼 질문 (PR에 짧게 적어 주세요)

- hot reload(`r`)와 hot restart(`R`)는 무엇이 다를까요? 4번에서 둘 중 무엇이 필요했나요?
- `const Text(...)`의 `const`를 지우면 어떻게 되나요? `flutter analyze`는 뭐라고 하나요?

## 실제 프로젝트에서는

formebuds2의 `lib/main.dart`를 열어 보세요. 지금 이 앱의 `main.dart`보다 훨씬 길죠?
다 이해하려고 하지 말고, **`runApp(`이 어디 있는지만** 찾아보세요. 모든 Flutter 앱은 거기서 시작해요.
