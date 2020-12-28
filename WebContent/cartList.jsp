<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- RESET -->
<link href="html5_reset.css" rel="stylesheet" type="text/css">
<!-- FONT -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter&display=swap"
	rel="stylesheet">
<!-- 체크박스 라디오버튼 css -->
<link href="icheck-material.css" rel="stylesheet" type="text/css">

<style>
/* 슬라이드바 기본 세팅 */
html.open {
	overflow: hidden;
}

.btn {
	width: 50px;
	height: 50px;
	position: absolute;
	right: 0px;
	top: 0px;
	z-index: 1;
	background-image:
		url("http://s1.daumcdn.net/cfs.tistory/custom/blog/204/2048858/skin/images/menu.png");
	background-size: 50%;
	background-repeat: no-repeat;
	background-position: center;
	cursor: pointer;
}

.close {
	width: 24px;
	height: 24px;
	position: absolute;
	left: 15px;
	top: 20px;
	background-image:
		url("https://www.flaticon.com/svg/static/icons/svg/271/271203.svg");
	background-size: 55%;
	background-repeat: no-repeat;
	background-position: center;
	cursor: pointer;
	opacity: 1;
}

#menu {
	width: 450px;
	height: 100%;
	position: fixed;
	top: 0px;
	right: -452px;
	z-index: 10;
	border: 1px solid #c9c9c9;
	background-color: #f9fafc;
	transition: All 0.2s ease;
	-webkit-transition: All 0.2s ease;
	-moz-transition: All 0.2s ease;
	-o-transition: All 0.2s ease;
}

#menu.open {
	right: 0px;
}

.menu.menu-container {
	outline: 0;
	position: relative;
	display: flex;
	justify-content: space-between;
	flex-direction: column;
	right: 0;
	width: 100%;
	height: 100%;
	max-width: 100%;
	padding: 0;
	overflow: hidden;
	background-color: #f9fafc;
	transition: .2s ease-in-out;
}

.page_cover.open {
	display: block;
}

.page_cover {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0px;
	left: 0px;
	background-color: rgba(0, 0, 0, 0.4);
	z-index: 4;
	display: none;
}

/* CSS 기본 세팅 */
body {
	font-size: 14px;
	font-family: 'Inter', 'Noto Sans KR', sans-serif;
	font-weight: 400;
	line-height: 1.43;
}

div {
	display: block;
}

li {
	display: list-item;
	text-align: -webkit-match-parent;
	list-style: none;
}

button {
  --borderWidth: 1;
  --boxShadowDepth: 8; 
  --buttonColor: #f00;
  --horizontalPadding: 16;
  --verticalPadding: 8;

  background: transparent;
  border: calc(var(--borderWidth) * 1px) solid var(--buttonColor);
  
  color: white;
  cursor: pointer;
  font-size: calc(var(--fontSize) * 1rem);
  font-weight: bold;
  outline: 1px;
  padding: calc(var(--verticalPadding) * 1px) calc(var(--horizontalPadding) * 1px);
  transition: box-shadow 0.15s ease;
  border-color: white;
  border-width: 1px;
  border-radius: 20px;
}

button:hover {
  opacity: .3;
  border-color: white;
  border-width: 1px;

}

button:active {
  
}
@keyframes bounce {
	0%, 100%, 20%, 50%, 80% {
		-webkit-transform: translateY(0);
		-ms-transform:     translateY(0);
		transform:         translateY(0)
	}
	40% {
		-webkit-transform: translateY(-30px);
		-ms-transform:     translateY(-30px);
		transform:         translateY(-30px)
	}
	60% {
		-webkit-transform: translateY(-15px);
		-ms-transform:     translateY(-15px);
		transform:         translateY(-15px)
	}
}

/* Header 세팅 */
.MuiButtonBase-root {
/* 	color: inherit; */
	border: 0;
	cursor: pointer;
	margin: 0;
	display: inline-flex;
	outline: 0;
/* 	padding: 0; */
	position: relative;
	align-items: center;
	user-select: none;
/* 	border-radius: 0; */
	vertical-align: middle;
	-moz-appearance: none;
	justify-content: center;
	text-decoration: none;
 	background-color: transparent;
	-webkit-appearance: none;
	-webkit-tap-highlight-color: transparent;
}

.MuiButton-label {
	width: 100%;
	display: inherit;
	align-items: inherit;
	justify-content: inherit;
	font-weight: 500;
	font-family: Inter, sans-serif;
}

.MuiButton-root {
	color: rgba(0, 0, 0, 0.87);
	padding: 16px 24px;
	font-size: 14px;
	min-width: 64px;
/* 	box-shadow: none; */
	box-sizing: border-box;
	transition: background-color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms,
		box-shadow 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms, border 250ms
		cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	font-family: Inter, sans-serif;
/* 	font-weight: 500; */
	line-height: 1.75;
	border-radius: 28px;
/* 	text-transform: none; */
}

.MuiButtonBase-root.MuiButton-root.jss135 {
	color: #36727C;
	border: 1px solid #36727C;
	padding: 12px 15px 12px 15px;
	font-size: 14px;
	background: #ffffff;
	transition: 0.1s ease-in-out;
	font-weight: 500;
	line-height: 1;
	border-radius: 30px;
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

.order-details {
	margin: 30px 30px 0;
	text-align: center;
}

h3 {
	width: 390px;
	height: 25px;
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	font-weight: bold;
	display: block;
}

.order-container .order-details h3 {
	padding: 0 20px;
	font-size: 19.2px;
	font-weight: 600;
	margin: 0;
}

.order-details .order-drawer-fulfilment {
	margin: 12px 0;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}

/* body 세팅 */
#order-items {
	overflow-y: scroll;
	overflow-x: hidden;
	margin: 0 30px;
}

#cart-order-item {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	padding: 12px;
	background: #fff;
	margin-bottom: 12px;
}

#cart-order-item:last-child {
	margin-bottom: 0;
}

.order-container #order-items::-webkit-scrollbar {
	display: none;
}

.order-container .order-actions {
	display: block;
	margin: auto 30px 30px;
}

.order-container .order-actions__totals {
	width: 100%;
	padding: 0 12px 12px;
}

.order-container .order-actions__totals .subtotal {
	display: flex;
	width: 100%;
	justify-content: space-between;
	color: #656565;
	font-weight: 400;
	margin: 6px 0;
	border-bottom: 1px solid rgba(20, 23, 26, .08);
	padding-bottom: 10px;
}

.order-container .order-actions__totals .total {
	font-weight: 500;
	color: #000;
	display: flex;
	width: 100%;
	justify-content: space-between;
	margin: 6px 0;
}

#cart-order-item__quantity {
	background: #eff2f7;
	width: 30px;
	min-width: 30px;
	height: 30px;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	margin-right: 12px;
	font-weight: 500;
}

#cart-order-item__details {
	display: flex;
	flex-direction: column;
	flex-grow: 1;
	max-width: 80%;
	margin-left: 8px;
}

#cart-order-item__details .name {
	font-weight: 500;
	font-size: 16px;
}

#cart-order-item__details .modifiers ul li {
	color: #8492a6;
	font-size: 14px;
}

#cart-order-item__details .modifiers {
	margin-top: 4px;
}

#cart-order-item__details .price {
	margin-top: 4px;
	color: #8492a6;
	font-size: 14px;
}

#MuiIconButton-sizeSmall {
	padding: 3px;
	font-size: 20px;
	flex: 0 0 auto;
	color: rgba(0, 0, 0, 0.54);
	overflow: visible;
	text-align: center;
	transition: background-color 150ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	border-radius: 50%;
}

.MuiIconButton-label {
	width: 100%;
	display: flex;
	align-items: inherit;
	justify-content: inherit;
}

.cart-order-item__remove svg {
	width: 18px;
	height: 18px;
	color: #8492a6;
}

.MuiSvgIcon-root {
	fill: currentColor;
	display: inline-block;
	font-size: 1.5rem;
	transition: fill 200ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	flex-shrink: 0;
	user-select: none;
}

/* 체크아웃 버튼 */
.order-container .order-actions button.checkout {
	text-transform: uppercase;
	width: 100%;
}
.MuiButton-containedPrimary {
    color: #ffffff;
    background-color: #36727C;
}
.MuiButton-label.MuiButton-contained {
    font-size: 12px;
    box-shadow: none;
    font-weight: 600;
}

</style>
</head>
<body>
	<div class="order-container">
		<div onclick="history.back();" class="page_cover"></div>
		<div id="menu" class="menu menu-container">
			<!-- X 버튼  -->
			<div onclick="history.back();" class="close"></div>
			<!-- header -->
			<div class="order-details">
				<h3>SUKI Newstead</h3>
				<div class="order-drawer-fulfilment">
					<button
						class="MuiButtonBase-root MuiButton-root jss135 MuiButton-text"
						tabindex="0" type="button">
						<span class="MuiButton-label">Pick up, ASAP</span><span
							class="MuiTouchRipple-root"></span>
					</button>
				</div>
			</div>
			<!-- body -->
			<div class="order-items" id="order-items">
				<div class="cart-order-item" id="cart-order-item">
					<div id="cart-order-item__quantity">1</div>
					<div id="cart-order-item__details">
						<div class="name">3s A Crowd</div>
						<div class="modifiers">
							<ul>
								<li>Small</li>
								<li>White Rice</li>
							</ul>
							<div class="price">$11.50</div>
						</div>
					</div>
					<button id="MuiIconButton-sizeSmall"
						class="MuiButtonBase-root MuiIconButton-root cart-order-item__remove MuiIconButton-sizeSmall"
						tabindex="0" type="button">
						<span class="MuiIconButton-label"><svg
								class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24"
								aria-hidden="true" role="presentation">
								<path
									d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg></span><span
							class="MuiTouchRipple-root"></span>
					</button>
				</div>
			</div>
			<!-- footer -->
			<div class="order-actions">
				<div class="order-actions__totals">
					<div class="subtotal">
						<span>Subtotal</span><span>$11.50</span>
					</div>
					<div class="total">
						<span>Total</span><span>$11.50</span>
					</div>
				</div>
				<button
					class="MuiButtonBase-root MuiButton-root checkout loader MuiButton-contained MuiButton-containedPrimary MuiButton-fullWidth"
					tabindex="0" type="button">
					<span class="MuiButton-label MuiButton-contained">Go to Checkout</span><span
						class="MuiTouchRipple-root"></span>
				</button>
			</div>
		</div>
		<div class="btn"></div>
	</div>
	<!-- 클릭시 사이드바가 열리는 함수 -->
	<script type="text/javascript" id="rendered-js">
		$(".btn").click(function() {
			$("#menu,.page_cover,html").addClass("open");
			window.location.hash = "#open";
		});

		window.onhashchange = function() {
			if (location.hash != "#open") {
				$("#menu,.page_cover,html").removeClass("open");
			}
		};
	</script>
</body>
</html>


