<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   String ctxPath = request.getContextPath();
   String brandName = request.getParameter("brand");
   if(brandName==null) {
      brandName = "스타";  // 예외처리  
   }
   
%>
<%
	String avenue = request.getParameter("city");

%>
<html>
<head>
<meta charset="UTF-8">
<title>JABA</title>
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimal-ui" />
<!-- <link rel="stylesheet" type="text/css" href="mainStyle.css" /> -->
<script src='https://code.jquery.com/jquery-3.4.0.js'></script>
<!-- MODAL -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- RESET ************************** -->
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
   margin: 0;
   width: 100%;
   height: 100%;
   line-height: 1.43;
	font-family: Inter, sans-serif;
}

div {
   display: block;
}

input {
   border: none;
	width: 378px;
}

a{
color: black;
}
</style>
<!-- HEADER -->
<style>
/* dropdown 메뉴 세팅 */
.dropdown-menu {
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 1000;
    display: none;
    float: left;
    min-width: 160px;
    padding: 8px 0;
    margin: 2px 0 0;
    font-size: 14px;
    color: #212529;
    text-align: left;
    list-style: none;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid rgba(0,0,0,.15);
    border-radius: 4px;
}
.menu-item__icon {
    width: 20px;
    height: 20px;
    margin-right: 10px;
}
.dropdown-itemss span {
  margin: auto;
  width: 50%;
}
.dropdown-item {
    display: block;
    width: 100%;
    padding: 4px 24px;
    clear: both;
    font-weight: 400;
    color: #212529;
    text-align: inherit;
    white-space: nowrap;
    background-color: transparent;
    border: 0;
    
    font-family: Inter,sans-serif;
   font-size: 14px;
   font-weight: 400;
    line-height: 1.75;
}

/* 원형 아이콘 */
.jss98 {
    width: 32px;
    height: 32px;
    display: flex;
    overflow: hidden;
    position: relative;
    font-size: 10px;
    align-items: center;
    flex-shrink: 0;
    font-family: Inter,sans-serif;
    user-select: none;
    border-radius: 50%;
    justify-content: center;
    
    font-size: 10px;
    font-weight: 700;
    color: rgb(255, 255, 255);
    background-color: rgb(0, 0, 0);
}

.MuiAvatar-root {
    width: 32px;
    height: 32px;
    display: inline-flex;
    overflow: hidden;
    position: relative;
    font-size: 10px;
    align-items: center;
    flex-shrink: 0;
    font-family: Inter,sans-serif;
    user-select: none;
    border-radius: 50%;
    justify-content: center;
}

/* 화살표 아이콘 버튼 */
.jss99 {
    width: 32px;
    height: 32px;
    padding: 0;
}
.MuiIconButton-sizeSmall {
    padding: 3px;
    font-size: 1.125rem;
}
.MuiIconButton-root {
    flex: 0 0 auto;
    color: rgba(0, 0, 0, 0.54);
    padding: 12px;
    overflow: visible;
    font-size: 1.5rem;
    text-align: center;
    transition: background-color 150ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
    border-radius: 50%;
}
.MuiButtonBase-root {
    color: inherit;
    border: 0;
    cursor: pointer;
    margin: 0;
    display: inline-flex;
    outline: 0;
    padding: 0;
    position: relative;
    align-items: center;
    user-select: none;
    border-radius: 0;
    vertical-align: middle;
    -moz-appearance: none;
    justify-content: center;
    text-decoration: none;
    background-color: transparent;
    -webkit-appearance: none;
    -webkit-tap-highlight-color: transparent;
}
.MuiIconButton-label {
    width: 100%;
    display: flex;
    align-items: inherit;
    justify-content: inherit;
}
.MuiIconButton-sizeSmall {
    padding: 3px;
    font-size: 1.125rem;
}
.MuiSvgIcon-root {
    fill: currentColor;
    width: 1em;
    height: 1em;
    display: inline-block;
    font-size: 1.5rem;
    transition: fill 200ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
    flex-shrink: 0;
    user-select: none;
}
.MuiTouchRipple-root {
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: block;
    z-index: 0;
    overflow: hidden;
    position: absolute;
    border-radius: inherit;
    pointer-events: none;
}
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
@media only screen and (min-width: 1200px) {
   .container {
      width: 980px;
   }
}

.brand_img {
 width: 130px;
 height: 80px;
 border: none;
 border-radius: 12px;
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
   height: 50px;
   background-color: #36727C;
   color: white;
   border-radius: 12px;
   border: 0;
   font-weight: bold;
   font-size: 18px;
}

#logoutBtn{
   display:none;
}

#dropdownMenuButton{
	display:none;
}

#MuiAvatar-root-id{
	visibility:hidden;
}

</style>
</head>
<body>
   <!-- HEADER -->
   <header>
		<div class="header_container">
			<div class="logo">
				<a href="index.jsp"><img src="./images/jaba_english_white.png"></a>
			</div>
			<div class="dropdown">
				<div class="menu">
					<div class="MuiAvatar-root jss98" id="MuiAvatar-root-id"
						style="color: rgb(255, 255, 255); background-color: rgb(0, 0, 0);">ZK</div>
					<button
						class="MuiButtonBase-root MuiIconButton-root jss99 logo__navigation MuiIconButton-sizeSmall"
						tabindex="0" type="button" id="dropdownMenuButton"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
						style="color: rgb(0, 0, 0);">
						<span class="MuiIconButton-label"><svg
								class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24"
								aria-hidden="true" role="presentation">
								<path
									d="M7.41 8.59L12 13.17l4.59-4.58L18 10l-6 6-6-6 1.41-1.41z"></path>
								<path fill="none" d="M0 0h24v24H0V0z"></path></svg></span><span
							class="MuiTouchRipple-root"></span>
					</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="#" id="My_account_profile"><div class="dropdown-itemss">
								<svg class="menu-item__icon">
									<g id="\u2192-Assets" stroke="none" stroke-width="1"
										fill="none" fill-rule="evenodd">
									<g id="ic-account" fill="#14171A">
									<path
										d="M7,12 L13,12 C15.7614237,12 18,14.2385763 18,17 C18,17.5522847 17.5522847,18 17,18 C16.4871642,18 16.0644928,17.6139598 16.0067277,17.1166211 L15.9949073,16.8237272 C15.9070404,15.3072462 14.6927538,14.0929596 13.1762728,14.0050927 L13,14 L7,14 C5.34314575,14 4,15.3431458 4,17 C4,17.5522847 3.55228475,18 3,18 C2.44771525,18 2,17.5522847 2,17 C2,14.3112453 4.12230671,12.1181819 6.78311038,12.0046195 L7,12 L13,12 L7,12 Z M10,2 C12.7614237,2 15,4.23857625 15,7 C15,9.76142375 12.7614237,12 10,12 C7.23857625,12 5,9.76142375 5,7 C5,4.23857625 7.23857625,2 10,2 Z M10,4 C8.34314575,4 7,5.34314575 7,7 C7,8.65685425 8.34314575,10 10,10 C11.6568542,10 13,8.65685425 13,7 C13,5.34314575 11.6568542,4 10,4 Z"
										id="Icon-Color"></path></g></g></svg>
								<span>My account</span>
							</div></a> <a class="dropdown-item" href="#"><svg
								class="menu-item__icon">
								<g id="\u2192-Assets" stroke="none" stroke-width="1" fill="none"
									fill-rule="evenodd">
								<g id="ic-order_history" fill="#14171A">
								<path
									d="M10,2 C14.418278,2 18,5.581722 18,10 C18,14.418278 14.418278,18 10,18 C5.581722,18 2,14.418278 2,10 C2,5.581722 5.581722,2 10,2 Z M10,4 C6.6862915,4 4,6.6862915 4,10 C4,13.3137085 6.6862915,16 10,16 C13.3137085,16 16,13.3137085 16,10 C16,6.6862915 13.3137085,4 10,4 Z M10,6 C10.5128358,6 10.9355072,6.38604019 10.9932723,6.88337887 L11,7 L11,9.58578644 L12.7071068,11.2928932 C13.0976311,11.6834175 13.0976311,12.3165825 12.7071068,12.7071068 C12.3466228,13.0675907 11.7793918,13.0953203 11.3871006,12.7902954 L11.2928932,12.7071068 L9.29289322,10.7071068 C9.1366129,10.5508265 9.03740171,10.3481451 9.00867243,10.131444 L9,10 L9,7 C9,6.44771525 9.44771525,6 10,6 Z"
									id="Icon-Color"></path></g></g></svg>Order history</a> <a class="dropdown-item"
							href="<%=ctxPath%>/qna/qnaList.do"><svg class="menu-item__icon">
								<g id="\u2192-Assets" stroke="none" stroke-width="1" fill="none"
									fill-rule="evenodd">
								<g id="ic-help_center" fill="#14171A">
								<path
									d="M10,2 C14.418278,2 18,5.581722 18,10 C18,14.418278 14.418278,18 10,18 C5.581722,18 2,14.418278 2,10 C2,5.581722 5.581722,2 10,2 Z M10,14 C9.44771525,14 9,14.4477153 9,15 C9,15.5522847 9.44771525,16 10,16 C10.5522847,16 11,15.5522847 11,15 C11,14.4477153 10.5522847,14 10,14 Z M10,4 C11.6568542,4 13,5.34314575 13,7 C13,7.54060402 12.7972,7.95243249 12.4324938,8.33695441 L12.3049846,8.46425623 L11.6976805,9.00562265 C11.227883,9.46313853 11,9.98493642 11,11 C11,11.5128358 10.6139598,11.9355072 10.1166211,11.9932723 L10,12 C9.44771525,12 9,11.5522847 9,11 L9.00528561,10.712882 C9.05455619,9.40117173 9.44742455,8.4787716 10.1475931,7.73055006 L10.3023195,7.57280447 L10.5268503,7.36697752 L10.9833325,6.9652856 C10.9940344,6.95806514 10.9983381,6.95876504 10.9999034,6.9646777 L10.991185,6.86663987 C10.9259877,6.37740496 10.5070677,6 10,6 C9.48716416,6 9.06449284,6.38604019 9.00672773,6.88337887 L8.99327227,7.11662113 C8.93550716,7.61395981 8.51283584,8 8,8 C7.44771525,8 7,7.55228475 7,7 C7,5.34314575 8.34314575,4 10,4 Z"
									id="Icon-Color"></path></g></g></svg>Help center</a>
					</div>
				</div>
				<button class="menu_btn" value="LOG IN" type="button"
					class="btn btn-primary" data-toggle="modal"
					data-target="#LoginModal">
					<span>LOG IN</span>
				</button>

				<button class="menu_btn" value="SIGN UP" class="btn btn-primary"
					data-toggle="modal" data-target="#registerModal">
					<span>SIGN UP</span>
				</button>
				<button id="logoutBtn">LOGOUT</button>
			</div>
		</div>

	</header>
   <!-- MODAL -->
   <!-- LOG IN -->
   <!-- Modal Basic -->
   <div class="modal fade" id="LoginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-size" role="document">
         <div class="modal-content modal-size">

            <!-- modal-header -->
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="loginCloseBtn">
                  <span aria-hidden="true">&times;</span>
               </button>
               <div class="header-icon" style="stroke: rgb(54, 114, 124); background-color: rgba(54, 114, 124, 0.12);">
                  <svg height="32" viewBox="0 0 32 32" width="32">
                     <path
                        d="m28 2.66666667-2.6666667 2.66666666m-10.1466666 10.14666667c1.8732867 1.8483505 2.6125307 4.5587607 1.9370876 7.1022582-.6754432 2.5434974-2.6619987 4.5300529-5.2054961 5.2054961-2.54349751.6754431-5.25390769-.0638009-7.1022582-1.9370876-2.77912954-2.8774452-2.73938408-7.4512884.08933045-10.2800029 2.82871452-2.8287145 7.40255775-2.86846 10.28000285-.0893305zm0 0 5.48-5.48m0 0 4 4 4.6666666-4.66666667-4-4m-4.6666666 4.66666667 4.6666666-4.66666667"
                        fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.666667"></path></svg>
               </div>
               <div class="header-title" style="font-weight: bold; font-size: 24px;">
                  <p>Sign in to JABA</p>
               </div>
               <div class="header-subtitle">
                  <p>
                     Don't have an account?&nbsp;<a href="#" class="register">Sign up now</a>
                  </p>
               </div>
            </div>

            <!-- modal-body -->
            <div class="modal-body">
               <div class="text-box" style="font-weight: bold;">
                  <p>Email address</p>
                  <input type="text" class="signin-input" id="email" name="email">
               </div>

               <div class="text-box">
                  <br> <span style="font-weight: bold;"> Password </span> <span style="float: right"> <a href="#" style="font-weight: normal;">Forgot&nbsp;password?</a>


                  </span> <input type="password" class="signin-input" id="pwd" name="pwd">
               </div>
            </div>

            <!-- modal-footer -->
            <div class="modal-footer">
               <button type="button" class="btnChk" id="signin" name="signin">Sign in</button>
            </div>
         </div>
      </div>
   </div>
   <!-- MODAL -->
   <!-- SIGN UP -->
   <!-- Modal Basic -->
   <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-size" role="document">
         <div class="modal-content modal-size">

            <!-- modal-header -->
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="signupCloseBtn">
                  <span aria-hidden="true">&times;</span>
               </button>
               <div class="header-icon" style="stroke: rgb(54, 114, 124); background-color: rgba(54, 114, 124, 0.12);">
                  <svg height="32" viewBox="0 0 32 32" width="32">
                     <g
                        style="fill: none; fill-rule: evenodd; stroke-linecap: round; stroke-linejoin: round; stroke: rgb(54, 114, 124); stroke-width: 2.66667;">
                     <path
                        d="m21.3333333 28v-2.6666667c0-2.9455186-2.3878146-5.3333333-5.3333333-5.3333333h-9.33333333c-2.94551867 0-5.33333334 2.3878147-5.33333334 5.3333333v2.6666667"></path>
                     <circle cx="11.333333" cy="9.333333" r="5.333333"></circle>
                     <path d="m26.666667 10.666667v8"></path>
                     <path d="m30.666667 14.666667h-8"></path></g></svg>
               </div>
               <div class="header-title" style="font-weight: bold; font-size: 20px;">
                  <p>Sign up to JABA</p>
               </div>
               <div class="header-subtitle">
                  <p>
                     Already have an account?&nbsp;<a href="#" class="register">Sign in here</a>
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
                        <input type="text" class="signin-input" id="emailRegister" name="emailRegister"> <span id="emailCheckResult"></span>
                     </div>

                     <div class="text-box">
                        <br>
                        <div class="text-box" style="font-weight: bold; font-size: 13px;">
                           <p>Password</p>
                           <input type="password" class="signin-input" id="passwordRegister" name="passwordRegister"> <span id="passwordRegisterResult"></span><br>
                           <p style="font-size: 11px; font-weight: normal; padding-top: 3px">Password must be at least 8 characters</p>
                        </div>

                     </div>

                     <!-- modal-footer -->
                     <div class="modal-footer">
                        <br>
                        <button type="button" class="btnChk" id="signup" name="signup">Sign up</button>
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
         <h1>
            GRAB whatever<br> you want<br>
         </h1>
         <p>order from amazing cafes.</p>
         
         <div class="search-bar">
            <div class="jss38">
               <input type="text" class="search_text" id="addr_search" name="city">
            </div>
         </div>

         <div class="search-button">
            <button  id="searchBtn">search</button>
         </div>
         
      </div>

   </section>

   <!-- SECTION -->
   <section id="brands">
      <div class="container">
         <div>
            <h2>Browse By Brand</h2>
         </div>
         <div data-index="0" class="brands" tabindex="-1" aria-hidden="false" style="outline: none; width: 146px;">
            <div>
               <div class="brand-badge">
                  <img src="./images/logo_starbucks.jpg" class="active brand_img" id="스타벅스" >
               </div>
            </div>
         </div>
         <div data-index="1" class="brands" tabindex="-1" aria-hidden="false" style="outline: none; width: 146px;">
            <div>
               <div class="brand-badge ">
                  <img src="./images/logo_coffeebean.png" class="active brand_img" id="커피빈">
               </div>
            </div>
         </div>
         <div data-index="2" class="brands" tabindex="-1" aria-hidden="false" style="outline: none; width: 146px;">
            <div>
               <div class="brand-badge ">
                  <img src="./images/logo_duckes.png" class="active brand_img" id="듁스">
               </div>
            </div>
         </div>
         <div data-index="3" class="brands" tabindex="-1" aria-hidden="false" style="outline: none; width: 146px;">
            <div>
               <div class="brand-badge ">
                  <img src="./images/logo_ant.png" class="active brand_img" id="앤드러사이트">
               </div>
            </div>
         </div>
         <div data-index="4" class="brands" tabindex="-1" aria-hidden="false" style="outline: none; width: 146px;">
            <div>
               <div class="brand-badge ">
                  <img src="./images/logo_paul.png" class="active brand_img" id="폴바셋">
               </div>
            </div>
         </div>
         <div data-index="5" class="brands" tabindex="-1" aria-hidden="false" style="outline: none; width: 146px;">
            <div>
               <div class="brand-badge ">
                  <img src="./images/logo_hollys.png" class="active brand_img">
               </div>
            </div>
         </div>
      </div>
   </section>

   <section id="cities">
      <div class="container">
         <div>
            <h2>Browse By City</h2>
         </div>
         <div data-index="0" class="cities" tabindex="-1" aria-hidden="false" style="outline: none; width: 146px;">
            <div>
               <div class="city-badge">
                  <a class="city_name" id="종로3가">JongRo</a>
               </div>
            </div>
         </div>
         <div data-index="1" class="cities" tabindex="-1" aria-hidden="false" style="outline: none; width: 146px;">
            <div>
               <div class="city-badge">
                  <a class="city_name" id="신촌">ShinChon</a>
               </div>
            </div>
         </div>
         <div data-index="2" class="cities" tabindex="-1" aria-hidden="false" style="outline: none; width: 146px;">
            <div>
               <div class="city-badge">
                  <a class="city_name" id="홍익로 5길">HongDae</a>
               </div>
            </div>
         </div>
         <div data-index="3" class="cities" tabindex="-1" aria-hidden="false" style="outline: none; width: 146px;">
            <div>
               <div class="city-badge">
                  <a class="city_name" id="강남구청">GangNam</a>
               </div>
            </div>
         </div>
         <div data-index="4" class="cities" tabindex="-1" aria-hidden="false" style="outline: none; width: 146px;">
            <div>
               <div class="city-badge">
                  <a class="city_name" id="양천로55길 55">GangSeo</a>
               </div>
            </div>
         </div>
         <div data-index="5" class="cities" tabindex="-1" aria-hidden="false" style="outline: none; width: 146px;">
            <div>
               <div class="city-badge">
                  <a class="city_name" id="인천시청">Incheon</a>
               </div>
            </div>
         </div>

      </div>

   </section>
   <!-- MAP API -->
   <div id="map"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7e6cd41f87d7529ffb39adb770099e29"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨 
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(0, 0),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
    
    // 지도 정보 콘솔창에 띄워보자
    var center = map.getCenter();
    console.log("현재 위치의 위도: " + center.getLat() + ", 현재 위치의 경도: " + center.getLng());
}    
</script>

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
               <p>We believe that time is precious. We strive to create beautiful technology that helps you save time and make ordering easy, both sides of
                  the counter. Order from JABA with the best selection of local cafes.</p>
               <div class="legal">
                  <div>
                     <div class="legal__copyright">© 2020 JABA Technologies Pty Ltd</div>
                     <ul class="legal__links">
                        <li><a class="MuiTypography-root MuiLink-root MuiLink-underlineNone MuiTypography-colorPrimary" href="/legal/privacy-policy">Privacy
                              Policy</a></li>
                        <li><a class="MuiTypography-root MuiLink-root MuiLink-underlineNone MuiTypography-colorPrimary" href="/legal/terms-and-conditions">Terms
                              of Use</a></li>
                        <li><a class="MuiTypography-root MuiLink-root MuiLink-underlineNone MuiTypography-colorPrimary" href="https://help.bopple.com/"
                           target="_blank" rel="noopener noreferrer">Help Centre</a></li>
                        <li><a class="MuiTypography-root MuiLink-root MuiLink-underlineNone MuiTypography-colorPrimary"
                           href="https://customer-contact-help.bopple.com" target="_blank" rel="noopener noreferrer">Leave Feedback</a></li>
                     </ul>
                  </div>
               </div>
            </div>

         </div>
      </div>

   </footer>
   <!-- 현재 위치 좌표값을 servlet으로 보내는 부분 -->
   <form name="frm">
      <input type="hidden" name="lat2">
      <input type="hidden" name="lon2">      
   </form>
   <script>
   
   if (navigator.geolocation) {
      var frm = document.frm;
       // GeoLocation을 이용해서 접속 위치를 얻어옵니다
            navigator.geolocation.getCurrentPosition(function(position) {
           lat2 = position.coords.latitude, // 현재 위치의 위도
           lon2 = position.coords.longitude; // 현재 위치의 경도
           console.log(frm.lat2.value);
           console.log(frm.lon2.value);
           frm.lat2.value = lat2;
           frm.lon2.value = lon2;
           console.log(frm.lat2.value);
           console.log(frm.lon2.value);
          
           
           $(".brand_img").on("click", function(){
        var getId=$(this).attr("id");
           frm.action="<%=ctxPath%>/store/storeSearch.do?brand="+getId;
           frm.method="post";
           frm.submit();
           });
           
           $(".city_name").on("click", function(){
               var getId=$(this).attr("id");
                  frm.action="<%=ctxPath%>/store/storeSearch.do?city="+getId;
                  frm.method="post";
                  frm.submit();
                  });
           
           $("#searchBtn").click(function(){
        	   var getInputValue = $("#addr_search").val();
        	   frm.action="<%=ctxPath%>/store/storeSearch.do?city="+getInputValue;
               frm.method="post";
               frm.submit();
           });
     
          
           
       })
   };
   
   
   </script>

   <!--  로그인 스크립트 ajax 통신  -->
<script>
   console.log();
   $("#signin").on("click",function(){
      $.ajax({
         url:"client/clientLogin.do",
         data: { email: $("#email").val(),
               pwd: $("#pwd").val()},
         success: function(res1){
            console.log(res1);
            var biz = "BizPartner";
            var admin = "Admin";
            var client = "Client";
            // res1 이 BizPartner 이면 BizPartner 페이지로 이동.
           if(res1 == admin){
               location.href="./adminMain.jsp";
            }else if(res1==client){
            	
               $(".menu_btn").hide();
               $("#logoutBtn").show();
               $("#dropdownMenuButton").show();
               $("#MuiAvatar-root-id").css("visibility","visible");
               document.getElementById("loginCloseBtn").click();
               
            }else if(res1 == 'NotExist'){
            	alert("일치하는 회원정보가 없습니다.");
            }else{ //bizPartner일 경우, user_id받아와서 해당 페이지로 이동하게끔
                location.href="<%=ctxPath%>/biz/menuList.do?storeId="+res1;
             }
         }
      });
   });
   
   
   $("#logoutBtn").on("click",function(){
      $.ajax({
         url:"client/clientLogout.do",
         data:   {},
         success: function(){
            $(".menu_btn").show();
            $("#logoutBtn").hide();
            $("#dropdownMenuButton").hide();
            $("#MuiAvatar-root-id").css("visibility","hidden");
         }
      });
   });
   
   $("#signup").on("click",function(){
      // 각종 유효성 체크 추가해야함 
         if($("#emailRegister").val() != "" && $("#passwordRegister").val() !== ""){
         $.ajax({
            url:"client/clientRegister.do",
            data:{ user_name: $("#name").val(),
                  user_phone: $("#mobile").val(),
                  user_id: $("#emailRegister").val(),
                  user_pw: $("#passwordRegister").val()},
            success: function(res){   // 회원가입 완료, 혹은 못했을때 작업 
               console.log(res);   // 서블릿에서 가져온 메세지분석
               var succ = "registerOk";
               var fail = "registerFail";
               document.getElementById("signupCloseBtn").click();
            }
         });
      }else{
         alert("모두 입력해주세요.");
      }
   });
   
   
   // 아이디 중복체크 
   $("#emailRegister").change(function(){
      $.ajax({
         url:"client/clientCheckId.do",
         data:{ emailRegister: $("#emailRegister").val()},
         success: function(res1){
            console.log(res1);
            if(res1 == 'no'){
               console.log("아이디 중복");
               $("#emailRegister").val("");
               alert("사용할 수 없는 email입니다.");
            }
            // alert(res1); 이메일 체크 확인하려고 넣었던 코드 
         }
      });
   });
   
   $("#passwordRegister").change(function(){
      var pw = $("#passwordRegister").val();
       var num = pw.search(/[0-9]/g);
       var eng = pw.search(/[a-z]/ig);
       var spe = pw.search(/[`~!@@#$%^&*]/gi);

       if(pw.length < 8 || pw.length > 20){
        alert("8자리 ~ 20자리 이내로 입력해주세요.");
        $("#passwordRegister").val("");
        return false;
       }else if(pw.search(/\s/) != -1){
        alert("비밀번호는 공백 없이 입력해주세요.");
        $("#passwordRegister").val("");
        return false;
       }else if(num < 0 || eng < 0 || spe < 0 ){
        alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
        $("#passwordRegister").val("");
        return false;
       }else {
         console.log("통과"); 
          return true;
       }
   });
   </script>
   <script>
      // 페이지 로딩되었을때 로그인이 되어있는지 확인
      $(document).ready(function(){
         $.ajax({
            url:"client/loginCheck.do",
            data:{ },
            success: function(res1){
               if(res1 == 'KeepLogin'){
            	   $(".menu_btn").hide();
                   $("#dropdownMenuButton").show();
                   $("#MuiAvatar-root-id").css("visibility","visible");
                   $("#logoutBtn").show();
                  
               }
            }
         });
      });
   </script>
   <script>
   	// My account 클릭시 My_account_profile 페이지로 이동
   	$("#My_account_profile").click(function(){
   		$.ajax({
            url:"member/myPageList.do",
            data:{ },
            success: function(res1){
            	location.href="./My_account_profile.jsp";
               }
   		});
   	});
   
   </script>

</body>
</html>