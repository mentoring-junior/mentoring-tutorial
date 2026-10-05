# 과제 06 (보너스) — 테스트 작성

> 예상 시간: 반나절 · 여유가 있을 때 해요.

## 목표

"내가 짠 코드가 맞다"는 걸 **눈으로 확인하는 대신 코드로** 확인해 봅니다.

## 요구사항

`test/` 폴더를 만들고 아래 테스트를 작성해요.

1. **모델 테스트** — `test/sound_test.dart`
   - JSON 한 개를 `Sound.fromJson`에 넣었을 때 필드가 제대로 들어가는지
   - `description`이 `null`인 JSON도 잘 되는지
   - 길이 표시 getter가 `1800` → `30분`을 돌려주는지
2. **즐겨찾기 테스트** — `test/favorite_viewmodel_test.dart`
   - `ProviderContainer`를 만들어서 `toggle`을 두 번 부르면 다시 빈 상태가 되는지
3. (도전) **목록 테스트** — 실패하는 가짜 repository를 넣었을 때 ViewModel이 에러 상태가 되는지
   - `ProviderScope`/`ProviderContainer`의 `overrides`를 찾아보세요.
   - 이걸 하려면 repository도 provider로 만들어야 해요. 왜 그런지 생각해 보세요.

## 완료 기준

- [ ] `flutter test`가 모두 통과한다
- [ ] 일부러 코드를 틀리게 고쳤을 때 테스트가 **실패하는 걸** 한 번 확인했다

## 생각해볼 질문

- 3번을 하려고 repository를 provider로 바꾸면서, 과제 3의 코드가 어떻게 바뀌었나요?
  이게 "테스트하기 좋은 구조"라는 말의 의미예요.
