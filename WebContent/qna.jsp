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
<title>Q&A</title>
<script src='https://code.jquery.com/jquery-3.4.0.js'></script>
<!-- RESET -->
<link href="<%=ctxPath%>/css/html5_reset.css" rel="stylesheet">
<!-- HEADER CSS -->
<link href="<%=ctxPath%>/css/header.css" rel="stylesheet">
<!-- SECTION CSS -->
<link href="<%=ctxPath%>/css/section.css" rel="stylesheet">
<!-- FOOTER CSS -->
<link href="<%=ctxPath%>/css/footer.css" rel="stylesheet">
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
			$(".search-term").click(function() {
				$("#hidden_term").attr("style", "visibility:visible")
			})
			$(".hidden_term_close").click(function() {
				$("#hidden_term").attr("style", "visibility:hidden")
			})

		})
	});
	
</script>
<script>
 $(function(){
	 $(".menu_btn").hide();
 })

</script>

<!-- Q&A JS -->
<script>
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // faq-item class를 클릭했을때
        $(".faq-item").click(function(){
            var a = $(this).find("div.answer");
 
            // answer 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( a.is(":visible") ){
                a.slideUp();
            }else{
                a.slideDown();
            }
        });
    });
</script>

<style>
body {
	margin: 0;
	width: 100%;
	height: 100%;
	line-height: 1.43;
	color: rgba(0, 0, 0, 0.87);
	margin: 0;
	font-size: 0.875rem;
	font-family: Inter, sans-serif;
	font-weight: 400;
	line-height: 1.43;
}

div {
	display: block;
}

input {
	border: none;
}
</style>
<!-- MAIN -->
<style>
main {
	width: 100%;
	max-width: 100vw;
}

section {
	padding: 45px 0;
	display: flex;
	justify-content: center;
	align-items: center;
	position: relative;
	background: #f9fafc;
	z-index: 0;
}

#home {
	height: 350px;
}

a {
	text-decoration: none;
}
</style>
<!-- SECTION 2 -->
<style type="text/css">
.mini {
	padding: 3px 0;
	background-color: white;
	position: -webkit-sticky;
	position: sticky;
	top: 55px;
	z-index: 999;
}

.mini .container {
	width: 80%;
}

.mini_row {
	display: flex;
	flex-direction: row;
	padding: 3px 0;
}

.mini_row button {
	border: 1px solid rgba(132, 146, 166, .2) !important;
	color: black;
	margin: 0 8px 0 0;
	font-weight: normal;
}

.search-term {
	display: inline-flex;
	align-items: center;
	text-align: center;
	flex-direction: row;
	position: relative
}

.search-term button {
	width: 34px; -
	-verticalPadding: 0; -
	-horizontalPadding: 0;
	height: 34px;
}

.search-term svg {
	width: 20px;
	height: 20px;
	padding: 0 auto;
}

.search-term {
	border-radius: 50px;
}

#hidden_term {
	visibility: hidden;
}
</style>

<!-- SECTION 3 -->
<style>
#qna {
	width: 100%;
}

#qna .container {
	width: 80%;
	margin: 0 auto;
	padding-top: 15px;
}

#faq {
	padding: 10px 0 120px
}

#faq .content {
	border-top: 1px solid #262626;
	border-bottom: 1px solid #262626;
	padding: 0
}

#faq .faq-item .question, #faq .faq-item .answer {
	padding: 15px
}

#faq .faq-item .question {
	display: flex;
	align-items: center;
	justify-content: space-between;
	cursor: pointer
}

#faq .faq-item .question .desc {
	display: flex;
	align-items: center
}

#faq .faq-item .question .desc .name {
	padding-left: 12px
}

#faq .faq-item .question .q {
	min-width: 35px;
	width: 35px;
	height: 35px;
}

#faq .faq-item .question .control {
	min-width: 35px;
	width: 30px;
	height: 30px;
}

#faq .faq-item .answer {
	display: none;
	border-top: 1px solid #d6d6d6
}

#faq .faq-item.active {
	background-color: #f1f1f1;
	border: 1px solid #ff7949
}


</style>



</head>
<body>
	<!-- HEADER -->
	<header>
		<div class="header_container">
			<div class="logo" >
				<a href="<%=ctxPath%>/index.jsp"><img src="<%=ctxPath%>/images/jaba_english_white.png"></a>
			</div>
			<div class="menu">
				<button class="menu_btn" value="LOG IN">
					<span>LOG IN</span>
				</button>
				<button class="menu_btn" value="SIGN UP">
					<span>SIGN UP</span>
				</button>
			</div>
		</div>

	</header>
	<!-- SECTION -->
	<section id="home">
		<div class="container">
			<h1>
				Q&A<br> <br>
			</h1>

		</div>

	</section>
	<!-- SECTION 2 -->
	<!-- <section id="search" class="mini">
		<div class="container">
			<div class="mini_row">
				<div class="time">
					<button>Pick up, ASAP</button>
				</div>
				<div class="search_loc">
					<button>AVENUE</button>
				</div>
				<div class="search-term">
				<button class="MuiButtonBase-root MuiIconButton-root search-term__icon  MuiIconButton-sizeSmall jss263" tabindex="0" type="button">
				<span class="MuiIconButton-label">
				<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation">
				<path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z">
				</path>
				</svg>
				</span>
				<div class="MuiTouchRipple-root">
				</div>
				</button>
				</div>
				<div id="hidden_term">
				<button class="hidden_term_all">
					<div id="hidden_input">
						<input type="text" placeholder="Acai or Latte">
					</div>
					<button class="hidden_term_close">
					X
					</button>
				</button>
				
				</div>
			</div>
		</div>
	</section> -->
	<!-- SECTION 3 -->
	<section id="faq">
		<div class="content container">
			<c:if test="${not empty qnaList}">
				<c:forEach items="${qnaList}" var="qnaList" varStatus="s">
					<div class="faq-item">
						<div class="question">
							<div class="desc">
								<div class="q"></div>
								<div class="name">${qnaList.qna_title }</div>
							</div>
							<div class="control"></div>
						</div>
						<div class="answer">
							<div class="a"></div>
							<p>${qnaList.qna_content }</p>
						</div>
					</div>
				</c:forEach>
			</c:if>
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


</body>
</html>