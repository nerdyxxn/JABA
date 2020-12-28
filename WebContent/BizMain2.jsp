<%@page import="jaba.store.vo.StoreVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Biz Partner Main</title>
<!-- jquery -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 모달관련 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 리셋 css -->
<link rel="stylesheet" href="html5_reset.css">
<!-- switchery-->
<link rel="stylesheet" href="./dist/switchery.css" />
<script src="./dist/switchery.js"></script>
<!-- 폰트부분 -->
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter&display=swap"
   rel="stylesheet">
<!-- 아이콘 폰트-->
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
   width: 100%;
   height: 100%;
   padding-top: 55px;
   font-family: 'Noto Sans KR', sans-serif !important;
}

.biz_container {
   width: 80%;
   max-width: 1024px;
   transition: .2s ease-in-out;
   padding: 0 20px;
}

img {
   position: relative;
   display: inline-block;
}

/* div {
            display: block;
        } */

/* 모달 전체 세팅 */
.modal-dialog.modal-size {
   height: auto;
   margin: 0;
   padding: 0;
   min-width: 800px;
}

.modal-content.modal-size {
   height: auto;
   min-height: 100%;
   border-radius: 16px;
}

.modal {
   text-align: center;
}

@media screen and (min-width: 768px) {
   .modal:before {
      display: inline-block;
      vertical-align: middle;
      content: " ";
      height: 100%;
   }
}

.modal-dialog.modal-size {
   display: inline-block;
   text-align: left;
   vertical-align: middle;
}

/* 모달 header 세팅 */
.modal-header {
   padding: 32px;
   display: flex;
   width: 100%;
   flex-direction: column;
   justify-content: center;
   align-items: center;
   border-bottom: 1px solid rgba(20, 23, 26, .08);
   text-align: center;
}

.header-icon {
   display: inline-flex;
   padding: 16px;
   border-radius: 16px;
   margin-bottom: 16px;
}

.close {
   color: rgba(0, 0, 0, 0.54);
   position: absolute !important;
   top: 25px;
   right: 25px;
}

/* 모달 body 세팅 */
.modal-body {
   flex: 1 1 auto;
   padding: 32px 62px 2px 65px;
   overflow-y: auto;
   -webkit-overflow-scrolling: touch;
}

/* 모달 footer 세팅 */
.modal-footer {
   flex: 0 0 auto;
   display: flex;
   padding: 16px 32px 32px 32px;
   align-items: center;
   justify-content: center;
   border-top: 0;
}

.btnChk {
   width: 60px;
   height: 40px;
   background-color: #36727C;
   color: white;
   border-radius: 13px;
   border: 0;
   font-weight: bold;
   font-size: 12px;
   margin: 5px;
}

/* 모달 table 셋팅 */
#notice-table-container {
   display: flex;
   flex-direction: column;
   justify-content: center;
   font-size: 13px;
}

#notice-table-container #notice-table-body {
   background-color: transparent;
   display: flex;
   flex-direction: column;
   border-top: 3px solid #89BDBB;
   border-bottom: 3px solid #89BDBB;


}

#notice-table-container #notice-table-body .notice-table-th {
   display: flex;
   flex-direction: row;
   justify-content: space-between;
}

#notice-table-container #notice-table-body .notice-table-tr {
   display: flex;
   flex-direction: row;
   justify-content: space-between;
}

#notice-table-container #notice-table-body .notice-table-th .th-text-wrap
   {
   display: flex;
   flex: 9;
   text-align: center;
}

#notice-table-container #notice-table-body .notice-table-tr .th-text-wrap
   {
   display: flex;
   flex: 9;
   text-align: center;
}

/* no. content. date. 헤더부분 */
#notice-table-container #notice-table-body .notice-table-th .th-text-wrap .th-no
   {
   border: solid;
   border-top-width: 0px;
   border-bottom-width: 0px;
   border-left-width: 0px;
            border-right-width: 0px;
   flex: 1;
   /* border: 1px solid rgba(20, 23, 26, .08); */
   
}

#notice-table-container #notice-table-body .notice-table-th .th-text-wrap .th-content
   {
   border: solid;
   border-top-width: 0px;
   border-bottom-width: 0px;
   border-left-width: 0px;
   border-right-width: 0px;
   flex: 10;
   /* border: 1px solid rgba(20, 23, 26, .08); */
}

#notice-table-container #notice-table-body .notice-table-th .th-text-wrap .th-date
   {
   border: solid;
   border-top-width: 0px;
   border-bottom-width: 0px;
   border-left-width: 0px;
   border-right-width: 0px;
   flex: 5;
   /* border: 1px solid rgba(20, 23, 26, .08); */
}

/* 삭제버튼 위치 text-wrap 과 th-btn의 위치는 9:1*/
#notice-table-container #notice-table-body .notice-table-th .th-btn {
   flex: 1;
   background-color: white;
}

#notice-table-container #notice-table-body .notice-table-tr .th-btn {
   flex: 1;
   background-color: white;
}

#notice-table-container #notice-table-body .notice-table-tr .th-text-wrap .td-no
   {
   border: solid;
   border-top-width: 1px;
   border-bottom-width: 0px;
   border-left-width: 0px;
   border-right-width: 0px;
   border-color:rgba(20, 23, 26, .08);
   flex: 1;
   /* border: 1px solid rgba(20, 23, 26, .08); */
}

#notice-table-container #notice-table-body .notice-table-tr .th-text-wrap .td-content
   {
   border: solid;
   border-top-width: 1px;
   border-bottom-width: 0px;
   border-left-width: 0px;
   border-right-width: 0px;
   display: flex;
   flex-wrap: wrap;
   align-items: stretch;
   overflow: hidden;
   border-color:rgba(20, 23, 26, .08);
   flex: 10;
   /* border: 1px solid rgba(20, 23, 26, .08); */
}

#notice-table-container #notice-table-body .notice-table-tr .th-text-wrap .td-content span
   {
   width: 100%;
   /* 단어가 길어지게 되면 자동으로 줄바꿈을 해주기 위해서  */
   word-break: break-all;
}

#notice-table-container #notice-table-body .notice-table-tr .th-text-wrap .td-date
   {
   border: solid;
   border-top-width: 1px;
   border-bottom-width: 0px;
   border-left-width: 0px;
   border-right-width: 0px;
   border-color:rgba(20, 23, 26, .08);
   flex: 3;
   /* border: 1px solid rgba(20, 23, 26, .08); */
}

/* 행삭제 버튼 관련 */
/* .th-btn {
   display: flex;
   justify-content: center;
   background-color: #89BDBB;
   color: white;
   border-radius: 12px;
   border: 0;
   width: 60px;
   height: 30px;
}
 */
 
#btn-add-row ,.rowDeleteBtn {
   background-color: #89BDBB;
   color: white;
   border-radius: 12px;
   border: 0;
   width: 50px;
   height: 30px;
   margin: 2px;
}

.rowDeleteBtn{
   background-color: white;
   color: #89BDBB;
}

#notice-table-list {
   display: flex;
   justify-content: center;
   height: 50px;
   margin: 10px;
}

#insert-inputbox {
   /* background-color: rgb(249, 250, 252); */
   display: flex;
   flex-direction: row;
   align-items: flex-end;
   margin-left: 90px;
}

#insert-inputbox #inputtextinput {
   background-color: white;
   flex: 10;
   display: flex;
   justify-content: center;
}

#insert-inputbox #inputtextinput input {
   width: 92%;
}

#insertBtn {
   background-color: white;
   flex: 3;
}

#header_biz {
   color: aliceblue;
}

header {
   display: flex;
   top: 0;
   left: 0;
   justify-content: center;
   height: 55px;
   position: fixed;
   width: 100%;
   max-width: 100vw;
   z-index: 1299;
   background-color: #36727C;
   box-shadow: none;
   border-bottom: 1px solid transparent;
}

/* 기본적으로 따라가지만 추가로 설정이 필요할 경우에 id값을 줘서 설정한다. */
#container_header {
   display: flex;
}

.logo {
   padding: 10px 0;
}

nav {
   display: flex;
   justify-content: center;
   /*
    display와 justify 를 주면 가운데로 온다.
    padding-top: 55px;
    body 부분에서 padding-top을 줬음
    */
   /* 아래 내용이 스크롤을 해도 따라가야할 것 같아서 padding-top을 줬다. */
   height: 55px;
   width: 100%;
   max-width: 100vw;
   /* 영역 한눈에 구별하기 위해서 
    background-color: darkgoldenrod;
    */
   /*
    z-index: 1299;
    */
}

#container_nav {
   display: flex;
   justify-content: center;
   /* 하위 아이템들 가로축 가운데정렬 */
   align-items: center;
   /* 하위 아이템들 세로축 가운데정렬 */
   border-bottom: 1px solid rgb(225, 229, 235);
}

#container_nav #bizBtnWrap .nav_btn {
   background-color: white;
   border: 1px solid rgb(230, 233, 237);
   color: black;
   padding: 10px 20px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   margin: 4px 2px;
   cursor: pointer;
   border-radius: 30px;
   outline: 0;
   /* 테두리 클릭시 없애기 */
}

#container_nav #bizBtnWrap .nav_btn:hover {
   background-color: rgb(235, 235, 235);
   border: 1px solid rgb(214, 217, 221);
}

#openBtnWrap {
   display: flex;
   justify-content: flex-end;
   /* 오픈버튼 오른쪽 끝에 붙이기 float:right 와 같은 역할 */
   flex: 1;
   /* 남은부분 다 채워줌 */
}

/* float와 clear : both 로 처리했지만 flex로 해결하기
#openBtn {
    float: right;
}
nav::after {
     자식이 float를 사용했으므로 이를 해제해주기 위해서 가상요소를 사용한다. 
    clear: both;
    
}
*/
#store_info {
   display: flex;
   justify-content: center;
   /*
    display와 justify 를 주면 가운데로 온다.
    padding-top: 55px;
    body 부분에서 padding-top을 줬음
    */
   /* 아래 내용이 스크롤을 해도 따라가야할 것 같아서 padding-top을 줬다. */
   width: 100%;
   max-width: 100vw;
   /*
    background-color: rgb(150, 243, 28);
    */

   /* 영역 한눈에 구별하기 위해서 */
   /*
    z-index: 1299;
    */
}

#container_store_info {
   background-color: rgb(249, 250, 252);
}

#container_store_info .h11 {
   /* 가게이름 */
   font-size: 2.5rem;
   line-height: 2.5rem;
   margin-top: 1.5rem;
   color: #36727C;
   font-weight: bold;
}

#container_store_info #store_description {
   color: #8492a6;
}

/* 메뉴수정아이콘 스타일지정 */
.menu_update_icon {
   color: #36727C;
}

.menu_update_icon:active {
   color: black;
}

#menu_info {
   display: flex;
   justify-content: center;
   width: 100%;
   max-width: 100vw;
   /*
background-color: rgba(219, 242, 255, 0.952);
*/
}

#container_menu_info {
   background-color: rgb(249, 250, 252);
}

.category h2 {
   border-bottom: 1px solid rgb(225, 229, 235);
   padding: 15px 0;
   font-size: 14px;
   font-weight: 700;
   margin: 0;
}

.category_products {
   display: grid;
   grid-column-gap: 30px;
   grid-row-gap: 30px;
   grid-template-rows: auto;
   grid-template-columns: repeat(2, 1fr);
   min-height: 0;
   /* NEW */
   min-width: 0;
   /* NEW; needed for Firefox */
   margin: 20px 0px 0px;
   /* 창줄였을때 안삐져나가게 */
   overflow: hidden;
}

.product_card {
   position: relative;
   display: flex;
   border: 1px solid white;
   flex-direction: row;
   justify-content: space-between;
   overflow: hidden;
   background-color: white;
   max-height: 145px;
   min-width: 345px;
   pointer: cursor;
   /* 반응형 추가필요 */
}

.product_card_detail {
   padding: 15px 25px 15px 15px;
   max-height: 145px;
   max-width: calc(100% - 145px);
   flex-direction: column;
   justify-content: space-between;
   display: inline-flex;
   font-size: 13px;
   /* 반응형 추가필요*/
}

.product_name {
   margin-bottom: 2px;
   min-width: 160px;
   display: flex;
   overflow: hidden;
}

.product_name .sold_out_btn {
   background-color: #36727C;
   border: 1px solid rgb(230, 233, 237);
   color: white;
   padding: 2px 10px 2px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   margin: 4px 2px;
   cursor: pointer;
   border-radius: 30px;
   outline: 0;
   font-weight: normal;
   /* 테두리 클릭시 없애기 */
}

.product_name .sold_out_btn:hover {
   background-color: #89BDBB;
   border: 1px solid #89BDBB;
   color: white;
}

.product_name>p {
   margin: 0;
   font-size: 13px;
   font-weight: 500;
   font-weight: bold;
   
   /* 반응형 추가필요
    */
}
/* 
.menu_title {
   font-weight: bold;
}
 */

.product_desc {
   color: grey;
   font-size: 13px;
   /* line-height: 1.05rem; */
   max-height: 2.1rem;
   margin-bottom: 8px;
   overflow: hidden;
   position: relative;
   /* margin-right: -1em; */
   /* 반응형 추가필요 */
}

.product_price {
   font-size: 13px;
   font-weight: 500;
   display: flex;
   align-items: center;
   color: #36727C;
}

.product_card_image {
   /* 기본 백그라운드에 대한 처리 모바일 120*/
   height: 145px;
   width: 145px;
   min-width: 145px;
   min-height: 145px;
}

.product_card_image img {
   width: 145px;
   height: 145px;
   object-fit: contain;
   object-position: center;
   /* 트랜지션 처리*/
}

.signin-input {
   width: 100%;
   height: 40px;
   border-style: inset;
   border-color: -internal-light-dark(rgb(118, 118, 118),
      rgb(133, 133, 133));
   color: #14171a;
   font-size: 1rem;
   border-radius: 6px;
}
</style>

</head>

<body>
   <!-- HEADER -->
   <header>
      <div class="biz_container" id="container_header">
         <div class="logo">
            <img src="./images/jaba_92x32.png">
         </div>
         <!-- .logo 부분 display: inline-flex로 수정하고 header_biz도 inline block 으로 -->
         <div id="header_biz"></div>
      </div>
   </header>

   <!-- NAVIGATOR 버튼부분 -->
   <nav>
      <div class="biz_container" id="container_nav">
         <div id="bizBtnWrap">
            <button class="nav_btn">
               <span>주문조회</span>
            </button>
            <button class="nav_btn" data-toggle="modal"
               data-target="#exampleModal">
               <span>공지사항</span>
            </button>
            <button class="nav_btn">
               <span>판매액조회</span>
            </button>
         </div>
         <div id="openBtnWrap">
            <span id="openSwitch"> <!-- 오픈 스위치 --> <input type="checkbox"
               class="js-switch" id="store_open_switch" checked />
            </span>
         </div>

      </div>
   </nav>

   <%
      StoreVO storeVo = (StoreVO) session.getAttribute("storeVo");
   String storeName = storeVo.getStore_name();
   // jstl로 수정
   %>
   <!-- SECTION1 Store_info -->
   <section id="store_info">
      <div class="biz_container" id="container_store_info">
         <h1 class="h11">
            <!--매장 이름-->
            <%=storeName%>&nbsp; <a href="#"><i
               class="fa fa-pencil menu_update_icon" style="font-size: 28px;"></i></a>
         </h1>
         <span id="store_description"> <!-- 매장 설명--> 스타벅스 종각점입니다. 미역 판매합니다.
         </span> <span> <!-- 최근 게시판부분-->
            <h4>재고 소진으로 인해 금일 영업은 20시까지만 합니다.</h4>
         </span>
      </div>
   </section>
   <!-- SECTION2 menu_info -->
   <section id="menu_info">
      <div class="biz_container" id="container_menu_info">
         <div class="category">
            <div class="category_name">
               <h2>메뉴 카테고리 : 커피</h2>
            </div>
            <div class="category_products">
               <div class="product_card">
                  <div class="product_card_detail">
                     <div class="product_name">
                        <p class="menu_title">
                           아메리카노&nbsp;&nbsp;
                           <button class="sold_out_btn">Sold out</button>
                        </p>
                     </div>
                     <div class="product_desc">아메리카노는 에스프레소 + 물</div>
                     <div class="product_price">
                        <p>4000원</p>
                     </div>
                  </div>
                  <div class="product_card_image">
                     <img src="https://cdn.boppl.me/products/specialty_affogato_0.jpg"
                        alt="Affogato">
                  </div>
               </div>
               <!-- product_card 반복 -->
               <div class="product_card">
                  <div class="product_card_detail">
                     <div class="product_name">
                        <p>
                           아메리카노&nbsp;&nbsp;
                           <button class="sold_out_btn">Sold out</button>
                        </p>
                     </div>
                     <div class="product_desc">아메리카노는 에스프레소 + 물미역</div>
                     <div class="product_price">
                        <p>4000원</p>
                     </div>
                  </div>
                  <div class="product_card_image">
                     <img src="https://cdn.boppl.me/products/specialty_affogato_0.jpg"
                        alt="Affogato">
                  </div>
               </div>
               <div class="product_card">
                  <div class="product_card_detail">
                     <div class="product_name">
                        <p>
                           아메리카노&nbsp;&nbsp;
                           <button class="sold_out_btn">Sold out</button>
                        </p>
                     </div>
                     <div class="product_desc">아메리카노는 에스프레소 + 미역</div>
                     <div class="product_price">
                        <p>4000원</p>
                     </div>
                  </div>
                  <div class="product_card_image">
                     <img src="https://cdn.boppl.me/products/specialty_affogato_0.jpg"
                        alt="Affogato">
                  </div>
               </div>
               <div class="product_card">
                  <div class="product_card_detail">
                     <div class="product_name">
                        <p>
                           아메리카노&nbsp;&nbsp;
                           <button class="sold_out_btn">Sold out</button>
                        </p>
                     </div>
                     <div class="product_desc">아메리카노는 에스프레소 + 물</div>
                     <div class="product_price">
                        <p>4000원</p>
                     </div>
                  </div>
                  <div class="product_card_image">
                     <img src="https://cdn.boppl.me/products/specialty_affogato_0.jpg"
                        alt="Affogato">
                  </div>
               </div>
               <div class="product_card">
                  <div class="product_card_detail">
                     <div class="product_name">
                        <p>
                           아메리카노&nbsp;&nbsp;
                           <button class="sold_out_btn">Sold out</button>
                        </p>
                     </div>
                     <div class="product_desc">아메리카노는 에스프레소 + 물</div>
                     <div class="product_price">
                        <p>4000원</p>
                     </div>
                  </div>
                  <div class="product_card_image">
                     <img src="https://cdn.boppl.me/products/specialty_affogato_0.jpg"
                        alt="Affogato">
                  </div>
               </div>
               <div class="product_card">
                  <div class="product_card_detail">
                     <div class="product_name">
                        <p>
                           아메리카노&nbsp;&nbsp;
                           <button class="sold_out_btn">Sold out</button>
                        </p>
                     </div>
                     <div class="product_desc">아메리카노는 에스프레소 + 물</div>
                     <div class="product_price">
                        <p>4000원</p>
                     </div>
                  </div>
                  <div class="product_card_image">
                     <img src="https://cdn.boppl.me/products/specialty_affogato_0.jpg"
                        alt="Affogato">
                  </div>
               </div>
               <div class="product_card">
                  <div class="product_card_detail">
                     <div class="product_name">
                        <p>
                           아메리카노&nbsp;&nbsp;
                           <button class="sold_out_btn">Sold out</button>
                        </p>
                     </div>
                     <div class="product_desc">아메리카노는 에스프레소 + 물</div>
                     <div class="product_price">
                        <p>4000원</p>
                     </div>
                  </div>
                  <div class="product_card_image">
                     <img src="https://cdn.boppl.me/products/specialty_affogato_0.jpg"
                        alt="Affogato">
                  </div>
               </div>
               <div class="product_card">
                  <div class="product_card_detail">
                     <div class="product_name">
                        <p>
                           아메리카노&nbsp;&nbsp;
                           <button class="sold_out_btn">Sold out</button>
                        </p>
                     </div>
                     <div class="product_desc">아메리카노는 에스프레소 + 물</div>
                     <div class="product_price">
                        <p>4000원</p>
                     </div>
                  </div>
                  <div class="product_card_image">
                     <img src="https://cdn.boppl.me/products/specialty_affogato_0.jpg"
                        alt="Affogato">
                  </div>
               </div>
               <div class="product_card">
                  <div class="product_card_detail">
                     <div class="product_name">
                        <p>
                           아메리카노&nbsp;&nbsp;
                           <button class="sold_out_btn">Sold out</button>
                        </p>
                     </div>
                     <div class="product_desc">아메리카노는 에스프레소 + 물</div>
                     <div class="product_price">
                        <p>4000원</p>
                     </div>
                  </div>
                  <div class="product_card_image">
                     <img src="https://cdn.boppl.me/products/specialty_affogato_0.jpg"
                        alt="Affogato">
                  </div>
               </div>
               <div class="product_card">
                  <div class="product_card_detail">
                     <div class="product_name">
                        <p>
                           아메리카노&nbsp;&nbsp;
                           <button class="sold_out_btn">Sold out</button>
                        </p>
                     </div>
                     <div class="product_desc">아메리카노는 에스프레소 + 물</div>
                     <div class="product_price">
                        <p>4000원</p>
                     </div>
                  </div>
                  <div class="product_card_image">
                     <img src="https://cdn.boppl.me/products/specialty_affogato_0.jpg"
                        alt="Affogato">
                  </div>
               </div>
               <div class="product_card">
                  <div class="product_card_detail">
                     <div class="product_name">
                        <p>
                           아메리카노&nbsp;&nbsp;
                           <button class="sold_out_btn">Sold out</button>
                        </p>
                     </div>
                     <div class="product_desc">아메리카노는 에스프레소 + 물</div>
                     <div class="product_price">
                        <p>4000원</p>
                     </div>
                  </div>
                  <div class="product_card_image">
                     <img src="https://cdn.boppl.me/products/specialty_affogato_0.jpg"
                        alt="Affogato">
                  </div>
               </div>

               <!--category 끝 -->
            </div>
            <!-- footer -->
            <footer></footer>
            <!-- modal -->
            <!-- Modal Basic -->
            <div class="modal fade" id="exampleModal" tabindex="-1"
               role="dialog" aria-labelledby="exampleModalLabel"
               aria-hidden="true">
               <div class="modal-dialog modal-size" role="document">
                  <div class="modal-content modal-size">

                     <!-- modal-header -->
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                           aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                        </button>
                        <div class="header-title"
                           style="font-weight: bold; font-size: 20px;">
                           <p>NOTICE</p>
                        </div>
                     </div>

                     <!-- modal-body -->
                     <div class="modal-body">
                        <div id="notice-table-container">
                           <div id="notice-table-body">
                              <!-- 테이블 th 부분 -->
                              <div class="notice-table-th">
                                 <div class="th-text-wrap">
                                    <div class="th-no">
                                       <span>NO.</span>
                                    </div>
                                    <div class="th-content">
                                       <span>CONTENT</span>
                                    </div>
                                    <div class="th-date">
                                       <span>DATE</span>
                                    </div>
                                 </div>

                                 <!-- 삭제버튼크기만큼 위치를 잡아줌 -->
                                 <div class="th-btn"></div>
                              </div>
                              <div id="table-tr-wrap">
                                 <!-- 테이블 tr 부분 데이터 갯수만큼 출력 -->
                                 <div class="notice-table-tr">
                                    <div class="th-text-wrap">
                                       <div class="td-no">
                                          <span>6</span>
                                       </div>
                                       <div class="td-content">
                                          <span>재고 소진으로 인해 금일 영업은 20시까지 합니다.qqqq</span>
                                       </div>
                                       <div class="td-date">
                                          <span>2020-10-13</span>
                                       </div>
                                    </div>
                                    <div class="th-btn">
                                       <button class="rowDeleteBtn" onclick="deleteRow(this);">
                                          <span>✖</span>
                                       </button>
                                    </div>
                                 </div>
                                 <div class="notice-table-tr">
                                    <div class="th-text-wrap">
                                       <div class="td-no">
                                          <span>6</span>
                                       </div>
                                       <div class="td-content">
                                          <span>재고 소진으로 인해 금일 영업은 20시까지 합니다. 글이 길어지면 이렇게 길어집니다. 덥고 춥고 졸리고 배고프고 그러네요. 안녕하세요 김배고픔입니다. 점심시간이 얼마 남지 않았어요.</span>
                                       </div>
                                       <div class="td-date">
                                          <span>2020-10-13</span>
                                       </div>
                                    </div>
                                    <div class="th-btn">
                                       <button class="rowDeleteBtn" onclick="deleteRow(this);">
                                          <span>✖</span>
                                       </button>
                                    </div>
                                 </div>
                                 <div class="notice-table-tr">
                                    <div class="th-text-wrap">
                                       <div class="td-no">
                                          <span>6</span>
                                       </div>
                                       <div class="td-content">
                                          <span>재고 소진으로 인해 금일 영업은 20시까지 합니다.</span>
                                       </div>
                                       <div class="td-date">
                                          <span>2020-10-13</span>
                                       </div>
                                    </div>
                                    <div class="th-btn">
                                       <button class="rowDeleteBtn" onclick="deleteRow(this);">
                                          <span>✖</span>
                                       </button>
                                    </div>
                                 </div>
                                 <div class="notice-table-tr">
                                    <div class="th-text-wrap">
                                       <div class="td-no">
                                          <span>6</span>
                                       </div>
                                       <div class="td-content">
                                          <span>재고 소진으로 인해 금일 영업은 20시까지 합니다.</span>
                                       </div>
                                       <div class="td-date">
                                          <span>2020-10-13</span>
                                       </div>
                                    </div>
                                    <div class="th-btn">
                                       <button class="rowDeleteBtn" onclick="deleteRow(this);">
                                          <span>✖</span>
                                       </button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <!-- notice-table-container-->
                        </div>
                        <!-- notice table list & btn -->
                        <div id="notice-table-list">
                           <button
                              style="margin: 7px; background-color: #89BDBB; color: white; border-radius: 15px; border: 0; width: 40px; height: 40px;">◀</button>
                           <button
                              style="margin: 7px; background-color: #89BDBB; color: white; border-radius: 15px; border: 0; width: 40px; height: 40px;">▶</button>
                        </div>
                        <div id="insert-inputbox">
                           <div id="inputtextinput">
                              <input type="text" id="boardTitleInput" style="padding: 5px;"
                                 placeholder="내용을 입력해주세요.">
                           </div>
                           <div id="insertBtn">
                              <button id="btn-add-row">추가</button>
                           </div>
                        </div>
                        <!-- modal-footer -->
                        <div class="modal-footer">
                           <br>
                           <button type="button" class="btnChk" id="signin_modify" name="signin_modify">수정</button>
                           <button type="button" class="btnChk" id="signin_cancel" name="signin_cancel">취소</button>
                        </div>
                        <!-- modal body 끝 -->
                     </div>
                  </div>
               </div>
            </div>

         </div>
      </div>
   </section>
   <!-- switchery -->
   <script>
      // switchery 
      var elem = document.querySelector('.js-switch');
      var init = new Switchery(elem);
   </script>
   <!-- 버튼 누르면 한 행 추가 삭제  -->
   <script>
      function getBoardId() {
         if ($(
               '#notice-table-body > #table-tr-wrap .notice-table-tr:last > .th-text-wrap > .td-no > span')
               .text() == '') {
            return 1;
            // 임시로 나중에 수정해야함. 현재 게시글번호는 string 인데 불러와야함 
         } else {
            return parseInt($(
                  '#notice-table-body > #table-tr-wrap .notice-table-tr:first > .th-text-wrap > .td-no > span')
                  .text()) + 1;
         }
      }

      $('#btn-add-row')
            .click(
                  function() {
                     // 현재 날짜 구하기 
                     var time = new Date().toLocaleTimeString();
                     var date = new Date();
                     var currDate = date.getFullYear() + '-'
                           + (date.getMonth() + 1) + '-'
                           + date.getDate() + ' ' + date.getHours()
                           + ':' + date.getMinutes() + ':'
                           + date.getSeconds();
                     var boardId = getBoardId();
                     var boardContent = $('#boardTitleInput').val();
                     $('#notice-table-body #table-tr-wrap')
                           .prepend(
                                 '<div class="notice-table-tr"><div class="th-text-wrap"><div class="td-no"><span>'
                                       + boardId
                                       + '</span></div><div class="td-content"><span>'
                                       + boardContent
                                       + '</span></div><div class="td-date"><span>'
                                       + currDate
                                       + '</span></div></div><div class="th-btn"><button class="rowDeleteBtn" onclick="deleteRow(this);"><span>✖</span></button></div></div>');
                     $('#boardTitleInput').val('');
                  });

      // 행삭제 
      function deleteRow(obj) {
         $(obj).parent().parent().remove();
      }
      // 스크립트 공격대비해야함 .
   </script>
</body>

</html>