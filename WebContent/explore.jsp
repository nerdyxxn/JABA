<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String ctxPath = request.getContextPath();
String brandName = request.getParameter("brand");
if(brandName==null) {
	brandName = "스타벅스";  // 예외처리  
}
%>
<%
	String avenue = request.getParameter("city");
	String brand = request.getParameter("brand");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>explore</title>
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
$(function(){
   $(window).scroll(function(){
   var navbar = $(this).scrollTop();
   var $header = $('header');
   if(navbar > 0){
       $header.addClass('activated');
   }else{
       $header.removeClass('activated');
   }
   $(".search-term").click(function(){
	   $("#hidden_term").attr("style", "visibility:visible")
   })
   $(".hidden_term_close").click(function(){
	   $("#hidden_term").attr("style", "visibility:hidden")
   })
   
 })
})
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

a{
color: black;
text-decoration: none;
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
#sth {
	width: 100%;
}

#sth .container {
	width: 80%;
	margin: 0 auto;
	padding-top: 15px;
}

section#store-list {
	padding-top: 65px;
}

section .container .store_list_grid {
	display: grid;
	grid-column-gap: 30px;
	grid-row-gap: 30px;
	grid-template-rows: auto;
	min-height: 0;
	min-width: 0;
	grid-template-columns: repeat(3, 1fr);
}

.store_card_image img {
	height: 210px;
	border-radius: 6px;
	width: 100%;
	background: #ebf3fe;
	border: 0;
	position: relative;
	transition: .2s ease-in-out;
	height: 160px;
}

#logoutBtn{
	display:none;
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
				<button id="logoutBtn">LOGOUT</button>
			</div>
		</div>

	</header>
	<!-- SECTION -->
	<section id="home">
		<div class="container">
			<h1>
				<%=brand %><br> <br>
			</h1>

		</div>

	</section>
	<!-- SECTION 2 -->
	<section id="search" class="mini">
		<div class="container">
			<div class="mini_row">
				<div class="time">
					<button>Pick up, ASAP</button>
				</div>
				<div class="search_loc">
					<button id="avenue"><%=avenue%></button>
				</div>
				<div class="search-term">
					<button
						class="MuiButtonBase-root MuiIconButton-root search-term__icon  MuiIconButton-sizeSmall jss263"
						tabindex="0" type="button">
						<span class="MuiIconButton-label"> <svg
								class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24"
								aria-hidden="true" role="presentation">
				<path
									d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z">
				</path>
				</svg>
						</span>
						<div class="MuiTouchRipple-root"></div>
					</button>
				</div>
				<div id="hidden_term">
					<button class="hidden_term_all">
						<div id="hidden_input">
							<input type="text" placeholder="Acai or Latte">
						</div>
						<button class="hidden_term_close">X</button>
					</button>

				</div>
			</div>
		</div>
	</section>
	<!-- SECTION 3 -->
	<section id="sth">
		<div id="store_list">
			<div class="container">
				<div class="row-head">
					<h2>
						PICK UP near <%=avenue%></h2>
				</div>
			</div>
			<div class="container">
				<div class="store_list_grid" id="store_grid">
					<c:if test="${not empty storeList}">
						<c:forEach items="${storeList}" var="storeVO" varStatus="s">
							<!--  주소부분 정확하게 확인하고 수정해야함 -->
							<a href="<%=ctxPath%>/menu/explore.do?storename=${storeVO.store_name}">
								<div class="store_card">
									<div class="store_card_image">
										<img src="<%=ctxPath%>${storeVO.store_img}">
									</div>
									<div class="store_card_info">
										<div class="store_card_info_name">
											<h3>${storeVO.store_name}</h3>
										</div>
										<div class="store_card_info_addr">
											<span class="distance">
											${storeVO.distance} km,
											 </span> <span>OPEN TIME</span>
										</div>
									</div>
								</div>
							</a>
						</c:forEach>
					</c:if>

				</div>
			</div>
		</div>
		<!-- 현재 위치의 좌표 Servlet으로 넘기기 위한 form -->
		<form name="frm">
		<input type="hidden" name="lat2">
		<input type="hidden" name="lon2">		
	</form>
	</section>
	
<div id="map"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7e6cd41f87d7529ffb39adb770099e29&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('<%=avenue%> ', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">검색한 위치</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
    
});  
//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
ps.keywordSearch('<%=avenue%>', placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
</script>
	

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
	// 로그아웃 버튼 눌렀을때 버튼 hide 와 로그아웃 동작
	   $("#logoutBtn").on("click",function(){
      $.ajax({
         url:"<%=ctxPath%>/client/clientLogout.do",
         data:   {},
         success: function(){
            $("#logoutBtn").hide();
         }
      });
   });

	// 페이지 로딩되었을때 로그인이 되어있는지 확인
	$(document).ready(function() {
		$.ajax({
			url : "<%=ctxPath%>/client/loginCheck.do",
			data : {},
			success : function(res1) {
				if (res1 == 'KeepLogin') {
					$("#logoutBtn").show();
				}
			}
		});
	});
</script>
	

</body>
</html>