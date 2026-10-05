# 과제 05 — 느리고 실패하는 세상

> 예상 시간: 반나절~하루

## 목표

지금은 로컬 파일이라 항상 빠르고 항상 성공해요. 실제 서버는 **느리고, 가끔 실패**하죠.
그런 상황을 일부러 만들어서, 사용자가 당황하지 않는 화면을 만들어 봅니다.

## 배경 키워드

- `Future.delayed`, `Duration`
- `throw` / `try` / `catch`, 직접 만든 `Exception`
- `ref.invalidate`, `ref.refresh`
- `RefreshIndicator`

## 요구사항

1. **느리게** — `SoundRepository.fetchSounds()`가 1.5초 걸리게 만들어요.
2. **가끔 실패** — 30% 확률로 `SoundLoadException`을 던지게 해요. (`dart:math`의 `Random`)
3. **에러 화면**
   - 친절한 문구: `음원을 불러오지 못했어요`
   - **다시 시도** 버튼 → 누르면 다시 불러와요.
4. **당겨서 새로고침** — 목록을 아래로 당기면 다시 불러와요.
5. **즐겨찾기는 유지** — 새로고침해도 즐겨찾기가 사라지면 안 돼요.

## 완료 기준

- [ ] 실패 화면에서 "다시 시도"를 누르면 로딩 → 결과가 나온다
- [ ] 당겨서 새로고침이 된다
- [ ] 새로고침 후에도 즐겨찾기가 그대로다
- [ ] 1~2번에서 넣은 지연/실패 코드는 **한 곳에서 끄고 켤 수 있다** (상수 하나 등)
- [ ] `flutter analyze`가 깨끗하다

## 힌트

<details>
<summary>힌트 1 — 다시 불러오기</summary>

`ref.invalidate(soundListProvider)`를 하면 provider가 "낡은 값"이 되고, 누군가 watch하고 있으면 `build()`가 다시 돌아요.
`RefreshIndicator`의 `onRefresh`는 `Future`를 돌려줘야 해요. `ref.refresh(soundListProvider.future)`를 찾아보세요.
</details>

<details>
<summary>힌트 2 — 다시 시도를 눌렀는데 로딩이 안 보여요 (또는 목록이 깜빡여요)</summary>

`AsyncValue`는 다시 불러오는 동안에도 **이전 값(또는 이전 에러)**을 기억하고 있어요.
`.when`의 `skipLoadingOnRefresh` 옵션과 그 기본값, 그리고 `isRefreshing` / `hasValue`를 찾아보세요.
"다시 시도"와 "당겨서 새로고침"에서 원하는 모습이 각각 다를 수도 있어요.
</details>

## 생각해볼 질문

- 5번(즐겨찾기 유지)은 따로 뭘 안 했는데도 됐나요? 왜 그럴까요?
  (힌트: 즐겨찾기와 음원 목록은 **서로 다른 provider**예요)
- 에러가 났을 때 사용자에게 보여줄 문구와 **개발자가 볼 로그**는 같아야 할까요?

## 실제 프로젝트에서는

formebuds2는 네트워크가 없을 때를 대비해 오프라인 처리도 해요.
`lib/presentation/sound/effective_sound_catalog_provider.dart`를 열어서 **이름과 주석만** 읽어 보세요.
지금 만든 것의 "실전판"이에요.
