# Mini Sound App — Flutter 온보딩 과제

formebuds2의 **음원 목록 화면**을 아주 작게 줄인 연습용 앱입니다.
BLE, 네이티브 코드, 서버 같은 건 전혀 없고, 로컬 JSON 파일 하나로 시작합니다.

목표는 "모든 걸 아는 것"이 아니라, **우리 앱이 어떤 구조로 돌아가는지 직접 손으로 한 번 짜보는 것**이에요.
과제를 다 끝내고 formebuds2 코드를 열어 보면 "아, 이거 내가 해본 거네" 싶은 부분이 꽤 많을 거예요.

---

## 우리 앱의 지도

처음 보는 단어가 나오면, 일단 **아래 4칸 중 어디에 속하는지**만 먼저 정해 보세요.
나머지는 천천히 알아가도 괜찮아요.

```
 ① 화면(Widget)  →  ② ViewModel  →  ③ Repository  →  ④ 패키지 / 네이티브
 "무엇을 보여줄까"   "상태를 들고 있음"   "데이터를 가져옴"    BLE, 오디오, 플랫폼 채널 …
```

- 이 과제에서는 ①②③을 직접 만들어 봅니다.
- ④는 실제 업무에서 하나씩 만나면서 배워도 충분해요.

---

## 시작하기

```bash
flutter pub get
flutter run
```

"사운드"라는 제목과 안내 문구가 보이면 준비가 끝난 거예요.

## 진행 방법

1. `tasks/` 폴더의 과제를 **번호 순서대로** 진행합니다.
2. 과제마다 브랜치를 새로 만들어요: `git switch -c task/01-show-list`
3. 끝나면 PR을 올리고 리뷰를 요청합니다. PR 양식은 자동으로 채워져요.
4. 리뷰 후에 **10분 정도 "이 코드 설명해줘" 시간**을 가집니다. 말로 설명할 수 있으면 진짜 이해한 거예요.
5. 머지되면 다음 과제로 넘어가요.

| # | 과제 | 배우는 것 |
|---|---|---|
| 00 | [첫 PR 올려보기](tasks/00_first_pr.md) | 실행, Git 흐름, Hot reload |
| 01 | [JSON 읽어서 목록 띄우기](tasks/01_show_list.md) | `Future`, `async/await`, `ListView`, StatefulWidget |
| 02 | [모델을 freezed로 바꾸기](tasks/02_freezed_model.md) | 코드 생성, `.g.dart` / `.freezed.dart`, null safety |
| 03 | [ViewModel로 옮기기](tasks/03_viewmodel.md) | Riverpod, `AsyncNotifier`, `AsyncValue`, Repository |
| 04 | [상세 화면 + 즐겨찾기](tasks/04_detail_and_favorite.md) | 화면 이동, 여러 화면이 상태 공유하기 |
| 05 | [느리고 실패하는 세상](tasks/05_loading_and_error.md) | 로딩/에러 처리, 재시도, 당겨서 새로고침 |
| 06 | [(보너스) 테스트 작성](tasks/06_bonus_test.md) | 단위 테스트, Provider 테스트 |

---

## AI 사용 규칙

AI를 쓰지 말라는 게 아니라, **용도를 나눠서** 쓰자는 거예요.

| ✅ 써도 돼요 | ❌ 과제 중에는 참아요 |
|---|---|
| "`late`가 뭐야?" 같은 개념 질문 | "이 기능 만들어줘" |
| 에러 메시지 해석 | 과제 설명을 통째로 붙여 넣기 |
| **내가 다 짠 코드**를 리뷰받기 | 내가 이해 못 한 코드를 그대로 붙이기 |

PR에 **"AI에게 물어본 것 / 스스로 해결한 것"**을 꼭 적어 주세요.
나중에 돌아보면 내가 생각보다 많이 배웠다는 게 보여요.

## 막혔을 때 순서

1. **에러 메시지를 끝까지 읽기.** 대부분 몇 번째 줄에서 무엇이 문제인지 알려줘요.
2. **정의로 이동하기** (Cmd+클릭). Flutter 위젯도 결국 다트 코드라서 열어 볼 수 있어요.
3. 과제 문서의 **힌트**를 펼쳐 보기.
4. **15분 넘게 막히면 물어보기.** 질문할 때는 "무엇을 하려고 했고 → 무엇을 해봤고 → 무엇이 안 되는지"를 같이 말해 주세요.

> 모르는 게 나오는 건 당연해요. 선배도 매일 모르는 걸 찾아봅니다.
> 중요한 건 다 아는 게 아니라, **모를 때 어떻게 찾아가는지** 아는 거예요.

---

## 폴더 구조 (최종 모습)

formebuds2와 비슷한 구조로 맞춰 두었어요.

```
lib/
├── main.dart
├── shared/                      # 여러 화면이 같이 쓰는 것
│   ├── models/sound.dart        # 과제 1~2
│   └── sound_repository.dart    # 과제 3
└── presentation/                # 화면별 폴더
    ├── sound_list/
    │   ├── sound_list_page.dart
    │   └── sound_list_viewmodel.dart   # 과제 3
    ├── sound_detail/            # 과제 4
    └── favorite/                # 과제 4
```

## 자주 쓰는 명령어

```bash
flutter run                          # 실행 (실행 중에 r = hot reload, R = hot restart)
flutter analyze                      # 린트/타입 검사 — PR 전에 꼭 돌리기
dart format lib                      # 코드 정리
dart run build_runner build -d       # freezed / json 코드 생성 (과제 2부터)
flutter test                         # 테스트 (과제 6)
```
