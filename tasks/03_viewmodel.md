# 과제 03 — ViewModel로 옮기기 (Riverpod)

> 예상 시간: 하루 · **이 과제가 가장 중요해요.** 우리 앱 코드의 뼈대가 바로 이 구조예요.

## 목표

지금은 화면(Widget)이 파일 읽기, 로딩 상태, 그리기를 **혼자 다** 하고 있어요.
이걸 역할별로 나눠요.

```
SoundListPage          →  SoundListViewModel       →  SoundRepository
"보여주기만 한다"           "상태를 들고 있다"             "데이터를 가져온다"
(ConsumerWidget)          (AsyncNotifier)              (일반 클래스)
```

## 배경 키워드

- `ProviderScope`, `ConsumerWidget`, `WidgetRef`
- `ref.watch` vs `ref.read`
- `AsyncNotifier`, `AsyncNotifierProvider`
- `AsyncValue`와 `.when(data:, loading:, error:)`

## 요구사항

1. **Repository** — `lib/shared/sound_repository.dart`
   - `Future<List<Sound>> fetchSounds()` 하나만 있어요.
   - JSON 읽는 코드를 화면에서 여기로 옮겨요.
2. **ViewModel** — `lib/presentation/sound_list/sound_list_viewmodel.dart`
   - `AsyncNotifier<List<Sound>>`를 상속하고, `build()`에서 repository를 불러요.
   - 파일 맨 아래에 provider를 선언해요: `final soundListProvider = ...`
3. **화면** — `SoundListPage`를 `ConsumerWidget`으로 바꿔요.
   - `initState`, `setState`, nullable 리스트가 **모두 사라져야** 해요.
   - `ref.watch(soundListProvider).when(...)`으로 로딩/에러/데이터를 나눠서 그려요.
4. `main.dart`에서 앱을 `ProviderScope`로 감싸요.

## 완료 기준

- [ ] 화면은 과제 2와 똑같이 보인다
- [ ] `SoundListPage`에 `async`, `await`, `setState`가 하나도 없다
- [ ] 에러 화면이 있다 (일부러 JSON 경로를 틀리게 해서 확인해 보세요 → 확인 후 원래대로)
- [ ] `flutter analyze`가 깨끗하다

## 힌트

<details>
<summary>힌트 1 — ViewModel 모양</summary>

```dart
class SoundListViewModel extends AsyncNotifier<List<Sound>> {
  @override
  Future<List<Sound>> build() async {
    // 여기서 repository를 부르고 결과를 return
  }
}

final soundListProvider =
    AsyncNotifierProvider<SoundListViewModel, List<Sound>>(SoundListViewModel.new);
```
</details>

<details>
<summary>힌트 2 — watch와 read, 언제 뭘 쓰죠?</summary>

- `build()` 안에서 **값을 화면에 보여줄 때** → `ref.watch` (값이 바뀌면 다시 그려짐)
- 버튼의 `onPressed`처럼 **한 번만 꺼내 쓸 때** → `ref.read`

이번 과제에서는 `watch`만 쓰면 돼요. `read`는 과제 4에서 만나요.
</details>

## 생각해볼 질문

- 이렇게 나누면 좋은 점이 뭘까요? 나중에 JSON 대신 **서버**에서 받아오게 바뀐다면 어느 파일만 고치면 되나요?
- 다른 화면에서도 같은 음원 목록이 필요하면 어떻게 하나요? 다시 읽어 올까요?

## 실제 프로젝트에서는

formebuds2의 `lib/presentation/sound/sound_catalog_viewmodel.dart`를 열어 보세요.
**지금 만든 것과 거의 같은 구조**예요. `AsyncNotifier`, `build()`, 맨 아래 provider 선언까지요.
위쪽 긴 주석은 "왜 이렇게 만들었는지"를 설명해요. 위의 두 번째 질문에 대한 실제 답이 거기 있어요.
