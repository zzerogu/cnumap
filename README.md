
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
    - [⭐ 교내 건물 검색](#1-교내-건물-검색)
    - [⭐ 휠체어 경로 안내](#2-휠체어-경로-안내)
    - [⭐ 태그 기반 위치 확인](#3-태그-기반-위치-확인)
    - [⭐ 마커 클릭 시 상세 정보 팝업](#4-마커-클릭-시-상세-정보-팝업)
    - [⭐ 공사 소식 안내](#5-공사-소식-안내)
    - [⭐ 편의시설 안내](#6-편의시설-안내)
    - [⭐ 건물 상세 정보 안내](#7-건물-상세-정보-안내)
3. [🗒️개발 내용](#개발-내용)
    - [시스템 아키텍처](#시스템-아키텍처)
    - [개발 세부 내용](#개발-세부-내용)
4. [👯팀원](#팀원)


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



## 핵심 기능


### 1. 교내 건물 검색

충남대학교 교내 건물을 검색할 수 있고, 검색된 장소 아이템을 클릭하면 지도에 포커싱됩니다. 해당 마커를 클릭하면, 상세 정보를 확인할 수 있습니다.

- 경사로 안내 : 카테고리 선택 밑에 ‘경사로 표시’ 토글을 통해, 경사로를 지도뷰에 표시 및 해제가 가능합니다. 경사로 표시를 누른다면 경사가 급한 길은 빨간색으로 표시됩니다.
![서비스 플로우](https://github.com/user-attachments/assets/0c83db24-7a37-4184-b38a-e15a85a7db6a)



### 2. 휠체어 경로 안내

자체 제작 경로 찾기 알고리즘을 통해 경사가 심한 도로, 골목길, 계단 등 휠체어가 다니기 어려운 길은 경로 안내 시 배제하고자 하였습니다.

![서비스 플로우 (2)](https://github.com/user-attachments/assets/33d32958-cbb3-4d01-9308-0704593181ca)


### 3. 태그 기반 위치 확인

저장 장소, 휴게실, 경사로, 장애인 화장실,편의점 의 태그를 통해 지도 상에서 마커로 위치를 확인할 수 있습니다.

![서비스 플로우 (3)](https://github.com/user-attachments/assets/76e1af4e-f202-4182-bf80-3b0fff0c6186)


### 4. 마커 클릭 시 상세 정보 팝업

경사로와 화장실 마커를 클릭하면, 추가 정보 팝업을 확인할 수 있습니다.

- 경사로 : 위치, 휠체어 출입, 자료화면
- 화장실 : 위치, 입구, 장애인 화장실, 휠체어 입구, [상세보기, 경로안내] 버튼

![서비스 플로우 (4)](https://github.com/user-attachments/assets/f440a1f0-238a-49cf-b822-2f70232f7dc9)


### 5. 공사 소식 안내

교내에서 진행되는 공사 소식을 제보받아, 이를 학교탭에서 제공합니다.

![서비스 플로우 (5)](https://github.com/user-attachments/assets/db7ad1ef-6de2-408f-be06-ba5cd2905b6f)


### 6. 편의시설 안내

휠체어 이용자들이 이용할 수 있는 교내 편의시설(장애학습 지원센터, 휴게실)을 위치 및 담당자 번호와 함께 안내합니다.

![서비스 플로우 (6)](https://github.com/user-attachments/assets/6343a7fc-484c-4461-841d-774d33d80dd6)


### 7. 건물 상세 정보 안내

교내 건물의 층수 별 평면도,편의시설 여부와 위치를 안내합니다. 우측 상단의 찜 버튼을 통해 내 장소로 저장할 수 있습니다. 이는 저장탭에서 확인 가능합니다.

![서비스 플로우 (7)](https://github.com/user-attachments/assets/77050c91-0f8b-410f-a5f1-f21480d1adec)


## 개발 내용

### 시스템 아키텍처

![21](https://github.com/user-attachments/assets/d764a21c-b9a6-4abc-b829-389c8b023afb)


| FE | BE | Database | Others |
| --- | --- | --- | --- |
| <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=Flutter&logoColor=white"> <img src="https://img.shields.io/badge/mapbox-000000?style=for-the-badge&logo=mapbox&logoColor=white"> | <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=Docker&logoColor=white">  <img src="https://img.shields.io/badge/Rust-000000?style=for-the-badge&logo=Rust&logoColor=white"> | <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=PostgreSQL&logoColor=white">| <img src="https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=Notion&logoColor=white"> <img src="https://img.shields.io/badge/Discord-5865F2?style=for-the-badge&logo=Discord&logoColor=white"> |

### 개발 세부 내용

1. **활용 공공데이터**
    - **교내 데이터**
        
        | 건물 카테고리 데이터 | 장애인 편의시설 위치 데이터 |
        | --- | --- |
        | ![image](https://github.com/user-attachments/assets/77e01425-a501-4ddf-a0b0-39576ed7a90e)|![image](https://github.com/user-attachments/assets/24835c13-bef9-47ae-8674-59258c731606)|
        | 교내 건물 카테고리 데이터를 통해 교내 건물 대분류, 소분류에 활용하였습니다. | 휠체어 이용 장애인들에게 필요한 경사로, 장애인 화장실 정보 등을 교내 건물 도면을 이용해 직접 공공데이터화 하였습니다. |
    - **교외 데이터**
        | Open Street map |
        | --- |
        | ![image](https://github.com/user-attachments/assets/28726428-ee24-4de9-96c7-90123de61549) |
        | OSM 은 전 세계 커뮤니티가 협업하여 구축한 공개 지도 데이터베이스로 누구나 자유롭게 데이터를 수정, 추가, 활용할 수 있는 공공 데이터 플랫폼입니다. 본 서비스에선 직접 충남대학교 일부 건물에 한해 경사로, 장애인 화장실 정보를 추가한 뒤 MapBox API를 통해 렌더링하고 있습니다. 공개 지도 데이터베이스이므로 사용자들은 지도에 직접 위치를 추가할 수 있습니다. |
        | ![image](https://github.com/user-attachments/assets/10239f7e-7877-4f72-bed4-890d12042874) |


2. **ERD 설계서**

<img width="1005" alt="erd" src="https://github.com/user-attachments/assets/196a8b31-78ed-4560-af8f-103f488f39cd" />


3. **프로젝트 구조**

## 팀원


```json
| <img src="https://github.com/aengzu.png" width="80"> <br/> [aengzu](https://github.com/aengzu) | <img src="https://github.com/aengzu.png" width="80"> <br/> [aengzu](https://github.com/aengzu) |  
| FE 주도, 문서 관리 | FE 주도, 문서 관리 |
