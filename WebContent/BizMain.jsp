<%@page import="jaba.store.vo.StoreVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
   String ctxPath = request.getContextPath();
%>
<!-- board INPUT을 위함 -->
<%
	String bno = (request.getParameter("bno")!=null) ? request.getParameter("bno") : "0";
	String bref = (request.getParameter("bref")!=null) ? request.getParameter("bref") : "0";
	String bre_step = (request.getParameter("bre_step")!=null) ? request.getParameter("bre_step") : "0";
	String bre_level = (request.getParameter("bre_level")!=null) ? request.getParameter("bre_level") : "0";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biz Partner Main</title>
    <!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- RESET -->
<link href="<%=ctxPath%>/css/html5_reset.css" rel="stylesheet">
<!-- HEADER CSS -->
<link href="<%=ctxPath%>/css/header.css" rel="stylesheet">
<!-- SECTION CSS -->
<link href="<%=ctxPath%>/css/section.css" rel="stylesheet">
<!-- FOOTER CSS -->
<link href="<%=ctxPath%>/css/footer.css" rel="stylesheet">
<!-- 폰트 CSS -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter&display=swap"
	rel="stylesheet">
<!-- 체크박스 라디오버튼 CSS -->
<link href="<%=ctxPath%>/css/icheck-material.css" rel="stylesheet"
	type="text/css">

    <!-- switchery-->
    <link rel="stylesheet" href="<%=ctxPath%>/dist/switchery.css" />
    <script src="<%=ctxPath%>/dist/switchery.js"></script>
    <!-- 폰트부분 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet">
    <!-- 아이콘 폰트-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src='https://code.jquery.com/jquery-3.4.0.js'></script>

    <style>
    


        body {
            margin: 0;
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
            padding: 32px 32px 16px 32px;
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
           
            display: flex;
            flex-direction: column;
            border-top: 3px solid #89BDBB;
   			border-bottom: 3px solid #89BDBB;
   			height: 250px;
   			overflow:auto;
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

        #notice-table-container #notice-table-body .notice-table-th .th-text-wrap {
            display: flex;
            flex: 9;
            text-align: center;
            height: 30px;
           
        }

        #notice-table-container #notice-table-body .notice-table-tr .th-text-wrap {
            display: flex;
            flex: 9;
            text-align: center;
        }

        /* no. content. date. 헤더부분 */
        #notice-table-container #notice-table-body .notice-table-th .th-text-wrap .th-no {
           	
            flex: 1;
        }

        #notice-table-container #notice-table-body .notice-table-th .th-text-wrap .th-content {
           
            flex: 10;

        }

        #notice-table-container #notice-table-body .notice-table-th .th-text-wrap .th-date {
           
            flex: 5;

        }

        /* 삭제버튼 위치 text-wrap 과 th-btn의 위치는 9:1*/
        #notice-table-container #notice-table-body .notice-table-th .th-btn {
            flex: 1;

        }

        #notice-table-container #notice-table-body .notice-table-tr .th-btn {
            flex: 1;

        }

        #notice-table-container #notice-table-body .notice-table-tr .th-text-wrap .td-no {
            border: solid;
   border-top-width: 1px;
   border-bottom-width: 0px;
   border-left-width: 0px;
   border-right-width: 0px;
   border-color:rgba(20, 23, 26, .08);
   flex: 1;
   /* border: 1px solid rgba(20, 23, 26, .08); */
        }

        #notice-table-container #notice-table-body .notice-table-tr .th-text-wrap .td-content {
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
            flex: 10;
        }

        #notice-table-container #notice-table-body .notice-table-tr .th-text-wrap .td-content span {
            width: 100%;
            /* 단어가 길어지게 되면 자동으로 줄바꿈을 해주기 위해서  */
            word-break: break-all;
        }


        #notice-table-container #notice-table-body .notice-table-tr .th-text-wrap .td-date {
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
   margin-top: 15px;
        }

        #insert-inputbox #inputtextinput {
            background-color: white;
            flex: 10;
            display: flex;
            justify-content: center;
        }

        #insert-inputbox #inputtextinput form, table {
            width: 92%;
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
        
        .bossFinalNotice {
		border: 5px solid #89BDBB;
		text-align: center;
	margin-top: 10px;
	font-size: 130%;

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
            height: 700px;
            overflow: auto;
        }

        .category h2 {
            border-bottom: 1px solid rgb(225, 229, 235);
            padding: 15px 0;
            font-size: 1.4rem;
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
	cursor: pointer;
	/* 반응형 추가필요 */
}

.product_card:hover {
	border: 1px solid rgba(132, 146, 166, .3) !important;
}


        .product_card_detail {
            padding: 15px 25px 15px 15px;
            max-height: 145px;
            max-width: calc(100% - 145px);
            flex-direction: column;
            justify-content: space-between;
            display: inline-flex;
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
            /* 테두리 클릭시 없애기 */
        }

        .product_name .sold_out_btn:hover {
            background-color: rgb(235, 235, 235);
            border: 1px solid rgb(214, 217, 221);
            color: black;
        }

        .product_name>p {
            margin: 0;
            font-size: 0.875rem;
            font-weight: 500;
            /* 반응형 추가필요
    */
        }

        .product_desc {
            color: grey;
            font-size: 0.75rem;
            line-height: 1.05rem;
            max-height: 2.1rem;
            margin-bottom: 8px;
            overflow: hidden;
            position: relative;
            margin-right: -1em;
            /* 반응형 추가필요 */

        }

        .product_price {
            font-size: 0.875rem;
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
               <img src="<%=ctxPath%>/images/jaba_english_white.png">
            </div>
            <!-- .logo 부분 display: inline-flex로 수정하고 header_biz도 inline block 으로 -->
            <div id="header_biz">
                
            </div>
        </div>
    </header>

    <!-- NAVIGATOR 버튼부분 -->
    <nav>
        <div class="biz_container" id="container_nav">
            <div id="bizBtnWrap">
                <button class="nav_btn"><span>주문조회</span></button>
                <button class="nav_btn" data-toggle="modal" data-target="#exampleModal"><span>공지사항</span></button>
                <button class="nav_btn"><span>판매액조회</span></button>
            </div>
            <div id="openBtnWrap">
                <span id="openSwitch">
                    <!-- 오픈 스위치 -->
                    <input type="checkbox" class="js-switch" id="store_open_switch" checked />
                </span>
            </div>

        </div>
    </nav>

    <%
    	StoreVO storeVo = (StoreVO)session.getAttribute("storeVo");
    	String storeName = storeVo.getStore_name();
    	// jstl로 수정
    %>
    <!-- SECTION1 Store_info -->
   <!-- SECTION1 Store_info -->
   <section id="store_info">
      <c:if test="${not empty storeVo }">
         <div class="container" id="container_store_info">
            <!--매장 이름-->
            <h1>${storeVo.store_name}&nbsp;&nbsp;<a href="#"><i class="fa fa-pencil menu_update_icon" style="font-size: 20px;"></i></a></h1>
            <span id="store_description"> <!-- 매장 설명-->
               ${storeVo.store_description}
            </span> <span> <!-- 최근 게시판부분-->
             <c:if test="${not empty dboardList}">
                	<c:forEach items="${dboardList }" var="bvo" varStatus="s">
                		<div class="bossFinalNotice">${bvo.bcontent }</div>
                	</c:forEach>
                </c:if>
            </span>
         </div>
      </c:if>
   </section>
    <!-- SECTION2 menu_info -->
	<section id="menu_info">
		<div class="container" id="container_menu_info">
			<c:if test="${not empty sortList }">
				<c:forEach items="${sortList}" var="sortList" varStatus="s">
					<div class="category">
						<div class="category_name">
							<h2>${sortList[0].menu_category}</h2>
						</div>
						<div class="category_products">
							<c:if test="${not empty sortList}">
								<c:forEach items="${sortList}" var="menuVo" varStatus="s">
									<div class="product_card" onclick="clickProductCard(this);">
										<div class="product_card_detail">
											<div class="product_name">
												<p>
													<span>${menuVo.menu_name}</span>&nbsp;&nbsp;
													<button class="sold_out_btn">Sold out</button>
												</p>
											</div>
											<div class="product_desc">${menuVo.menu_description}</div>
											<div class="product_price">
												<p>${menuVo.menu_price}원</p>
											</div>
										</div>
										<div class="product_card_image">
											<img
												src="<%=ctxPath%>${menuVo.menu_img}"
												alt="Affogato">
										</div>
									</div>
								</c:forEach>
							</c:if>
						</div>
						<!--category 끝 -->
					</div>
				</c:forEach>
			</c:if>
		</div>
	</section>
                
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
                                 <c:if test="${not empty dboardAllList}">
          <c:forEach items="${dboardAllList}" var="vo" varStatus="s"> 
                              <div id="table-tr-wrap">
                                 <!-- 테이블 tr 부분 데이터 갯수만큼 출력 -->
                                 <div class="notice-table-tr">
                                    <div class="th-text-wrap">
                                       <div class="td-no">
                                          <span>${vo.bno }</span>
                                       </div>
                                       <div class="td-content">
                                          <span>${vo.bcontent }</span>
                                       </div>
                                       <div class="td-date">
                                          <span>${vo.bdate }</span>
                                       </div>
                                    </div>
                                    <div class="th-btn">
                                       <button class="rowDeleteBtn" onclick="deleteRow(this);">
                                          <span>✖</span>
                                       </button>
                                    </div>
                                 </div>
                                 </div>
                                 </c:forEach>
                                 </c:if>
                                 
                           <!-- notice-table-container-->
                        </div>
                        <!-- notice table list & btn -->
                       
                        <div id="insert-inputbox">
                           <div id="inputtextinput">
                               <form enctype="multipart/form-data"	method="post" action="<%=request.getContextPath()%>/boardInsert.lo"	onsubmit="return writefrm_submit();">
<c:if test="${not empty storeVo }">
		<table border="1">
			<tr style="display: none">
				<td><input type="text" name="bno" value="<%=bno%>">   <!-- 0은 새글, 그외 댓글인 경우는 읽고 있던 글의 bno를 넣어주기로 함. -->
		<input type="text" name="bref" value="<%=bref%>">
		<input type="text" name="bre_step" value="<%=bre_step%>">
		<input type="text" name="bre_level" value="<%=bre_level%>">
		<input type="text" name="bsubject" value="<%=bno %>">
		<input type="text" name="bwriter" value="${storeVo.store_name}">
		</td>
			</tr>
			<tr>
				<td><input type="text" name ="bcontent" id="bcontent" style="padding: 5px;" placeholder="내용을 입력해주세요."></td>
			
			
				<td colspan="1">
					<input type="submit" id="btn-add-row" value="추가">
				</td>
			</tr>
		</table>
		</c:if>


	</form>
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
    <!-- FOOTER -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="footer_logo">
					<img src="<%=ctxPath%>/images/jaba_english_white.png">
				</div>
				<div class="footer_links">
					<ul>
						<li class="links_head">JABA for YOUNG&RICH</li>
						<li>WHY JABA?</li>
						<li>PRICING</li>
						<li><a href='#'>PARTNER LOGIN</a></li>
					</ul>
					<ul>
						<li class="links_head">TOP CITIES</li>
						<li>JONGRO</li>
						<li>SEOCHON</li>
						<li>PARIS</li>
					</ul>
					<ul>
						<li class="links_head">SUPPORT</li>
						<li>CUSTOMER HELP</li>
						<li>PARTNER HELP</li>
						<li>SUGGEST STH</li>
					</ul>
					<ul>
						<li class="links_head">COMPANY</li>
						<li>CUSTOMER HELP</li>
						<li>PARTNER HELP</li>
						<li>SUGGEST STH</li>
					</ul>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="footer__disclaimer">
					<strong>JABA connects customers with popular cafe brands.</strong>
					<p>We believe that time is precious. We strive to create
						beautiful technology that helps you save time and make ordering
						easy, both sides of the counter. Order from JABA with the best
						selection of local cafes.</p>
					<div class="legal">
						<div>
							<div class="legal__copyright">© 2020 JABA Technologies Pty
								Ltd</div>
							<ul class="legal__links">
								<li><a
									class="MuiTypography-root MuiLink-root MuiLink-underlineNone MuiTypography-colorPrimary"
									href="/legal/privacy-policy">Privacy Policy</a></li>
								<li><a
									class="MuiTypography-root MuiLink-root MuiLink-underlineNone MuiTypography-colorPrimary"
									href="/legal/terms-and-conditions">Terms of Use</a></li>
								<li><a
									class="MuiTypography-root MuiLink-root MuiLink-underlineNone MuiTypography-colorPrimary"
									href="https://help.bopple.com/" target="_blank"
									rel="noopener noreferrer">Help Centre</a></li>
								<li><a
									class="MuiTypography-root MuiLink-root MuiLink-underlineNone MuiTypography-colorPrimary"
									href="https://customer-contact-help.bopple.com" target="_blank"
									rel="noopener noreferrer">Leave Feedback</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

	</footer>
    <!-- switchery -->
    <script>
        // switchery 
        var elem = document.querySelector('.js-switch');
        var init = new Switchery(elem);
    </script>
    <!-- 버튼 누르면 한 행 추가 삭제  -->
    <script>

        function getBoardId() {
            if ($('#notice-table-body > #table-tr-wrap .notice-table-tr:last > .th-text-wrap > .td-no > span').text() == '') {
                return 1;
                // 임시로 나중에 수정해야함. 현재 게시글번호는 string 인데 불러와야함 
            } else {
                return parseInt($('#notice-table-body > #table-tr-wrap .notice-table-tr:first > .th-text-wrap > .td-no > span').text()) + 1;
            }
        }

        $('#btn-add-row').click(function () {
            // 현재 날짜 구하기 
            var time = new Date().toLocaleTimeString();
            var date = new Date();
            var currDate = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate() + ' ' + date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds();
            var boardId = getBoardId();
            var boardContent = $('#boardContentInput').val();
            $('#notice-table-body #table-tr-wrap').prepend('<div class="notice-table-tr"><div class="th-text-wrap"><div class="td-no"><span>' + boardId + '</span></div><div class="td-content"><span>' + boardContent + '</span></div><div class="td-date"><span>' + currDate + '</span></div></div><div class="th-btn"><button class="rowDeleteBtn" onclick="deleteRow(this);"><span>x</span></button></div></div>');
            $('#boardContentInput').val('');
        });

        // 행삭제 
        function deleteRow(obj) {
            $(obj).parent().parent().remove();
        }
            // 스크립트 공격대비해야함 .
            
       
       
    </script>
    <!-- 게시판에 글 추가 -->
    <script type="text/javascript">
	function writefrm_submit(){
		//document.getElementById("bwriter");
		// 유효성 체크 부분 이부분에 넣어 줌
		// 유효성에 문제가 있으면 return false;
		// 유효성에 문제가 없다면 
		return true;
	}
</script>



</body>

</html>