## PASS WORLD

### 프로젝트 설명
  - 출발지와 도착지를 통한 간편한 비행기티켓 예매를 가능하게 했습니다.
  - 게시판을 통해 여행후기를 공유할 수 있게 했습니다.
  - 포인트를 통해 아이템 구매를 할 수 있게 했습니다.
  - 관리자와 유저 페이지를 구분했습니다.

---------------------------------------------------
##### 실행환경 및 버전 
  - window 7 / window 10 ( x64 ) , browser ( chrome )
  - MYSQL ver.8.0.21 
  - JDK ver.14.0.1
  - Apache Tomcat ver.9.0   
  - 구동전 필요한 데이터 및 설치파일
    -  [SQL 쿼리](https://github.com/JD-jeongwook/passworld/tree/main/KANG_PROJECT/export)
    -  [contextFile](https://github.com/JD-jeongwook/passworld/blob/main/KANG_PROJECT/context.xml)
    -  [Cos.jar](http://www.servlets.com/cos/) ,  [Jstl.jar](https://tomcat.apache.org/download-taglibs.cgi) , [Connector J](https://dev.mysql.com/downloads/connector/j/8.0.html)

**쿼리문을 DB에 꼭 넣어주세요.**

**보안을 위해 contextFile은 비공개 처리 했습니다.**

----------------------------------

### 프로젝트 이미지 ( 유저 )

  * 메인 페이지
    * PASS WORLD 메인 페이지입니다.
    * 이미지 슬라이드의 이미지들은 최근 한달 좋아요 수가 가장 높은 게시물 사진입니다.

  ![move_sumbnail](https://user-images.githubusercontent.com/75401960/102967365-1aca9780-4535-11eb-989e-a88e59a160ee.gif)

  * 게시판
    * 유저들이 소통할 수 있는 공간입니다.
   
  ![board](https://user-images.githubusercontent.com/75401960/102973788-bca3b180-4540-11eb-82d2-73e2967234eb.gif)
  
  * 나의 갤러리
    * 내가 게시판에 올린 사진을 한눈에 볼 수 있습니다.
  
  ![gallary](https://user-images.githubusercontent.com/75401960/102974475-f3c69280-4541-11eb-8dc3-b6e91b45e49e.gif)
  
  * 간편 예매
    * 비행기 티켓을 간편하게 예매할 수 있습니다.
    
    ![Reservation](https://user-images.githubusercontent.com/75401960/102978713-47d47580-4548-11eb-86f7-cefd317439d1.gif)

  * 프로필 변경
    * 유저가 원하는 프로필사진을 설정할 수 있습니다.
     
    ![profile](https://user-images.githubusercontent.com/75401960/102992790-406c9680-455f-11eb-907b-896430b7a9da.gif)

  * 포인트 샵
    * 티켓예매, 게시글등록, 댓글 등록 등으로 쌓은 포인트를 상품권과 교환할 수 있습니다.
     
    ![shop](https://user-images.githubusercontent.com/75401960/102993127-f6d07b80-455f-11eb-8775-92bd77725244.gif)

  * 이벤트 페이지
    * 각종 이벤트 내용을 볼 수 있는 페이지입니다.
    * 이벤트 기간이 끝나면 자동으로 종료된 이벤트로 넘어갑니다.
     
    ![event](https://user-images.githubusercontent.com/75401960/102993388-71010000-4560-11eb-8f7c-1f25786d0d86.gif)

  * 1:1문의 페이지
    * 유저가 질문하고 관리자가 답변하는 페이지입니다.
    * 답변 여부에 따라 답변대기중,확인대기중,답변완료로 나뉩니다.
     
    ![qna](https://user-images.githubusercontent.com/75401960/102993896-5da26480-4561-11eb-98f8-dcd8e3859757.gif)

-------------------------------

### 프로젝트 이미지 ( 관리자 )

 * 유저관리
   * 유저정보 확인 및 추방, 포인트 지급을 할 수 있습니다.
    
   ![admin_user](https://user-images.githubusercontent.com/75401960/102994381-50d24080-4562-11eb-9d85-dd92b709c7da.gif)

 * 게시판 관리
   * 게시판에 있는 게시글의 상태 확인 및 삭제가 가능합니다.
   
   ![admin_board](https://user-images.githubusercontent.com/75401960/102994809-29c83e80-4563-11eb-9c9e-6ced4db3e9c3.gif)

 * 프레임 관리
   * 1:1문의 게시판, 포인트 샵에 있는 선택메뉴를 관리합니다.
    
   ![admin_frame](https://user-images.githubusercontent.com/75401960/102995790-203fd600-4565-11eb-9e77-8b8ff1bf0866.gif)

 * 이벤트 관리
   * 이벤트 등록 및 삭제가 가능합니다.
   * 이벤트 기간이 종료되면 자동으로 종료된 이벤트로 이동합니다.
    
   ![admin_event](https://user-images.githubusercontent.com/75401960/102996616-c0e2c580-4566-11eb-9028-67217338920a.gif)

 * 공지사항 관리
   * 공지사항 등록 및 삭제가 가능합니다.
    
   ![admin_notice](https://user-images.githubusercontent.com/75401960/102997069-8ded0180-4567-11eb-96df-b53e87f8a857.gif)

 * 1:1문의 관리
   * 유저의 질문에 답변 및 삭제가 가능합니다.
    
   ![admin_qna](https://user-images.githubusercontent.com/75401960/102997311-21263700-4568-11eb-9f1b-67640e8c46bb.gif)

 * 포인트 샵 관리
   * 포인트샵에 올라갈 물품들을 등록 및 삭제가 가능합니다.
   
  ![admin_shop](https://user-images.githubusercontent.com/75401960/102997827-4b2c2900-4569-11eb-9eef-33282fb75f5c.gif)

 * 메인페이지 이미지 관리
   * 추천여행지 이미지를 변경할 수 있습니다.
   
![admin_main](https://user-images.githubusercontent.com/75401960/102998082-cab9f800-4569-11eb-9ed8-3d9f3031bd5a.gif)

-------------------------
 ### 프로젝트를 완성시키고 느낀점
> 프로젝트를 진행하면 진행할수록 많이 부족한 것을 느꼈습니다.

> 특히 api와 ajax를 사용하는 것이 학원에서 따로 배우지않아 가장 어려웠습니다.

> 앞으로 더더욱 공부를 열심히 해야겠다고 생각하게 됐습니다.

> 그리고 이 사이트 하나를 내가 만들었다는 생각에 많이 뿌듯했습니다.
