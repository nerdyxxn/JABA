<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String ctxPath = request.getContextPath();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JABA</title>
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
<link href="./css/html5_reset.css" rel="stylesheet">
<!-- HEADER CSS -->
<link href="./css/header.css" rel="stylesheet">
<!-- SECTION CSS -->
<link href="./css/section.css" rel="stylesheet">
<!-- FOOTER CSS -->
<link href="./css/footer.css" rel="stylesheet">

<style type="text/css"></style>


<script>
$(function(){
   $(window).scroll(function(){
   var navbar = $(this).scrollTop();
   var $header = $('header');
   if(navbar > 0){
       $header.addClass('activated');
   }else{
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

input { 
	/* border: none; */ /*여기 지웠어요*/
	width: 100%;
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

#info .container{
	height: 600px;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	flex: 1 1 40%;
	justify-content: flex-start;
}

.category {
	font-weight: bold;
	width: 100px;
	padding: 40px 80px;
}

.list {
	width: 100%;
	box-sizing: content-box;
	font: inherit;
	padding: 40px 80px;
	margin-left: 100px;
}

</style>

<!-- ASIDE -->

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
	padding: 16px 24px;
	background-color: #89BDBB;
	color: white;
	border-radius: 40px;
	border: 0;
	font-weight: bold;
	font-size: 0.9rem;
}


.btnChk:hover {
	background: #36727C;
	color:white;
	opacity: 10.3;
    border-color: white;
    border-width: 1px;
}



</style>
</head>
<body>
	<!-- HEADER -->
	<header>
		<div class="header_container">
			<div class="logo">
				<a href="<%=ctxPath%>/index.jsp"><img
					src="<%=ctxPath%>/images/jaba_english_white.png"></a>
			</div>
			<div class="menu">
			</div>
		</div>

	</header>
	<!-- NAVIGATOR -->
	<nav></nav>
	<!-- SECTION -->
	<section id="home">
		<div class="container" style="text-align: left; padding: 0px 20px;">
			<p style="font-size: 35px; color: white; margin-top: 30px;">
				My account
				</p>
		</div>
	</section>


	<!-- SECTION -->
	<section id="info">
		<div class="container">
			<div class="category">
				<p><a href="./My_account_profile.jsp" class="profile" style="text-decoration: none; color: grey;">Profile</a></p>
				<br>
				<p><a href="./My_account_password.jsp" class="password" style="text-decoration: none; color: grey;">Password</a>
				</p>
			</div>
			<div class="list" style="width: 500px;">
				<div class="text-box">
					<p style="font-weight: bold; margin: 0 0 8px;">Name</p>
					<input type="text" class="signin-input" id="name_profile" name="name_profile" style="height: 38px; padding: 15px 18px;" value="${clientVo.user_name }">
				</div>

				<br>
				<div class="text-box">
					<p style="font-weight: bold; margin: 0 0 8px;">Email Address</p>
					<input type="text" class="signin-input" id="email_profile" name="email_profile" style="height: 38px; padding: 15px 18px;" readonly="readonly" value="${clientVo.user_id }">
				</div>

				<br>
				<div class="text-box">
					<p style="font-weight: bold; margin: 0 0 8px;">Mobile number</p>
					<input type="text" class="signin-input" id="mobile_profile" name="mobile_profile" style="height: 38px;  padding: 15px 18px; " value="${clientVo.user_phone }">
				</div>

				<br>
				<div class="text-box">
					<p style="font-weight: bold; margin: 0 0 8px;">Date of Birth</p>
					<input type="text" class="signin-input" id="birthday_profile"
						name="birthday_profile" style="height: 38px; padding: 15px 18px;" value="${clientVo.user_birth }">
				</div>

				<br>
				<div class="text-box">
					<p style="font-weight: bold; margin: 0 0 8px;">Gender</p>
					<select name="gender" class="signin-input" id="gender_profile" name="gender_profile" style="height: 38px; padding: 9px;">
					<option value=""></option> 
					<option value="1" <c:if test="${clientVo.user_gender eq 1}">selected</c:if>>남</option>
					<option value="2" <c:if test="${clientVo.user_gender eq 2}">selected</c:if>>여</option>
					<option value="3">선택 안함</option>
					</select>
										
				</div>
			<br>
			<button type="button" class="btnChk" id="btn_save" name="btn_save"
				style="font-weight: normal;">SAVE</button>
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
					<img src="images/jaba_english_white.png">
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
	// birth 에 숫자만 들어가야함
		$("#btn_save").click(function(){
			// 숫자확인 정규표현식
			var regExp = /^[0-9]*$/
			var birth = $("#birthday_profile").val();
			if(!regExp.test(birth)){
				alert("Date of Birth는 숫자만입력하세요.");
			}else{
				$.ajax({
		            url:"member/myPageUpdate.do",
		            async:false,
		            data:{ 
		            	user_name: $("#name_profile").val(),
		            	user_phone: $("#mobile_profile").val(),
		            	user_birth: $("#birthday_profile").val(),
		            	user_gender: $("#gender_profile").val(),
		            },
		            success: function(res1){
		            	alert("프로필 정보가 수정되었습니다.");
		            }
				});
			}
		});
	
	
	</script>
</body>
</html>