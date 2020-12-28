<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
<!-- 라디오버튼 CSS -->
<link href="icheck-material.css" rel="stylesheet" type="text/css">

<style type="text/css"></style>


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
}

#info .container {
   display: flex;
   flex-direction: row;
   /*    flex: 1 1 40%; */
   padding: 0 20px;
   width: 80%;
   max-width: 1024px;
   /*    height: 1000px; */
}

#info .container .category {
   font-weight: bold;
   width: auto;
}

#info .container .contents {
   display: flex;
   flex-direction: row;
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

#main_form {
   width: 285px;
   height: 160px;
   background: #f2f3f5;
   border-radius: 12px;
   padding: 30px;
   margin-top: 60px;
   font-size: 14px;
   border: 1px solid rgba(20, 23, 26, .08);
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
   height: 160px;
   background: #f2f3f5;
   border-radius: 12px;
   padding: 20px;
   margin-top: 30px;
   font-size: 14px;
   border: 1px solid rgba(20, 23, 26, .08);
}

.personal_info #personal_name {
   margin-bottom: 10px;
   padding-left: 10px;
   width: 230px;
   height: 30px;
}

.personal_info #personal_pwd {
   padding-left: 10px;
   width: 230px;
   height: 30px;
}

#payment_way .payment_method{
   width: 285px;
   height: 100px;
   background: #f2f3f5;
   border-radius: 12px;
   padding: 30px;
   font-size: 14px;
   border: 1px solid rgba(20, 23, 26, .08);
}

.your_order {
   width: 300px;
   background: #f2f3f5;
   border-radius: 12px;
   padding: 20px;
   margin-top: 60px;
   font-size: 14px;
   border: 1px solid rgba(20, 23, 26, .08);
}

.item_title {
   text-decoration: underline;
   font-weight: bold;
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
   margin: 15px;
}

#right {
   display: flex;
   flex-direction: row;
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
   width: 100%;
}

.btnChk {
   padding: 16px 24px;
   background-color: #FFD966;
   color: white;
   border-radius: 0;
   border: 0;
   font-size: 13px;
   height: 50px;
}
</style>
</head>
<body>
   <!-- HEADER -->
   <header>
      <div class="header_container">
         <div class="logo">
            <img src="./images/jaba_english_white.png">
         </div>
         <div class="menu">
            <button class="menu_btn" value="LOG IN" type="button"
               class="btn btn-primary" data-toggle="modal"
               data-target="#LoginModal">
               <span>LOG IN</span>
            </button>

            <button class="menu_btn" value="SIGN UP" class="btn btn-primary"
               data-toggle="modal" data-target="#registerModal">
               <span>SIGN UP</span>
            </button>
         </div>
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
            <p>Your order from Pizz Aah for Pick up, ASAP</p>
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
                     <a href="#" class="profile"
                        style="text-decoration: none; color: grey; width: 50px;">Checkout</a>
                  </p>
               </div>
               <div class="left_part" id="left">
                  <form id="main_form" action="#" method="get">
                     <table>
                        <tr>
                           <td><div class="pickup_tab">
                                 <h2>PICK UP</h2>
                                 <p>ASAP (40-55 분 소요)</p>
                              </div>
                              <div class="address_tab">
                                 <p>
                                    1889 경복궁로<br>10-12 니모를 찾아서
                                 </p>
                              </div></td>
                        </tr>
                     </table>
                  </form>
                  <div class="personal_info">
                     <h2>이름</h2>
                     <input type="text" id="personal_name" name="personal_name">
                     <h2>전화번호</h2>
                     <input type="text" id="personal_pwd" name="personal_pwd">
                  </div>

                  <div>
                     <form id="payment_way" action="#" method="get">
                        <table>
                           <tr>
                              <td>
                                 <div class="payment_method icheck-material-teal">
                                    <p>Payment method</p>
                                    <input type="radio" id="payment_method" name="teal"
                                       value="agree" checked="checked" onchange="setDisplay()">
                                    <label for="payment_method" style="font-weight: normal;">Pay
                                       with Card</label>
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
                           <div class="coffee">
                              <p class="item_title">COFFEE</p>
                              <p>
                                 정어리 라떼<span>1</span>
                              </p>
                              <p>
                                 데자와에이드<span>1</span>
                              </p>
                              <br>
                           </div>

                        </div>

                        <div class="category2">
                           <div class="non-coffee">
                              <p class="item_title">NON-COFFEE</p>
                              <p>
                                 라떼 정어리<span>1</span>
                              </p>
                              <p>
                                 포도치노<span>1</span>
                              </p>
                              <br>
                           </div>
                           <div class="total">
                              <p class="item_title">TOTAL</p>
                              <p>
                                 50<span>2</span>
                              </p>
                              <br>
                           </div>
                        </div>
                     </div>
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
</body>
</html>