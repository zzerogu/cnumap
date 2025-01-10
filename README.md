
<h1 align="center">
    <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Travel%20and%20places/Compass.png" alt="Compass" width="25" height="25" /> ModuCNU <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Travel%20and%20places/Compass.png" alt="Compass" width="25" height="25" />
</h1>

---

### <p align="center">"모두를 위한 길, 함께 걷는 충남대학교"</p>

![썸네일](https://github.com/user-attachments/assets/f86aab9c-b4b9-41f7-bc77-841d55bc949e)


> ‘**모두의 지도**’는 충남대학교 내 장애학생 및 교통 약자를 위한 **배리어 프리 캠퍼스 안내 서비스**입니다. 장애인 전용 화장실, 경사로, 전동 휠체어 충전소 등 편의시설 위치 및 이동 경로를 시각화하여 안내합니다.
>> ‘**배리어 프리**’란 고령자나 장애인과 같은 사회적 약자들이 살기 좋은 사회를 만들기 위해 물리적, 제도적인 장벽을 허물고자 하는 운동으로, ‘**배리어 프리 지도**’에는 장애인용 화장실, 승강기, 경사로 등 **장애인이 이용할 때 영향을 받는 시설들**이 표기되어 있다.

## 목차

1. [🔎소개](#소개)
2. [🌟핵심 기능](#핵심-기능)
    - [✨ 교내 건물 검색](#1-교내-건물-검색)
    - [✨ 휠체어 경로 안내](#2-휠체어-경로-안내)
    - [✨ 태그 기반 위치 확인](#3-태그-기반-위치-확인)
    - [✨ 마커 클릭 시 상세 정보 팝업](#4-마커-클릭-시-상세-정보-팝업)
    - [✨ 공사 소식 안내](#5-공사-소식-안내)
    - [✨ 편의시설 안내](#6-편의시설-안내)
    - [✨ 건물 상세 정보 안내](#7-건물-상세-정보-안내)
3. [🗒️개발 내용](#개발-내용)
    - [⚙️ 시스템 아키텍처](#시스템-아키텍처)
    - [💻 개발 세부 내용](#개발-세부-내용)
4. [👯팀원](#팀원)

<br>

## 소개

### 🔎 Background

> “우리 학교는 얼마나 평등할까요?”

![6](https://github.com/user-attachments/assets/dd8e2a38-223e-476f-85ed-332e9e32a35d)


| AS-IS |  | TO-BE |
| --- | --- | --- |
| 휠체어 이용자들은 교내 저상 버스 이용이 어렵다고 합니다. 그런데, 충남대학교 캠퍼스는 완만한 경사길이어도 휠체어 이용자들이 올라가기 힘들어 개선이 필요합니다. | ➡️ | 휠체어 이용자들을 위한 효율적인 경로 안내를 제공해준다면? |
| 충남대학교 교내 건물 중 일부는 승강기가 설치되어 있지 않아 불편을 야기하기도 합니다. |➡️ | 교내 건물의 승강기 정보를 미리 알 수 있다면? |
| 타 배리어프리맵 서비스를 사용하면, 교내에 특화된 정보 및 경로 안내가 어렵습니다 |➡️  | 교내 특화 정보(편의시설 안내, 건물 상세 정보(승강기, 출입구, 장애인 화장실 등))을 알 수 있다면? |
| 배리어프리맵 제작 지도가 있지만, 손으로 들고 다니는 것은 불편함을 야기합니다. | ➡️ | 충남대학교의 배리어프리맵 실물 지도를 언제나 볼 수 있도록 어플로 제공한다면? |



> ⇒ **휠체어 이용자들을 위한 배리어프리맵 어플리케이션 ‘모두의 지도’**


### 데모 영상

https://github.com/user-attachments/assets/2ced08c5-fcca-4068-ba66-3ffe5e2f9f48

<br>

## 핵심 기능


### 1. 교내 건물 검색

충남대학교 **교내 건물을 검색**할 수 있고, 검색된 장소 아이템을 클릭하면 지도에 포커싱됩니다. 해당 마커를 클릭하면, 상세 정보를 확인할 수 있습니다.

- 경사로 안내 : 카테고리 선택 밑에 `경사로 표시` 토글을 통해, 경사로를 지도뷰에 표시 및 해제가 가능합니다. 경사로 표시를 누른다면 **경사가 급한 길**은 **빨간색**으로 표시됩니다.

![서비스 플로우](https://github.com/user-attachments/assets/0c83db24-7a37-4184-b38a-e15a85a7db6a)



### 2. 휠체어 경로 안내

자체 제작 **경로 찾기 알고리즘**을 통해 경사가 심한 도로, 골목길, 계단 등 **휠체어가 다니기 어려운 길은 경로 안내 시 배제**하고자 하였습니다.
- 경로 찾기 알고리즘 : 경사가 심한 도로, 골목길, 계단 등 휠체어가 다니기 어려운 길에 대한 비용을 높게 설정하여 그러한 경로들을 배제하는 알고리즘

![서비스 플로우 (2)](https://github.com/user-attachments/assets/33d32958-cbb3-4d01-9308-0704593181ca)


### 3. 태그 기반 위치 확인

저장 장소, 휴게실, 경사로, 장애인 화장실, 편의점 의 태그를 통해 **장애인이 이용할 때 영향을 받는 시설**들을 **지도 상에서 마커**로 확인할 수 있습니다.

![서비스 플로우 (3)](https://github.com/user-attachments/assets/76e1af4e-f202-4182-bf80-3b0fff0c6186)


### 4. 마커 클릭 시 상세 정보 팝업

경사로와 화장실 마커를 클릭하면, 추가 정보 팝업을 확인할 수 있습니다.

- **경사로** : 위치, 휠체어 출입, 자료화면
- **화장실** : 위치, 입구, 장애인 화장실, 휠체어 입구, [상세보기, 경로안내] 버튼

![서비스 플로우 (4)](https://github.com/user-attachments/assets/f440a1f0-238a-49cf-b822-2f70232f7dc9)


### 5. 공사 소식 안내

교내에서 진행되는 **공사 소식**을 제보받아, 이를 학교탭에서 제공합니다. 제보는 현재 '문의탭'에서 구글폼을 통해 가능합니다.

![서비스 플로우 (5)](https://github.com/user-attachments/assets/db7ad1ef-6de2-408f-be06-ba5cd2905b6f)


### 6. 편의시설 안내

휠체어 이용자들이 이용할 수 있는 **교내 편의시설(장애학습 지원센터, 휴게실)** 을 위치 및 담당자 번호와 함께 안내합니다.

![서비스 플로우 (6)](https://github.com/user-attachments/assets/6343a7fc-484c-4461-841d-774d33d80dd6)


### 7. 건물 상세 정보 안내

**교내 건물의 층수 별 평면도, 편의시설 여부와 위치**를 안내합니다. 우측 상단의 찜 버튼을 통해 내 장소로 저장할 수 있습니다. 이는 저장탭에서 확인 가능합니다.

![서비스 플로우 (7)](https://github.com/user-attachments/assets/77050c91-0f8b-410f-a5f1-f21480d1adec)



<br>


## 개발 내용

### 시스템 아키텍처

![21](https://github.com/user-attachments/assets/d764a21c-b9a6-4abc-b829-389c8b023afb)


| FE | BE | Database | Others |
| --- | --- | --- | --- |
| <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=Flutter&logoColor=white"> <img src="https://img.shields.io/badge/mapbox-000000?style=for-the-badge&logo=mapbox&logoColor=white"> | <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=Docker&logoColor=white">  <img src="https://img.shields.io/badge/Rust-000000?style=for-the-badge&logo=Rust&logoColor=white"> | <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=PostgreSQL&logoColor=white">| <img src="https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=Notion&logoColor=white"> <img src="https://img.shields.io/badge/Discord-5865F2?style=for-the-badge&logo=Discord&logoColor=white"> |

### 개발 세부 내용

1. **활용 공공데이터**
    - **교내 데이터**    
        <table>
            <thead>
                <tr style="background-color: #f2f2f2;">
                    <th>건물 카테고리 데이터</th>
                    <th>장애인 편의시설 위치 데이터</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><img src="https://github.com/user-attachments/assets/77e01425-a501-4ddf-a0b0-39576ed7a90e" alt="image" width="400"></td>
                    <td><img src="https://github.com/user-attachments/assets/24835c13-bef9-47ae-8674-59258c731606" alt="image" width="400"></td>
                </tr>
                <tr>
                    <td>교내 건물 카테고리 데이터를 통해 교내 건물 대분류, 소분류에 활용하였습니다.</td>
                    <td>휠체어 이용 장애인들에게 필요한 경사로, 장애인 화장실 정보 등을 교내 건물 도면을 이용해 직접 공공데이터화 하였습니다.</td>
                </tr>
            </tbody>
        </table>

    - **교외 데이터**
        | Open Street map |
        | --- |
        | <img src="https://github.com/user-attachments/assets/28726428-ee24-4de9-96c7-90123de61549" alt="OSM Image" width="200"> |
        | OSM 은 전 세계 커뮤니티가 협업하여 구축한 공개 지도 데이터베이스로 누구나 자유롭게 데이터를 수정, 추가, 활용할 수 있는 공공 데이터 플랫폼입니다. 본 서비스에선 직접 충남대학교 일부 건물에 한해 경사로, 장애인 화장실 정보를 추가한 뒤 MapBox API를 통해 렌더링하고 있습니다. 공개 지도 데이터베이스이므로 사용자들은 지도에 직접 위치를 추가할 수 있습니다. |
        | <img src="https://github.com/user-attachments/assets/10239f7e-7877-4f72-bed4-890d12042874" alt="image" width="400"> |


2. **ERD 설계서**
-  <img width="500" alt="erd" src="https://github.com/user-attachments/assets/196a8b31-78ed-4560-af8f-103f488f39cd" />


3. **프로젝트 구조**
    - **FE**
        ```plaintext
        lib/
        ├── data/                      # 데이터 처리 관련 코드
        │   ├── local/                 # 로컬 데이터 처리 (예: SQLite, SharedPreferences 등)
        │   │   ├── dao/               # 데이터 접근 객체 (DAO)
        │   │   └── entity/            # 엔티티 클래스 (DB 모델 등)
        │   ├── mapper/                # 데이터 매핑 관련 코드 (DTO -> Domain 모델 변환 등)
        │   ├── remote/                # 원격 데이터 처리 (API, 네트워크 호출 등)
        │   │   ├── api/               # API 통신 관련 코드
        │   │   └── dto/               # 데이터 전송 객체 (DTO)
        │   └── repository/            # 데이터 레포지토리 (데이터 처리 로직을 포함)
        │
        ├── di/                        # 의존성 주입 관련 코드
        │   ├── auth_di.dart           # 인증 관련 의존성 주입
        │   ├── construction_di.dart   # 건물 관련 의존성 주입
        │   ├── network_di.dart        # 네트워크 관련 의존성 주입
        │   └── service_locator.dart   # 서비스 로케이터 (DI 관리)
        │
        ├── domain/                    # 비즈니스 로직 (도메인 계층)
        │   ├── model/                 # 도메인 모델 (핵심 데이터 모델)
        │   │   ├── construction_news.dart   # 건설 뉴스 모델
        │   │   └── place.dart             # 장소 모델
        │   ├── repository/             # 도메인 레포지토리 (비즈니스 로직을 다루는 추상화)
        │   └── usecases/               # 유즈케이스 (실제 비즈니스 로직 실행)
        │
        ├── navigation/                # 네비게이션 관련 코드
        │   └── main_navigation_page.dart   # 앱의 메인 네비게이션 페이지
        │
        ├── presentation/               # 사용자 인터페이스(UI) 관련 코드
        │   ├── common/                 # 공통 UI 컴포넌트
        │   │   ├── category_chip.dart  # 카테고리 칩 UI
        │   │   ├── category_list.dart  # 카테고리 목록 UI
        │   │   └── custom_search_bar.dart  # 검색 바 UI
        │   ├── map/                    # 지도 관련 UI 코드
        │   │   ├── map_page.dart       # 지도 페이지
        │   │   ├── search_page.dart    # 검색 페이지
        │   │   └── search_viewmodel.dart   # 검색 화면의 ViewModel
        │   ├── saved/                  # 저장된 항목들 관련 UI
        │   │   └── save_page.dart      # 저장된 항목 페이지
        │   ├── school/                 # 학교 관련 UI
        │   │   └── school_page.dart    # 학교 페이지
        │   ├── theme/                  # 테마 및 스타일 관련 코드
        │   │   └── color.dart          # 색상 정의 파일
        │   ├── timetable/              # 시간표 관련 UI
        │   │   └── time_page.dart      # 시간표 페이지
        │   └── component/              # 학교 관련 컴포넌트들
        │       ├── building_info_section.dart  # 건물 정보 섹션
        │       ├── chacha_info_section.dart   # 차차 정보 섹션
        │       ├── construction_news_component.dart  # 건설 뉴스 컴포넌트
        │       ├── disabled_center_detail.dart   # 장애인 센터 상세 정보
        │       └── section_title.dart  # 섹션 제목
        ```
   - **BE**
        ```plaintext
        src/
        ├── config/                    # 설정 관련 코드
        │   ├── app.rs                 # 애플리케이션 설정 파일
        │   └── mod.rs                 # 모듈 설정 파일
        │
        ├── db/                        # 데이터베이스 관련 코드
        │   ├── connection.rs          # 데이터베이스 연결 설정
        │   └── mod.rs                 # 데이터베이스 관련 모듈 설정
        │
        ├── handlers/                  # 요청 처리 로직 (API 핸들러)
        │   ├── building.rs            # 건물 관련 API 핸들러
        │   ├── construction_news.rs   # 건설 뉴스 관련 API 핸들러
        │   ├── disabled_restroom.rs   # 장애인 화장실 관련 API 핸들러
        │   ├── map.rs                 # 지도 관련 API 핸들러
        │   ├── mod.rs                 # 모듈 설정 파일
        │   ├── navigation.rs          # 네비게이션 관련 API 핸들러
        │   └── ramp.rs                # 경사로 관련 API 핸들러
        │
        ├── models/                    # 데이터 모델 (DB 모델 등)
        │   ├── building.rs            # 건물 모델
        │   ├── construction_news.rs   # 건설 뉴스 모델
        │   ├── disabled_restroom.rs   # 장애인 화장실 모델
        │   ├── elevator.rs            # 엘리베이터 모델
        │   ├── mod.rs                 # 모델 관련 설정
        │   └── ramp.rs                # 경사로 모델
        │
        ├── routes/                    # 라우팅 관련 코드
        │   ├── building.rs            # 건물 관련 라우트
        │   ├── construction_news.rs   # 건설 뉴스 관련 라우트
        │   ├── disabled_restroom.rs   # 장애인 화장실 관련 라우트
        │   ├── health.rs              # 건강 관련 라우트
        │   ├── map.rs                 # 지도 관련 라우트
        │   ├── mod.rs                 # 라우팅 설정 파일
        │   ├── navigation.rs          # 네비게이션 관련 라우트
        │   └── ramp.rs                # 경사로 관련 라우트
        │
        ├── services/                  # 서비스 로직 (비즈니스 로직)
        │   ├── auth_service.rs        # 인증 관련 서비스
        │   ├── mod.rs                 # 서비스 관련 설정 파일
        │   └── user_service.rs        # 사용자 관련 서비스
        │
        ├── tests/                     # 테스트 코드
        │   ├── health.rs              # 건강 관련 테스트
        │   ├── integration.rs         # 통합 테스트
        │   └── mod.rs                 # 테스트 모듈 설정
        │
        ├── utils/                     # 유틸리티 함수들
        │   ├── hasher.rs              # 해시 함수 관련 코드
        │   ├── logger.rs              # 로깅 관련 코드
        │   └── mod.rs                 # 유틸리티 관련 설정 파일
        │
        ├── lib.rs                     # 라이브러리 코드
        └── main.rs                    # 메인 애플리케이션 실행 코드
        ```
   

<br>

## 팀원

|<img src="https://avatars.githubusercontent.com/u/102356873?v=4" width="150" height="150"/>|<img src="https://avatars.githubusercontent.com/u/87114004?v=4" width="150" height="150"/>|<img src="https://avatars.githubusercontent.com/u/81271644?v=4" width="150" height="150"/>|
|:-:|:-:|:-:|
|[@aengzu](https://github.com/aengzu)|[@paintedblue](https://github.com/paintedblue)|[@Yijungu](https://github.com/Yijungu)|
| FE 주도 개발, 작업 문서 관리, 기획 | 기획 및 디자인 주도 개발, FE | BE 주도 개발 및 배포, FE, 기획, DB |
