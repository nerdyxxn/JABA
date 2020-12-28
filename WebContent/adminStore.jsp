<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%!SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
int pageSize = 3; //  한 페이지당글수
int pageBlock = 3; // 한 화면에 나타날 페이지 링크 수
%>
<%
int bCount = (int)request.getAttribute("bCount");
int currentPage = (int)request.getAttribute("currentPage");
int startPage = (int)request.getAttribute("startPage");
int endPage = (int)request.getAttribute("endPage");
%>
<%
   String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JABA admin</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,minimal-ui" />
<!-- <link rel="stylesheet" type="text/css" href="mainStyle.css" /> -->
<script src='https://code.jquery.com/jquery-3.4.0.js'></script>
<!-- MODAL -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter&display=swap"
	rel="stylesheet">
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

<style type="text/css"></style>


<script>
	$(function() {
		$(window).scroll(function() {
			var navbar = $(this).scrollTop();
			var $header = $('header');
			if (navbar > 0) {
				$header.addClass('activated');
			} else {
				$header.removeClass('activated');
			}
		})
		$(window).ready(function(){
			$.ajax({
				url:"admin/selectAllStore.do",
				success: function(res1){
					console.log(res1);
					
					
				}
			})
		})
	})
</script>
<script>
	var giMenuDuration = 700;

	// 전체 메뉴를 오른쪽으로 슬라이드하여서 보여준다.
	function ShowMenu() {
		$('.menu_bg').css({
			'display' : 'block'
		});
		$('.menu_bar').css({
			'left' : '-100%'
		});
		$('.menu_bar').animate({
			left : '0px'
		}, {
			duration : giMenuDuration
		});
	}

	// 전체 메뉴를 왼쪽으로 슬라이드하여서 닫는다.
	function HideMenu() {
		$('.menu_bar').animate({
			left : '-100%'
		}, {
			duration : giMenuDuration,
			complete : function() {
				$('.menu_bg').css({
					'display' : 'none'
				});
			}
		});
	}

	// 확장 메뉴를 보여주거나 닫는다.
	function ShowSubMenu(strId) {
		var lySubMenu = $(strId);

		if (lySubMenu.first().is(":hidden")) {
			$(strId).slideDown(300);
		} else {
			$(strId).slideUp(300);
		}
	}

	$(document).ready(function() {
		$('.menu_2').hide();
	});
	//메뉴라디오 버튼
	$(document).ready(function() {

		$(".resultArea > div").last().hide(); // (첫 화면) 맨 뒤 가리기
		$(".main_table_store").hide();
		var radioContent = $(".resultArea > div");
		$("input[type='radio']").click(function() {
			radioContent.hide();
			radioContent.eq($("input[type='radio']").index(this)).show();
		});
		
	});
	
	 // board 제목 클릭 시 모달창 오픈
	  
	  

</script>


<style>
body {
	margin: 0;
	width: 100%;
	height: 100%;
	line-height: 1.43;
}

div {
	display: block;
}

input {
	border: none;
}
</style>
<!-- HEADER -->
<style>
</style>
<!-- MAIN -->
<style>
main {
	width: 100%;
	max-width: 100vw;
}
</style>
<!--NAVIGATOR -->
<style>
</style>
<!-- SECTION -->
<style>
#home {
	height: 300px;
}

#brands {
	width: 100%;
	height: auto;
}

.main_title {
	padding: 20px;
}

.container input[type="radio"] {
	display: none;
	overflow: auto;
}

.container input[type="radio"]+span {
	display: inline-block;
	background: none;
	border: 1px solid #dfdfdf;
	padding: 0px 10px;
	text-align: center;
	height: 35px;
	line-height: 33px;
	font-weight: 100;
	cursor: pointer;
}

.container input[type="radio"]:checked+span {
	border: 1px solid #89BDBB;
	background: #89BDBB;
	color: #fff;
}

.main_table_client {
	padding: 20px;
	width: 100%;
	height: 300px;
	
}
.resultArea table{
	margin: 0 auto;
	border-top: 5px solid #89BDBB;
	border-bottom: 5px solid #89BDBB;
	color: #89BDBB;
	

}
.resultArea tr, td, th{
	width: 15%;
	text-align: center;
}

.main_table_store {
	padding: 20px;
	width: 100%;
	height: 300px;
	
}

.main_table_board {
	padding: 20px;
	width: 100%;
	height: 300px;
	overflow: auto;
	
}


</style>

<!-- ASIDE -->
<!-- MENU BAR -->
<style>
.menu_bg {
	width: 30%;
	height: 2000px;
	position: fixed;
	top: 50px;
	left: 0px;
	overflow: hidden;
	display: none;
}

.menu_bar {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 30%;
	height: 100%;
	background-color:;
	color: lightgrey;
}

.menu_bar>div {
	padding: 10%;
}
</style>
<style>
</style>

<!-- ASIDE -->
<style>
</style>
<!--Modal-->
<style>
</style>
<!-- FOOTER -->
<!-- FOOTER -->
<style>
</style>
<!-- MODAL -->
<style>
/* 모달 전체 세팅 */
.modal-dialog.modal-size {
	width: 444px;
	height: auto;
	margin: 0;
	padding: 0;
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
	width: 100%;
	height: 50px;
	background-color: #36727C;
	color: white;
	border-radius: 12px;
	border: 0;
	font-weight: bold;
	font-size: 1.5rem;
}
</style>
</head>
<body>
	<!-- HEADER -->
	<header>
		<div class="header_container">
			<img src="./images/jaba_logo.png" width="25" height="17"
				onclick="ShowMenu()">
			<div class="menu_bg">
				<div class="menu_bar">
					<div style="width: 96%; text-align: right" onclick="HideMenu()">&times;</div>
					<div class="menu_bar_list"><a href="./adminClient.jsp">Client</a></div>
					<div class="menu_bar_list"><a href="./adminStore.jsp">Biz. Partner</a></div>
					<div class="menu_bar_list"><a href="./adminQna.jsp">Q&A</a></div>
				</div>
			</div>


			<div class="menu">

				<button class="menu_btn" value="SIGN UP" class="btn btn-primary"
					data-toggle="modal" data-target="#registerModal">
					<span>ADMIN</span>
				</button>
			</div>
		</div>

	</header>
	<!-- MODAL -->
	<!-- SIGN UP -->
	<!-- Modal Basic -->
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-size" role="document">
			<div class="modal-content modal-size">

				<!-- modal-header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="header-icon"
						style="stroke: rgb(54, 114, 124); background-color: rgba(54, 114, 124, 0.12);">
						<svg height="32" viewBox="0 0 32 32" width="32">
                     <g
								style="fill: none; fill-rule: evenodd; stroke-linecap: round; stroke-linejoin: round; stroke: rgb(54, 114, 124); stroke-width: 2.66667;">
                     <path
								d="m21.3333333 28v-2.6666667c0-2.9455186-2.3878146-5.3333333-5.3333333-5.3333333h-9.33333333c-2.94551867 0-5.33333334 2.3878147-5.33333334 5.3333333v2.6666667"></path>
                     <circle cx="11.333333" cy="9.333333" r="5.333333"></circle>
                     <path d="m26.666667 10.666667v8"></path>
                     <path d="m30.666667 14.666667h-8"></path></g></svg>
					</div>
					<div class="header-title"
						style="font-weight: bold; font-size: 20px;">
						<p>Sign up to JABA</p>
					</div>
					<div class="header-subtitle">
						<p>
							Already have an account?&nbsp;<a href="#" class="register">Sign
								in here</a>
						</p>
					</div>
				</div>

				<!-- modal-body -->
				<div class="modal-body">
					<div class="text-box" style="font-weight: bold; font-size: 13px;">
						<p>Name</p>
						<input type="text" class="signin-input" id="name" name="name">
					</div>

					<div class="text-box">
						<br>
						<div class="text-box" style="font-weight: bold; font-size: 13px;">
							<p>Mobile number</p>
							<input type="text" class="signin-input" id="mobile" name="mobile">
						</div>

						<div class="text-box">
							<br>
							<div class="text-box" style="font-weight: bold; font-size: 13px;">
								<p>Email address</p>
								<input type="text" class="signin-input" id="email" name="email">
							</div>

							<div class="text-box">
								<br>
								<div class="text-box"
									style="font-weight: bold; font-size: 13px;">
									<p>Password</p>
									<input type="text" class="signin-input" id="password"
										name="password"> <br>
									<p
										style="font-size: 11px; font-weight: normal; padding-top: 3px">Password
										must be at least 8 characters</p>
								</div>

							</div>

							<!-- modal-footer -->
							<div class="modal-footer">
								<br>
								<button type="button" class="btnChk" id="signin" name="signin">Sign
									in</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- NAVIGATOR -->
	<nav></nav>
	<!-- SECTION -->

	<section id="home">
		<div class="container">
			<h1><a href="./adminMain.jsp">관리자용 페이지</a></h1>
		</div>
	</section>



	<!-- SECTION -->
	<section id="brands">
		<div class="container">
			<div class="main_title">
				<h2>Biz. Partner</h2>
			</div>
			
			<label for="tab1">
			<input type="radio" value="CLIENT" name="tab" id="tab1"
				checked="checked" /> <span>STORE</span></label>
			<label for="tab2">
			<input type="radio" value="STORE" name="tab" id="tab2" /> <span>MENU</span></label> 
			<label for="tab3">
			<input type="radio" value="BOARD" name="tab" id="tab3" /> <span>BOARD</span></label>
	

			<div class="resultArea">
				<div data-index="0" class="main_table_client">
				<table id="adminStoreListTable">
				<tr>
					<th>ID
					</th>
					<th>NAME
					</th>
					<th>ADDR
					</th>
					<th>TIME
					</th>
					<th>IMG
					</th>
					
				</tr>
				 <c:forEach items="${storeList}" var="store">
				<tr>
					<td>${store.store_id }
					</td>
					<td><a onclick="storeSelect(this)" id="storeName">${store.store_name}</a>
					</td>
					<td>${store.store_addr }
					</td>
					<td>${store.store_time }
					</td>
					<td>${store.store_img }
					</td>
					
				</tr>
				</c:forEach>
				</table>
		
				</div>
			<div data-index="0" class="main_table_store">
	<section id="menu_info">
      <div class="container" id="container_menu_info">
			<table>
			<thead>
			<tr>
				<th>메뉴 이름</th>
				<th>메뉴 상세정보</th>
				<th>메뉴 가격</th>
				
			</tr>
			</thead>
		
		
          <tbody>
 		<c:choose>
 		<c:when test="${not empty menuList}">
          <c:forEach items="${menuList}" var="menuVo" varStatus="s"> 
          <tr>
			<td class = "adminMenuTd1">${menuVo.menu_name}
			</td>
			<td class = "adminMenuTd2">${menuVo.menu_description}
			</td>
			<td class = "adminMenuTd3">${menuVo.menu_price}
			</td>
			</tr>
		  </c:forEach>
		</c:when>
			<c:otherwise>
			<tr>
				<td colspan="3">
				원하는 매장을 골라주세요.
				</td>
			</tr>
			</c:otherwise>
			</c:choose>
	
			
			</tbody>
			</table>
        
      </div>
   </section>
				
			</div>
				<div data-index="0" class="main_table_board" id="adminBoard">
					<div>
		<table border="1" id="adminBoardTable">
			<thead>
			<tr>
				<th>글번호</th>
				<th>글쓴이</th>
				<th width="30px">제목</th>
				<th>작성일</th>
				<th>조회수</th>
				</tr>
			</thead>
			
			<c:choose>
 		<c:when test="${not empty boardList}">
          <c:forEach items="${boardList}" var="vo" varStatus="s"> 
          <tbody class="adminBoardtbody">
          <tr class = "adminBoardTr">
			<td id = "adminBoardTd1">${vo.bno}
			</td>
			<td id = "adminBoardTd2">${vo.bwrite}
			</td>
			<td id = "adminBoardTd3"><a href="./content.jsp?bno=${vo.bno}&pageNum=${currentPage}" id="bsubject">${vo.bsubject}</a>
			</td>
			<td id = "adminBoardTd4">${vo.bdate }
			</td>
			<td id = "adminBoardTd5">${vo.bcnt}
			</td>
			</tr>
			</tbody>
		  </c:forEach>
		</c:when>
			<c:otherwise>
			<tr>
				<td colspan="5">
				원하는 매장을 골라주세요.
				</td>
			</tr>
			</c:otherwise>
			</c:choose>
		</table>
<%
			if (bCount > 0) {
			// [이전]
			if (startPage > pageBlock) {
		%>
		<a onclick="boardPageBefore()">[이전]</a>
		<%
			}

		// [1][2][3]...
		for (int i = startPage; i <= endPage; i++) {
		if (currentPage != i) {
		%>
		
		<a onclick="boardPageNum(this)"><%=i%>
		</a>
		<%
			} else {
		%>
		[<%=i%>]
		<%
			}
		}

		// [다음]
		if (startPage < pageBlock) {
		%>
		<a onclick="boardPageAfter()">[다음]</a>
		<%
			}
		}
		%>
<!-- Servlet에 java 변수들 담아두고 여기선 el태그로만 받아보자 -->
	</div> 
			</div>
			</div>
		</div>
	</section>

	<!-- ASIDE -->
	<aside></aside>

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
<script>
	function storeSelect(obj){
		var store = $(obj).text();
		console.log(store);
		alert(store+"를 클릭하였습니다.");
		//menu_price = 0;
	    //currunetMenuPrice = 0;
         console.log(store + " store_name을 클릭");
      // 
         $.ajax({
            url: "<%=ctxPath%>/admin/selectStore.do",
            data : {
               storename : store
            },
            success : function(res) {
            	// 모달부분 jstl 부분 reload 시켜주기위해서 load
            	
            	/* $(".adminMenuTd1").load(location.href + " .adminMenuTd1"); //메뉴부분 계속 반복되어서 리로드된다. 
            	$(".adminMenuTd2").load(location.href + " .adminMenuTd2"); 
            	$(".adminMenuTd3").load(location.href + " .adminMenuTd3");  */
            			
            	/* $("#adminBoardTd1").load(location.href + " #adminBoardTd1"); //앞에 띄어쓰기 필수네?
            	$("#adminBoardTd2").load(location.href + " #adminBoardTd2");
            	$("#adminBoardTd3").load(location.href + " #adminBoardTd3");
            	$("#adminBoardTd4").load(location.href + " #adminBoardTd4");
            	$("#adminBoardTd5").load(location.href + " #adminBoardTd5"); //이대점에선 오류가 뜬다?
            			 */
            	location.reload();
				
            	
            	//method 쓴 것들 close되어 있는 지 확인
            		
              	
            }
         });	
	}

</script>
<!-- Board 페이지 이동 시 adminBoard div만 리로드 -->
<script>
	function boardPageBefore(){
		$.ajax({
			url: "<%=ctxPath%>/boardList?pageNum=<%=startPage - pageBlock%>",
			success : function(res){
				$(".adminBoard").load(location.href + " .adminBoard");
			}
		})
	}
	function boardPageNum(obj){
		var i = $(obj).text();
		console.log(i);
		$.ajax({
			url: "<%=ctxPath%>/boardList?pageNum=<%=currentPage%>+1",
			success : function(res){
				$(".adminBoard").load(location.href + ".adminBoard");
			}
		})
	}
	function boardPageAfter(){
		$.ajax({
			url: "<%=ctxPath%>/boardList?pageNum=<%=startPage + pageBlock%>",
			success : function(res){
				$(".adminBoard").load(location.href + ".adminBoard");
			}
		})
	}
	function clickStoreName(obj){
	   
      
      
      }

</script>


</body>
</html>