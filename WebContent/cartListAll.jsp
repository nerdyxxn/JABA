<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap 링크 수정됐음 반드시 체크요망!!!!!!!!!!!!!!!!! -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<!-- 리셋 css -->
<link href="html5_reset.css" rel="stylesheet" type="text/css">
<!-- 폰트 css -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter&display=swap"
	rel="stylesheet">

<style type="text/css">
/* CSS 기본 세팅 */
body {
	font-family: 'Inter', 'Noto Sans KR', sans-serif;
	line-height: 1.42857143;
}

div {
	display: block;
}

p {
	margin: 0 0 10px;
}

ul {
	display: block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
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

.MuiButton-root {
	color: rgba(0, 0, 0, 0.87);
	padding: 16px 24px;
	font-size: 14px;
	min-width: 64px;
	box-shadow: none;
	box-sizing: border-box;
	transition: background-color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms,
		box-shadow 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms, border 250ms
		cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	font-family: Inter, sans-serif;
	font-weight: 500;
	line-height: 1.75;
	border-radius: 28px;
	text-transform: none;
}

.MuiButton-label {
	width: 100%;
	display: inherit;
	align-items: inherit;
	justify-content: inherit;
}

.cart-select-button {
	border: 1px solid #c7c7c7 !important;
}

.jss154 {
	padding: 7px 20px;
	min-width: unset;
	border-radius: 8px;
}

.cart-select-button svg {
	fill: #5b52ff;
}

svg[Attributes Style] {
	width: 20;
	height: 24;
	fill: none;
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

.jss155 {
	padding: 24px;
	font-weight: 500;
}

.MuiMenu-paper {
	padding: 0px;
	max-height: calc(100% - 96px);
	-webkit-overflow-scrolling: touch;
}

.MuiPopover-paper {
	outline: 0;
	position: absolute;
	max-width: calc(100% - 32px);
	min-width: 16px;
	max-height: calc(100% - 32px);
	min-height: 16px;
	overflow-x: hidden;
	overflow-y: auto;
}

.MuiPaper-elevation8 {
	box-shadow: 0px 5px 5px -3px rgba(0, 0, 0, 0.2), 0px 8px 10px 1px
		rgba(0, 0, 0, 0.14), 0px 3px 14px 2px rgba(0, 0, 0, 0.12);
}

.MuiPaper-root {
	color: rgba(0, 0, 0, 0.87);
	transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	background-color: #fff;
}

@media screen and (min-width: 26.563em) {
	.cart-select-menu__dropdown {
		width: 400px;
		max-width: 400px;
		border-radius: 12px !important;
		box-shadow: 0 0 0 1px rgba(26, 26, 26, .08), 0 4px 8px
			rgba(26, 26, 26, .04), 0 12px 32px rgba(26, 26, 26, .16);
	}
}

.cart-select-menu__dropdown {
	width: 100%;
	max-width: 100vw !important;
	border-radius: 0 0 12px 12px !important;
	box-shadow: 0 0 0 1px rgba(26, 26, 26, .08), 0 4px 8px
		rgba(26, 26, 26, .04), 0 12px 32px rgba(26, 26, 26, .16);
}

.MuiList-root {
	margin: 0;
	padding: 0;
	position: relative;
	list-style: none;
}

.MuiMenu-list {
	outline: 0;
}

.dropdown-menu.show {
	padding: 24px;
	font-weight: 500;
	border: 0;
	position: absolute;
	color: rgba(0, 0, 0, 0.87);
	transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	background-color: #fff;
	box-shadow: 0px 5px 5px -3px rgba(0, 0, 0, 0.2), 0px 8px 10px 1px
		rgba(0, 0, 0, 0.14), 0px 3px 14px 2px rgba(0, 0, 0, 0.12);
	width: 400px;
	max-width: 400px;
	border-radius: 12px !important;
}

#cart-select-menu__heading {
    font-size: 12px;
    color: #656565;
    font-weight: 600;
    text-transform: uppercase;
    margin-bottom: 16px;
}

.venue-cart {
    margin-bottom: 16px;
    border-radius: 12px;
    padding: 16px;
    background-color: #f5f5f5;
    display: flex;
    justify-content: space-between;
    transition: .1s linear;
    border: 1px solid transparent;
}

.venue-cart-meta__name {
    color: #14171a;
    font-weight: 600;
    font-size: 1rem;
    margin-bottom: 4px;
}

.venue-cart-meta__items {
    color: #656565;
    font-size: 14px;
    font-weight: 400;
    margin-bottom: 16px;
}

.venue-cart-meta__discard {
    position: relative;
    z-index: 999;
    width: fit-content;
    font-size: 12px;
}

.venue-cart-icon {
    pointer-events: none;
    display: inline-flex;
    padding: 6px 12px;
    border-radius: 8px;
    height: 100%;
    align-items: center;
}

svg[Attributes Style] {
    width: 20;
    height: 20;
    fill: none;
}
</style>
</head>

<body>
	<div class="d-flex">
		<div class="dropdown mr-1">
			<button type="button" class="btn btn-secondary dropdown-toggle"
				id="dropdownMenuOffset" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false" data-offset="10,20">Offset</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
				<div class="dropdown-item items" style="padding: 0;">
					<ul class="MuiList-root MuiMenu-list MuiList-padding" role="menu"
						tabindex="0">
						<li id="cart-select-menu__heading">Incomplete Orders</li>
						<li class="venue-cart"><div class="venue-cart-meta">
								<div class="venue-cart-meta__name">SUKI Newstead</div>
								<div class="venue-cart-meta__items">
									Pick up, ASAP<br>2 items<span>•</span>$23.00 subtotal
								</div>
								<div class="venue-cart-meta__discard"
									style="color: rgb(91, 82, 255);">Discard</div>
							</div>
							<div class="venue-cart-icon"
								style="background-color: rgb(91, 82, 255);">
								<svg width="20" height="20" viewBox="0 0 20 20" fill="none"
									class="icon">
									<path d="M4.16666 10H15.8333" stroke="white" stroke-width="2"
										stroke-linecap="round" stroke-linejoin="round"></path>
									<path d="M10 4.16667L15.8333 10L10 15.8333" stroke="white"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"></path></svg>
							</div></li>
						<li class="venue-cart"><div class="venue-cart-meta">
								<div class="venue-cart-meta__name">YOI Indonesian Fusion</div>
								<div class="venue-cart-meta__items">
									Pick up, ASAP<br>1 item<span>•</span>$17.80 subtotal
								</div>
								<div class="venue-cart-meta__discard"
									style="color: rgb(91, 82, 255);">Discard</div>
							</div>
							<div class="venue-cart-icon"
								style="background-color: rgb(91, 82, 255);">
								<svg width="20" height="20" viewBox="0 0 20 20" fill="none"
									class="icon">
									<path d="M4.16666 10H15.8333" stroke="white" stroke-width="2"
										stroke-linecap="round" stroke-linejoin="round"></path>
									<path d="M10 4.16667L15.8333 10L10 15.8333" stroke="white"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"></path></svg>
							</div></li>
					</ul>
				</div>
			</div>
		</div>

		<button
			class="MuiButtonBase-root MuiButton-root jss154 cart-select-button false MuiButton-text"
			tabindex="0" type="button" id="cart-selector">
			<span class="MuiButton-label"><svg width="20" height="24"
					viewBox="0 0 22 26" fill="none">
					<path fill-rule="evenodd" clip-rule="evenodd"
						d="M7 2H15V6H7V2ZM5 2V6H0V23C0 24.6569 1.34315 26 3 26H19C20.6569 26 22 24.6569 22 23V6H17V2L15 0H7L5 2ZM9.80583 21.1304L9.69579 15.4386C10.356 15.3595 10.7961 14.8325 10.7961 14.2001V10.4055C10.7961 10.1947 10.6311 10.0366 10.411 10.0366C10.1909 10.0366 10.0259 10.1947 10.0259 10.4055V13.5149C10.0259 13.594 9.97087 13.673 9.86084 13.673H9.44822C9.3657 13.673 9.28317 13.6203 9.28317 13.5149V10.4055C9.28317 10.1947 9.11812 10.0366 8.89806 10.0366C8.67799 10.0366 8.51295 10.1947 8.51295 10.4055V13.5149C8.51295 13.594 8.45793 13.673 8.3479 13.673H7.93528C7.85275 13.673 7.77023 13.6203 7.77023 13.5149V10.4055C7.77023 10.1947 7.60518 10.0366 7.38511 10.0366C7.16505 10.0366 7 10.1947 7 10.4055V14.2001C7 14.8588 7.49515 15.3859 8.15534 15.4386L8.04531 21.1304C8.0178 21.6047 8.43042 22 8.92557 22C9.42071 22 9.80583 21.6047 9.80583 21.1304ZM14.0146 16.8352H14.6472C15.1149 16.8352 15.4725 16.4663 15.5 16.0446L15.39 14.5163C15.3074 13.4359 15.0599 12.3818 14.6472 11.3805C14.3447 10.669 13.6845 10.142 12.8867 10.0102C12.6942 9.95751 12.5016 10.1156 12.5016 10.3264L12.3641 21.1304C12.3366 21.6047 12.7492 22 13.2443 22C13.7395 22 14.1246 21.6047 14.1246 21.1304L14.0146 16.8352Z"></path></svg></span><span
				class="MuiTouchRipple-root"></span>
		</button>
	</div>
</body>

</html>