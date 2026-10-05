# 과제 02 — 모델을 freezed로 바꾸기

> 예상 시간: 반나절

## 목표

과제 1에서 손으로 짠 `Sound` 클래스를 **freezed + json_serializable**로 바꿔요.
formebuds2 코드에서 자주 보이는 `part '...freezed.dart'`, `.g.dart` 파일이 무엇인지 알게 됩니다.

## 배경 키워드

- 코드 생성(code generation), `build_runner`
- `@freezed`, `part` 지시어
- `@JsonKey(name: ...)`
- 불변 객체(immutable), `copyWith`, `==` 비교

## 요구사항

1. `lib/shared/models/sound.dart`를 `@freezed` 클래스로 바꿔요.
2. 필드 이름은 다트 스타일(camelCase)로 써요: `durationSec`, `isPremium`.
   JSON 키는 `duration_sec`처럼 snake_case니까 이어주는 방법을 찾아보세요.
3. 길이를 "30분"처럼 바꿔주는 코드가 화면에 있다면, 모델 쪽으로 옮겨 보세요.
   (freezed 클래스에 직접 만든 getter를 추가하려면 조건이 하나 있어요)
4. `dart run build_runner build -d`로 코드를 생성해요.
5. 생성된 `.g.dart`, `.freezed.dart` 파일도 **커밋해요** (우리 팀 방식).

## 완료 기준

- [ ] 화면은 과제 1과 똑같이 보인다
- [ ] 직접 짠 `fromJson` 코드는 사라졌다
- [ ] 생성 파일이 커밋에 포함되어 있다
- [ ] `flutter analyze`가 깨끗하다

## 힌트

<details>
<summary>힌트 1 — 기본 모양</summary>

```dart
part 'sound.freezed.dart';
part 'sound.g.dart';

@freezed
abstract class Sound with _$Sound {
  const factory Sound({ /* 필드들 */ }) = _Sound;

  factory Sound.fromJson(Map<String, dynamic> json) => _$SoundFromJson(json);
}
```

처음엔 빨간 줄이 잔뜩 생기는 게 정상이에요. `build_runner`를 돌리면 사라져요.
</details>

<details>
<summary>힌트 2 — 직접 getter 추가하기</summary>

freezed 문서에서 "Adding getters and methods to our models"를 찾아보세요.
`const Sound._();` 한 줄이 필요해요.
</details>

## 직접 확인해볼 것

- `sound.freezed.dart`를 열어서 `==`와 `copyWith`가 어떻게 생겼는지 **훑어보세요**. (다 읽을 필요 없어요)
- 아래 코드를 `main()`에 잠깐 넣고 실행해 보세요. 과제 1의 직접 짠 클래스였다면 결과가 어땠을까요?

  ```dart
  final a = Sound(id: 'x', /* ... */);
  final b = Sound(id: 'x', /* 같은 값 */);
  print(a == b);
  ```

## 실제 프로젝트에서는

formebuds2의 `lib/presentation/home/home_state.dart`를 열어 보세요.
지금 만든 것과 같은 모양이 보일 거예요. 이제 `part 'home_state.freezed.dart';`가 무슨 뜻인지 알죠?
