# 과제 04 — 상세 화면 + 즐겨찾기

> 예상 시간: 하루

## 목표

화면을 하나 더 만들고, **두 화면이 같은 상태(즐겨찾기)를 공유**하게 해요.
"상세 화면에서 바꿨는데 목록에 반영이 안 돼요" 같은 문제를 Riverpod로 어떻게 푸는지 경험해 봅니다.

## 배경 키워드

- `Navigator.push`, `MaterialPageRoute`
- 생성자로 값 넘기기
- `Notifier` (async가 아닌 것), `NotifierProvider`
- `Set`, 불변 상태 업데이트 (`state = {...state, id}`)

## 요구사항

1. **상세 화면** — `lib/presentation/sound_detail/sound_detail_page.dart`
   - 목록에서 음원을 누르면 열려요.
   - 제목, 카테고리, 길이, 설명을 보여줘요.
   - 설명이 `null`이면 `설명이 없어요`라고 회색 글씨로 보여줘요.
2. **즐겨찾기 상태** — `lib/presentation/favorite/favorite_viewmodel.dart`
   - `Notifier<Set<String>>` (즐겨찾기한 음원 id 모음)
   - `toggle(String id)` 메서드 하나
3. **즐겨찾기 버튼**
   - 상세 화면 AppBar 오른쪽에 하트 버튼 (♡ / ♥)
   - 목록의 각 줄에도 즐겨찾기 여부가 보여야 해요.
4. **상단 필터** — 목록 AppBar에 "즐겨찾기만 보기" 토글 버튼

## 완료 기준

- [ ] 상세에서 하트를 누르고 뒤로 가면, 목록에도 바로 반영되어 있다
- [ ] "즐겨찾기만 보기"를 켜면 즐겨찾기한 음원만 보인다
- [ ] 설명이 없는 음원(`깊은 숲속`)에서 앱이 죽지 않는다
- [ ] `flutter analyze`가 깨끗하다

## 힌트

<details>
<summary>힌트 1 — 하트 버튼은 watch? read?</summary>

- 하트 모양(♡/♥)을 **그릴 때** → 바뀌면 다시 그려져야 하니까 `ref.watch`
- 하트를 **눌렀을 때** `toggle` 부르기 → `ref.read(favoriteProvider.notifier).toggle(id)`
</details>

<details>
<summary>힌트 2 — state.add(id)를 했는데 화면이 안 바뀌어요</summary>

Riverpod는 `state`에 **새 객체가 들어왔을 때만** 바뀌었다고 알아차려요.
기존 Set에 `add`만 하면 객체는 그대로라서 모를 수 있어요. 새 Set을 만들어서 넣어 보세요.
</details>

<details>
<summary>힌트 3 — 필터 상태는 어디에 두죠?</summary>

방법이 여러 가지예요. (a) 목록 화면만 쓰니까 `StatefulWidget`에 두기, (b) 작은 provider를 하나 더 만들기.
둘 중 하나를 고르고, **왜 그걸 골랐는지** PR에 적어 주세요. 정답은 없어요.
</details>

## 생각해볼 질문

- 앱을 껐다 켜면 즐겨찾기가 사라져요. 유지하려면 무엇이 더 필요할까요? (만들 필요는 없어요)
- 상세 화면에 `Sound` 객체를 통째로 넘겼나요, 아니면 `id`만 넘겼나요? 각각 장단점은?
