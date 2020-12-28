<%@page import="jaba.menu.vo.MenuVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
   String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JABA</title>
<script src='https://code.jquery.com/jquery-3.4.0.js'></script>
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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter&display=swap"
	rel="stylesheet">
<!-- 체크박스 라디오버튼 CSS -->
<link href="<%=ctxPath%>/css/icheck-material.css" rel="stylesheet"
	type="text/css">

<script>
	$(function() {
		$(window).scroll(function() {
			var navbar = $(this).scrollTop();
			console.log(navbar);
			var $header = $('header');
			if (navbar > 0) {
				$header.addClass('activated');
			} else {
				$header.removeClass('activated');
			}
		})
	})
</script>

<style>
body {
	font-family: 'Inter', 'Noto Sans KR', sans-serif;
	margin: 0;
	width: 100%;
	height: 100%;
	line-height: 1.43;
}

div {
	display: block;
}

h2 {
	font-weight: bold;
	font-size: 15px;
	margin-bottom: 7px;
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
	height: 210px;
}

#home .container .checkout_info {
	font-size: 12px;
}

#info {
	padding: 40px 0px 85px;
	background-color: #F9FAFC;
}

#info .container {
	display: flex;
	flex-direction: row;
	/* 	flex: 1 1 40%; */
	padding: 0 20px;
	/* width: 80%; */
	max-width: 1024px;
	/* 	height: 1000px; */
}

#info .container .category {
	font-weight: bold;
	width: auto;
}

#info .container .contents {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
}
</style>
<!-- pickup & asap 모달창 -->
<style>
.signin-input { /*Near 체크박스 */
	width: 100%;
	height: 40px;
	border-radius: 6px;
	font-weight: normal;
	border: 1px solid rgba(20, 23, 26, .2);
	padding-left: 15px;
}

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

@media screen {
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
	padding-top: 35px;
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
	width: 100%;
	padding: 15px 15px;
	border-radius: 16px;
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
	padding: 32px 30px 32px 30px;
	overflow-y: auto;
	-webkit-overflow-scrolling: touch;
	border-bottom: 0;
	font-size: 14px;
}

#modalForm {
	width: 100%;
	height: 150px;
	background: #f2f3f5;
	border-radius: 12px;
	padding: 30px 24px 16px 36px;
	font-size: 14px;
}

#modalForm .asap {
	display: flex;
	flex-wrap: wrap;
	margin-right: 0;
	position: relative;
}

#modalForm .later {
	display: flex;
	flex-wrap: wrap;
	margin-right: 0;
	position: relative;
}

.modal-body h3 {
	color: #14171a;
	width: 100%;
	font-size: 14px;
	font-weight: 600;
	padding: 0 0 8px;
	margin: 0;
}

/* 모달 footer 세팅 */
.modal-footer {
	padding: 16px 30px 20px 30px;
	align-items: center;
	border-top: 1px solid rgba(20, 23, 26, .08);
}

.modalBtnChk {
	width: 100%;
	height: 50px;
	background-color: #36727C;
	color: white;
	border-radius: 12px;
	border: 0;
	font-size: 1.5rem;
}

#btnChk_footer {
	justify-content: flex-end;
	width: 85px;
	height: 40px;
	background-color: #36727C;
	color: white;
	border-radius: 12px;
	border: 0;
	font-size: 13px;
}

.pickup_time {
	border: 1px solid #C6C8CC;
	padding: 10px 16px;
	border-radius: 6px;
	cursor: pointer;
	margin-top: 10px;
	float: right;
}
</style>
<!-- FOOTER -->
<!-- FOOTER -->
<style>
</style>
<!-- MODAL -->
<style>
#orderSummary {
	width: 48%;
	padding-left: 19%;
}

#main_form {
	width: 285px;
	height: 160px;
	background-color: white;
	box-shadow: 0 0 0 1px rgba(20, 23, 26, .08), 0 1px 0 1px
		rgba(20, 23, 26, .04);
	border-radius: 12px;
	padding: 30px;
	margin-top: 40px;
	font-size: 14px;
	border: 1px solid rgba(20, 23, 26, .08);
}

#main_form .pickup_tab {
	display: flex;
	flex-direction: column;
}

#main_form .pickup_tab:after {
	border-bottom: 1px solid rgba(20, 23, 26, .08);
	content: "";
	display: block;
	width: 220px;
	margin: 8px 0px;
}

.personal_info {
	width: 285px;
	height: 170px;
	background-color: white;
	box-shadow: 0 0 0 1px rgba(20, 23, 26, .08), 0 1px 0 1px
		rgba(20, 23, 26, .04);
	border-radius: 12px;
	padding: 20px;
	margin-top: 30px;
	font-size: 14px;
	border: 1px solid rgba(20, 23, 26, .08);
}

.personal_info #personal_name {
	margin-bottom: 10px;
	padding-left: 10px;
	border: 1px solid rgba(20, 23, 26, 0.40);
	border-radius: 7px;
	width: 200px;
	height: 32px;
}

.personal_info #personal_pwd {
	padding-left: 10px;
	border-radius: 7px;
	border: 1px solid rgba(20, 23, 26, 0.40);
	width: 200px;
	height: 32px;
}

.payment_tab {
	padding: 20px;
	margin-top: 30px;
	width: 285px;
	height: 185px;
	background-color: white;
	box-shadow: 0 0 0 1px rgba(20, 23, 26, .08), 0 1px 0 1px
		rgba(20, 23, 26, .04);
	border-radius: 12px;
	font-size: 14px;
	border: 1px solid rgba(20, 23, 26, .08);
}

.payment_tab #card_section {
	margin: 8px 0 0 10px;
	border: 1px solid #c6c8cc;
	border-radius: 6px;
	padding: 10px 16px;
	position: relative;
}

.payment_tab #card_section #card_name {
	border: none;
	outline: none;
}

.payment_tab #card_section #card_pwd {
	border: none;
	outline: none;
	height: 15px;
}

.border-spacer {
	width: 100%;
	height: 1px;
	background-color: #c6c8cc;
	margin: 8px 0 10px;
}

.your_order {
	width: 300px;
	background-color: white;
	box-shadow: 0 0 0 1px rgba(20, 23, 26, .08), 0 1px 0 1px
		rgba(20, 23, 26, .04);
	border-radius: 12px;
	padding: 20px;
	margin-top: 46px;
	font-size: 14px;
	border: 1px solid rgba(20, 23, 26, .08);
}

.category1 {
	margin-bottom: 10px;
}

.total_price {
	font-size: 19px;
	margin-top: 20px;
	border-top: 1px solid rgba(20, 23, 26, .08);
}
/* .listup{
	text-align: center;
} */
.order_view {
	font-size: 15px;
	padding-bottom: 10px;
	border-bottom: 1px solid rgba(20, 23, 26, .08);
}

.item_title {
	font-weight: bold;
	margin: 9px 0 5px 0;
}

.total_title {
	font-weight: bold;
	margin-bottom: 6px;
	padding-top: 18px;
}

.container .contents {
	width: 100%;
}

#checkout-details {
	width: 48%;
	padding-right: 9%;
}

.checkout_title:after {
	color: gray;
	border-bottom: 1px solid rgba(20, 23, 26, .08);
	content: "";
	display: block;
	width: 400px;
	margin: 8px 0px;
}

#left {
	display: flex;
	flex-flow: row wrap;
	flex-direction: column;
	float: left;
	margin: 0 15px 30px 15px;
}

#right {
	display: flex;
	flex-direction: row;
	flex-direction: column;
	float: right;
	margin: 15px;
}

#placeorder {
	display: flex;
	flex-flow: row wrap;
	align-content: center;
}

#info .bottom_part {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	margin: 0 auto;
	/* margin-left: 135px; */
}

.item_details_group {
	padding-bottom: 7px;
}

.item_details {
	padding-left: 31px;
	color: #5D5D5D;
}

.order_request {
	width: 300px;
	background-color: white;
	box-shadow: 0 0 0 1px rgba(20, 23, 26, .08), 0 1px 0 1px
		rgba(20, 23, 26, .04);
	border-radius: 12px;
	padding: 20px;
	margin: 30px 0 15px 0;
	font-size: 14px;
	border: 1px solid rgba(20, 23, 26, .08);
}

.btnChk {
	padding: 16px 60px;
	background-color: #36727C;
	color: white;
	border-radius: 15px;
	border: 0;
	font-size: 15px;
	height: 53px;
}

.btnChk:hover {
	background: #89BDBB;
	color: white;
	opacity: 10.3;
	border-color: white;
	border-width: 1px;
}
</style>
<script>
	// 모달창 script
	function setDisplay() {
		if ($('input:radio[id=asap]').is(':checked')) {
			$('#later_time').hide();
		} else {
			$('#later_time').show();
		}
	}
</script>
</head>
<body>
	<!-- HEADER -->
	<header>
		<div class="header_container">
			<div class="logo">
				<a href="<%=ctxPath%>/index.jsp"><img
					src="<%=ctxPath%>/images/jaba_english_white.png"></a>
			</div>
			<div class="menu"></div>
		</div>

	</header>

	<!-- NAVIGATOR -->
	<nav></nav>

	<!-- SECTION -->
	<section id="home">
		<div class="container" style="text-align: left; padding: 0px 20px;">
			<div class="checkout_title">
				<p style="font-size: 35px; color: white; margin-top: 30px;">
					CHECKOUT</p>
				<p>Your order from ${storeVo.store_name} for Pick up, ASAP</p>
			</div>

			<div class="checkout_info">
				<p>Open until 8:00pm</p>
				<P>Shop 3, 91-93 McIntosh Road, Narraweena New South Wales 2099
					• 82873344</p>
			</div>
		</div>
	</section>


	<!-- SECTION -->
	<section id="info">
		<div class="container">
			<div class="contents">
				<div id="orderSummary">
					<div class="category">
						<p>
							<span class="profile"
								style="text-decoration: none; color: grey; width: 50px;">Order
								Summary</span>
						</p>
					</div>
					<div class="left_part" id="left">
						<form id="main_form" action="#" method="get">
							<table>
								<tr>
									<td><div class="pickup_tab">
											<div class="pickup_details">
												<p>
													<span
														style="float: left; font-weight: bold; font-size: 15px;">PICK
														UP</span> <span style="float: right"> <a data-toggle="modal" href="#exampleModal" style="color: #5b5858;">변경</a></span>
												</p>
											</div>
											<div>
												<p>ASAP (40-55 분 소요 예정)</p>
											</div>
										</div>
										<div class="address_tab" style="margin-top: 10px;">
											<p>
												${storeVo.store_name}<br>${storeVo.store_addr}
											</p>
										</div></td>
								</tr>
							</table>
						</form>
						<div class="personal_info">
							<h2>이름</h2>
							<input type="text" id="personal_name" name="personal_name"
								placeholder="이름"><br>
							<h2 style="padding-top: 5px;">전화번호</h2>
							<input type="text" id="personal_pwd" name="personal_pwd"
								placeholder="010-XXXX-XXXX">
						</div>

						<div class="payment_tab">
							<form id="payment_way" action="#" method="get">
								<table>
									<tr>
										<td>
												<h2>Payment method</h2>
											<div class="payment_method icheck-material-teal">
												<input type="radio" id="payment_method" name="teal"
													value="agree" onchange="setDisplay()">
												<label for="payment_method" style="font-weight: normal;">&nbsp;Pay
													with Card</label>
												<div id="card_section">
													<input type="text" id="card_name" name="card_name"
														placeholder="카드주인이름"><br>
													<div class="border-spacer"></div>
													<input type="text" id="card_pwd" name="card_pwd"
														placeholder="카드 번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MM/YY&nbsp;&nbsp;CVC">
												</div>
											</div>
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
				<div id="checkout-details">
					<div class="right_part" id="right">
						<div class="your_order">
							<div class="listup">
								<div class="category1">
									<div class="order_view">
										<p>주문 내역</p>
									</div>


									<div class="coffee">
										<!-- <p class="item_title">COFFEE</p> -->
										<c:if test="${not empty cartList }">
											<c:forEach items="${cartViewVoList}" var="cartViewVoList" varStatus="s">
												<p>
													<span class="item_total">${cartViewVoList.order_quantity }&nbsp;X</span>
													<span class="item_name">&nbsp;${cartViewVoList.menu_name }</span><span
														class="item_price" style="float: right">&#8361;${cartViewVoList.cart_total_price }</span><br>
												<div class="item_details_group">
													<c:forEach items="${cartViewList[s.count-1]}" var="cartViewList" varStatus="s1">
														<span class="item_details">${cartViewList }</span>
														<span class="item_price" style="float: right"></span>
														<br>
													</c:forEach>
												</div>
											</c:forEach>
										</c:if>
									</div>
								</div>
								<div class="total_price">
									<p class="total_title">
										TOTAL <span class="price_all_total" style="float: right">&#8361;${total_price }</span>
									</p>
								</div>
							</div>
						</div>

						<div class="order_request">
							<h2>요청사항</h2>
							<textarea cols="27" rows="3"
								style="resize: none; padding: 10px; border-color: white; outline-color: white;"
								placeholder="요청사항을 입력해주세요." id="pay_request"></textarea>
						</div>


					</div>
				</div>
				<div class="bottom_part">
					<button type="button" class="btnChk" id="place_order"
						name="place_order">Place Order for Pick Up</button>
				</div>
			</div>
		</div>
	</section>

	<!-- pickup asap 모달창 -->
	<!-- Modal Basic -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-size" role="document">
			<div class="modal-content modal-size">

				<!-- modal-header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>

					<div class="header-icon">
						<button type="button" class="modalBtnChk" id="btn_pickup"
							name="btn_pickup" style="font-size: 15px;">Pick Up</button>
					</div>
				</div>

				<!-- modal-body -->
				<div class="modal-body">
					<h3>Select pick up time</h3>
					<form id="modalForm" action="#" method="get">
						<table>
							<tr>
								<td>
									<div class="asap icheck-material-teal">
										<input type="radio" id="asap" name="teal" value="agree"
											checked="checked" onchange="setDisplay()"> <label
											for="asap" style="font-weight: normal;">&nbsp;&nbsp;ASAP</label>
									</div>
									<div class="later icheck-material-teal">
										<input type="radio" id="later" name="teal" value="denial"
											onchange="setDisplay()" style="font-weight: 15px;"> <label
											for="later" style="font-weight: normal;">&nbsp;&nbsp;LATER</label>
									</div>
								</td>
							</tr>

							<tr id="later_time">
								<td><select name="pickup_time" class="pickup_time">
										<option value="">Select Pick Up Time</option>
										<option value="30">10:00</option>
										<option value="31">10:30</option>
										<option value="31">11:30</option>
										<option value="31">11:30</option>
										<option value="31">12:00</option>
										<option value="31">12:30</option>
								</select></td>
							</tr>
						</table>
					</form>
				</div>
				<!-- modal-footer -->
				<div class="modal-footer">
					<button type="button" class="modalBtnChk" data-dismiss="modal"
						aria-label="Close" id="btnChk_footer"
						name="btnChk_cancel">Cancel</button>
					<button type="button" class="modalBtnChk" id="btnChk_footer"
						name="btnChk_confirm">Confirm</button>
				</div>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="footer_logo">
					<img src="images/jaba_english_white.png">
				</div>
				<div class="footer_links">
					<ul>
						<li class="links_head">JABA for YOUNG&nbsp;RICH</li>
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
		// place_order 버튼을 눌렀을때 입력된 값으로 payment 테이블에 데이터 추가
		$("#place_order").click(function(){
			var pay_request = $("#pay_request").val();
			console.log(pay_request);
			 $.ajax({
				  url: "cart/paymentInsert.do",
		             data : {
		            	 pay_request : pay_request
		             },
		             success : function(res){
		                console.log("payment ajax통신 잘됨");
		                alert("결제가 완료되었습니다.");
		                location.href="./index.jsp";
		             }
			}); 
		});
	
	
	</script>
</body>
</html>