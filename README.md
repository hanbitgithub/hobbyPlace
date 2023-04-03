# HobbyPlace 🎨

# Contents <br>
1. [개요](#star-개요)  
2. [팀 소개 및 주요 기능](#star-팀-소개-및-주요-기능)
3. [구현 기능](#star-구현-기능)
    - [메인페이지](#pushpin-메인페이지)
    - [(튜터)튜터 메인페이지, 프로필수정](#pushpin-(튜터)메인페이지)
    - [(튜터)클래스 등록](#pushpin-(튜터)클래스등록)
    - [(튜터)클래스 수정/삭제](#pushpin-(튜터)클래스수정/삭제)
    - [(튜터)클래스 조회](#pushpin-(튜터)클래스조회)
    - [(관리자)클래스 승인/반려](#pushpin-(관리자)클래스승인/반려)
    - [(관리자)클래스 조회](#pushpin-(관리자)클래스조회)   
    - [(사용자)클래스 카테고리 검색](#pushpin-(사용자)클래스카테고리검색)   
    - [(사용자)클래스 상세 검색](#pushpin-(사용자)클래스상세검색) 
    - [(사용자)클래스 필터,정렬](#pushpin-(사용자)클래스필터,정렬) 
    - [(사용자)클래스 튜터상세정보](#pushpin-(사용자)클래스튜터상세정보)  
   

4. [Document](#star-document)

***

# :star: 개요
- 프로젝트명 : HobbyPlace Project <br>

- 기획 의도  <br>
  - 일상에서 다양한 취미를 쉽게 접할 수 있는 공간 제공<br>
  - 취미와 재능을 활용하여 수익을 창출할 수 있는 방법 제안 <br>
  - 공통의 관심사를 통해 서로를 연결해 주는 취미 여가 플랫폼 기획 <br>

- 개발 환경 <br><br>
![개발환경](https://user-images.githubusercontent.com/115604577/228150767-6fedb903-4e39-4840-bf42-b2456a9ff806.png)<br>

- usecase 다이어그램
- 사용자(튜티) , 강사(튜터) <br>
![usecase 1](https://user-images.githubusercontent.com/115604577/228152251-2b86a711-2218-4d62-8dca-f3a76ad3e766.png) <br>
- 관리자<br>
![usecase 관리자](https://user-images.githubusercontent.com/115604577/228152395-0ce1c0fc-8a3f-454e-81cb-65c3d254df95.png)<br>

- DB 설계(ERD Cloud) <br>
![erd](https://user-images.githubusercontent.com/115604577/228807391-367a106b-f8f9-4da1-8503-fdb77a568701.jpg)

- 개발 일정 <br>
![개발일정](https://user-images.githubusercontent.com/115604577/229401260-bc0e107d-1187-4b13-b291-5b31f27f6590.png)

***


# :star: 팀 소개 및 주요 기능

![파트분배](https://user-images.githubusercontent.com/115604577/228151268-e57ed964-9eb9-4f15-9c6e-2dd9194bafc7.png)

***
 
 
# :star: 구현 기능
## [사용자]
### :pushpin: 메인페이지
![메인페이지](https://user-images.githubusercontent.com/115604577/228810897-849d669f-80a9-4f8f-8f62-e37d70078176.gif)
- 메인페이지 구현기능 
- 카테고리 검색
- 상세검색 
### :pushpin: (튜터)메인페이지
![튜터메인,프로필수정](https://user-images.githubusercontent.com/115604577/228811340-f82ea3b9-a0d6-400e-8880-236c80a18f0d.gif)
- 구현기능 설명
- 공지사항, 예약관리 최근게시글 조회
- 튜터(강사)의 평균 별점, 수강 후기 수, 문의응답률, 이번달 취소건수, 진행중인 클래스 수, 이번달 판매 금액, 전체 결제 건수, 전체 판매금액의 통계 간략한 조회 
- 튜터 프로필 수정 ( 닉네임 중복검사, 글자수 체크) 


### :pushpin: (튜터)클래스등록
![클래스등록 튜터](https://user-images.githubusercontent.com/115604577/229394659-7f14396b-ca7f-4f5f-89b4-59ee3ec0a3bb.gif)
- 구현기능 설명
- 다음 주소검색 API / summernote API 사용
- 사진 4장까지 첨부 가능
- 필수입력사항 미입력시 submit되지않음

### :pushpin: (튜터)클래스수정/삭제
![클래스수정 삭제](https://user-images.githubusercontent.com/115604577/229395245-c19ddd15-b622-4e44-96f9-41cd2689012f.gif)
- 구현기능 설명
- 기존등록한 내용 불러와 수정가능
- 사진 변경 가능
- 클래스 수정시에는 관리자에게 재승인 받은 후 판매 가능 

### :pushpin: (튜터)클래스조회
![클래스조회](https://user-images.githubusercontent.com/115604577/229395928-a740e720-f6d4-4fc9-b982-2b18dd6b11a0.gif)
- 구현기능 설명
- 클래스 검색기능 (키워드/기간/상태)
- 클래스 상세페이지 카카오 지도API

### :pushpin: (관리자)클래스승인/반려
![관리자 클래스 승인반려](https://user-images.githubusercontent.com/115604577/229396312-f0dba6a5-9787-4f2d-b47c-b2a5f2756af9.gif)
- 구현기능 설명
- 튜터가 등록한 신규클래스 조회
- 상세내용 확인 후 승인되면 판매시작
- 체크박스 선택 후 승인 또는 반려 가능
 
 ### :pushpin: (관리자)클래스조회
![클래스조회 관리자2](https://user-images.githubusercontent.com/115604577/229398110-5e7b48ba-1f24-43dc-bfb2-4f8b955bb60c.gif)
- 구현기능 설명
- 페이징처리 
- 클래스 검색기능 (키워드/카테고리/기간/상태)

 ### :pushpin: (사용자)클래스카테고리검색
 ![클래스 카테고리](https://user-images.githubusercontent.com/115604577/229398422-d7b4b620-99b4-4e12-8d67-a001f7e02b9f.gif)
 - 구현기능 설명
 - 카테고리 대분류/소분류 별 조회가능
 
 ### :pushpin: (사용자)클래스상세검색
 ![사용자 클래스상세조회](https://user-images.githubusercontent.com/115604577/229398981-45ea96b0-dcdc-45a6-a45d-bdda1ad26363.gif)
 - 구현기능 설명
 - 키워드/카테고리/지역/가격/요일 별 검색가능 
 - 파라미터 변경으로 필터조회도 가능 
 
 ### :pushpin: (사용자)클래스필터,정렬
 ![사용자 클래스필터](https://user-images.githubusercontent.com/115604577/229399951-f5566946-a243-45fd-9914-1a446c9a1880.gif)
 - 구현기능 설명
 - 필터기능 - 지역/ 요일별로 필터
 - 정렬기능 - 가격순/ 인기순/ 리뷰순 으로 정렬
 
  ### :pushpin: (사용자)클래스튜터상세정보
  ![튜터 조회](https://user-images.githubusercontent.com/115604577/229400619-cb49c202-a9a7-46b8-9c8a-a91eb2dccc6a.gif)
- 구현기능 설명
- 클래스를 올린 튜터에 대한 상세정보를 볼 수있는 페이지
- 튜터가 진행중인 모든 클래스, 리뷰 조회
- 리뷰 이미지 클릭시 확대
