<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
   width: 100%;
   border-radius: 6px;
   font-weight: normal;
   border: 1px solid rgba(20, 23, 26, .2);
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
			<div class="menu"></div>
		</div>

	</header>
	<!-- NAVIGATOR -->
	<nav></nav>
	<!-- SECTION -->
	<section id="home">
		<div class="container" style="text-align: left; padding: 0px 20px;">
			<p style="font-size: 35px; color: white; margin-top: 30px;">My
				account</p>
		</div>
	</section>


	<!-- SECTION -->
	<section id="info">
		<div class="container">
			<div class="category">
				<p>
					<a href="./My_account_profile.jsp" class="profile"
						style="text-decoration: none; color: grey;">Profile</a>
				</p>
				<br>
				<p>
					<a href="./My_account_password.jsp" class="password"
						style="text-decoration: none; color: grey;">Password</a>
				</p>
			</div>
			<div class="list" style="width: 500px;">
				<div class="text-box">
					<p style="font-weight: bold; margin: 0 0 15px;">Change Password</p>
				</div>
				<div class="text-box">
					<input type="password" class="signin-input" id="pwd_change"
						name="pwd_change"
						style="font-weight: normal; padding: 12px 12px 10px;"
						placeholder="새로운 비밀번호를 입력해주세요">
				</div>
				<div class="text-box">
					<br>
					<div class="text-box">
						<input type="password" class="signin-input" id="pwd_confirm"
							name="pwd_confirm"
							style="font-weight: normal; padding: 12px 12px 10px; margin-top: -10px;"
							placeholder="비밀번호를 한번 더 입력해주세요">
					</div>
				</div>
				<br>
				<button type="button" class="btnChk" id="btn_pwd" name="btn_pwd"
					style="font-weight: normal; font-size: 12px;">CHANGE
					PASSWORD</button>
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
						<li class="links_head">JABA for YOUNG&amp;RICH</li>
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
	$("#pwd_change").change(function(){
		var pw = $("#pwd_change").val();
		 var num = pw.search(/[0-9]/g);
		 var eng = pw.search(/[a-z]/ig);
		 var spe = pw.search(/[`~!@@#$%^&*]/gi);
		 if(pw.length < 8 || pw.length > 20){
		  alert("8자리 ~ 20자리 이내로 입력해주세요.");
		  $("#pwd_change").val("");
		  return false;
		 }else if(pw.search(/\s/) != -1){
		  alert("비밀번호는 공백 없이 입력해주세요.");
		  $("#pwd_change").val("");
		  return false;
		 }else if(num < 0 || eng < 0 || spe < 0 ){
		  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
		  $("#pwd_change").val("");
		  return false;
		 }else {
			console.log("통과"); 
		    return true;
		 }
	})
	
	$("#pwd_confirm").change(function(){
		var pwCh = $("#pwd_change").val();
		var pwCf = $("#pwd_confirm").val();
		if(pwCh!=pwCf){
			alert("비밀번호가 일치하지 않습니다.");
			 $("#pwd_confirm").val("");
		} else {
			alert("비밀번호가 일치합니다.");
		}
	})
	</script>
	<script>
		$("#btn_pwd").click(function(){
			$.ajax({
		           url:"member/myPwUpdate.do",
		           data:{ 
		            user_pw: $("#pwd_confirm").val(),
		           },
		          success: function(res1){
		          alert("비밀번호가 수정되었습니다.");
		        }
			});
		});
	</script>
</body>
</html>