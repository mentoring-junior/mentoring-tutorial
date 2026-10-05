# 과제 01 — JSON 읽어서 목록 띄우기

> 예상 시간: 반나절~하루

## 목표

`assets/sounds.json`을 읽어서 음원 목록을 화면에 보여줍니다.
이번에는 **구조는 신경 쓰지 말고, 일단 화면에 나오게** 만드는 게 목표예요. (구조는 과제 3에서 정리해요)

## 배경 키워드

처음 듣는 게 있으면 찾아보세요. 다 알 필요는 없고, 막히는 것만 찾아봐도 돼요.

- `StatelessWidget` vs `StatefulWidget`, `setState`, `initState`
- `Future`, `async` / `await`
- `rootBundle.loadString` (asset 파일 읽기)
- `jsonDecode` (`dart:convert`)
- `ListView.builder`, `ListTile`

## 요구사항

1. 화면이 열리면 `assets/sounds.json`을 읽어요.
2. 읽는 동안에는 가운데에 `CircularProgressIndicator`를 보여줘요.
3. 다 읽으면 목록을 보여줘요. 각 줄에는
   - **제목** (`title`)
   - **카테고리 · 길이** — 예: `자연 · 30분` (`duration_sec`는 초 단위예요)
   - `is_premium`이 `true`면 오른쪽에 🔒 아이콘
4. 이번 과제에서는 **모델 클래스를 직접 손으로** 만들어 보세요.
   - `lib/shared/models/sound.dart`에 `Sound` 클래스와 `factory Sound.fromJson(Map<String, dynamic> json)`
   - `description`은 `null`일 수 있어요. 타입을 어떻게 적어야 할까요?

## 완료 기준

- [ ] 앱을 켜면 잠깐 로딩이 보이고 8개 음원이 나온다
- [ ] 길이가 "분" 단위로 보인다
- [ ] 프리미엄 음원에만 🔒가 보인다
- [ ] `flutter analyze`가 깨끗하다

## 힌트

<details>
<summary>힌트 1 — 어디서 파일을 읽어야 하나요?</summary>

`build()` 안에서 읽으면 화면이 다시 그려질 때마다 계속 읽어요.
화면이 처음 만들어질 때 **딱 한 번** 불리는 곳이 어디일까요? (`StatefulWidget`의 생명주기를 찾아보세요)
</details>

<details>
<summary>힌트 2 — JSON 구조</summary>

`jsonDecode`의 결과는 `dynamic`이에요. 이 파일은 `{ "sounds": [ {...}, {...} ] }` 모양이라서
`json['sounds']`는 `List<dynamic>`이고, 그 안의 각 원소는 `Map<String, dynamic>`이에요.
</details>

<details>
<summary>힌트 3 — 로딩 중인지 어떻게 알죠?</summary>

`List<Sound>? _sounds;`처럼 nullable로 두면, `null`이면 아직 로딩 중이라고 볼 수 있어요.
값을 넣은 다음에 화면을 다시 그리려면 무엇을 불러야 할까요?
</details>

## 생각해볼 질문

- `setState`를 빼먹으면 어떻게 되나요? 직접 지워서 확인해 보세요.
- `fromJson`에서 키 이름을 오타 내면(`'titel'`) 언제 에러가 나나요? 컴파일할 때? 실행할 때?
  → 이 불편함이 과제 2에서 freezed를 쓰는 이유예요.

## 실제 프로젝트에서는

formebuds2는 이 화면을 이렇게 직접 짜지 않아요. 과제 3까지 끝내면 왜 그런지 알게 될 거예요.
