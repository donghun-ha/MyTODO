# 📌 MyTODO
> “쓰기 빠르고, 다시 찾기 쉬운” 로컬 TODO  
> 오프라인에서도 안정적인 **SQLite 기반** 개인 할 일 관리 앱

---

## 📽️ 데모 영상
[👉 유튜브 시연 영상 보러가기](https://youtu.be/iErWG7Uz2GM)

---

## 🧩 프로젝트 개요
MyTODO는 Flutter와 SQLite를 사용한 **로컬 할 일 관리 앱**입니다.  
**반복/태그/완료 필터** 등 “다시 찾아보기 쉬움”에 집중해 설계했고,  
**GetX 상태관리**로 화면 갱신을 가볍게 유지하며 사용성을 높였습니다.

---

## 👨‍💻 맡은 역할 (개인 프로젝트)

| 분야 | 주요 내용 |
|---|---|
| **프론트엔드** | 전 화면(UI)·네비게이션 구현, GetX 상태관리 |
| **데이터** | SQLite 스키마/CRUD 설계·구현 |
| **UX** | 반복/태그/완료 필터 등 핵심 사용성 기획 |

---

## 🛠 기술 스택

**Frontend**  
<img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" height="28"/> <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" height="28"/>

**State**  
<img src="https://img.shields.io/badge/GetX-2E7D32?style=for-the-badge" height="28"/>

**Database**  
<img src="https://img.shields.io/badge/SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white" height="28"/>

**Tools**  
<img src="https://img.shields.io/badge/VSCode-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white" height="28"/> <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" height="28"/>

---

## 🌟 주요 기능

| 기능 | 설명 |
|---|---|
| ✍️ 등록/수정/삭제 | 제목·메모·시간·태그까지 관리 |
| 🔁 반복 | 일/주/월 반복 규칙 저장 |
| 🎨 태그 색상 | 우선순위/카테고리 색상으로 시각 구분 |
| ✅ 완료/필터 | 완료 토글, 상태별 리스트 필터 |

---

## 🖥️ 시스템 아키텍처
Flutter ↔ **SQLite(로컬)**  
앱 내부 DB로 오프라인에서도 안정적으로 동작합니다.

---

## 🗂 데이터 모델 (ERD)
| 컬럼명         | 타입         | 설명                                  |
| ------------- | ------------ | ------------------------------------- |
| id            | INTEGER PK   | 고유 식별자                            |
| title         | TEXT         | 할 일 제목                              |
| note          | TEXT         | 상세 내용                               |
| date          | TEXT         | 날짜 (yyyy-mm-dd)                      |
| startTime     | TEXT         | 시작 시간                               |
| endTime       | TEXT         | 종료 시간                               |
| remind        | INTEGER      | 알림 설정 (분 단위)                      |
| repeat        | TEXT         | 반복 설정 (None/Daily/Weekly/Monthly)  |
| color         | INTEGER      | 태그 색상 구분                          |
| isCompleted   | INTEGER      | 완료 여부 (0/1)                         |

---

## 🧠 트러블슈팅 기록

### 1) 날짜 정렬 오류(문자열 정렬 문제)
- **문제**: 문자열로 정렬해 `10일`이 `2일`보다 먼저 나오는 현상  
- **해결**: 저장 시 ISO DateTime으로 통일 → 조회 시 포맷팅  
- **성과**: 정렬·필터 정확도 향상, 검색/필터 로직 단순화

### 2) 완료 토글 후 리스트 반영 지연
- **문제**: 완료 상태 변경 후 즉시 화면에 반영되지 않아 UX 저하
- **해결**: 로컬 DB 업데이트 함수 호출 → GetX 상태 갱신 → 리스트 재조회/refresh 순서로 처리 흐름 표준화
- **성과**: 토글 즉시 반영, 스크롤 포지션 유지로 사용감 개선

---

## ✏️ 느낀 점
로컬 데이터 모델링과 상태관리의 **기본기**를 다졌고,  
사용자가 “다시 찾아보기 쉬운 구조”를 만들기 위해 작은 인터랙션부터 데이터 흐름까지 직접 설계했습니다.  
트러블슈팅 과정에서 **우선순위 판단과 범위 조절**을 배우며 안정적인 앱 구조를 고민했습니다.

---

## 📌 GitHub
[🔗 MyTODO Repository](https://github.com/donghun-ha/MyTODO)
