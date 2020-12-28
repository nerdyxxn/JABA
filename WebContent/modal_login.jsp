<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
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

<style type="text/css">

/* CSS 기본 세팅 */
body {
	font-family: 'Inter', 'Noto Sans KR', sans-serif;
}

div {
	display: block;
}

/* input박스 전체 세팅 */
input {
	border: none;
	width: 378px;
}
.signin-input {
	width: 100%;
	height: 40px;
	color: #14171a;
	font-size: 13px;
	border-radius: 6px;
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

	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#exampleModal">Launch demo modal</button>

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
					<div class="header-icon"
						style="stroke: rgb(54, 114, 124); background-color: rgba(54, 114, 124, 0.12);">
						<svg height="32" viewBox="0 0 32 32" width="32">
                     <path
								d="m28 2.66666667-2.6666667 2.66666666m-10.1466666 10.14666667c1.8732867 1.8483505 2.6125307 4.5587607 1.9370876 7.1022582-.6754432 2.5434974-2.6619987 4.5300529-5.2054961 5.2054961-2.54349751.6754431-5.25390769-.0638009-7.1022582-1.9370876-2.77912954-2.8774452-2.73938408-7.4512884.08933045-10.2800029 2.82871452-2.8287145 7.40255775-2.86846 10.28000285-.0893305zm0 0 5.48-5.48m0 0 4 4 4.6666666-4.66666667-4-4m-4.6666666 4.66666667 4.6666666-4.66666667"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2.666667"></path></svg>
					</div>
					<div class="header-title"
						style="font-weight: bold; font-size: 24px;">
						<p>Sign in to JABA</p>
					</div>
					<div class="header-subtitle">
						<p>
							Don't have an account?&nbsp;<a href="#" class="register">Sign
								up now</a>
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
						<br> <span style="font-weight: bold;">
							<p>Password
						</span> <span style="float: right"> <a href="#"
							style="font-weight: normal;">Forgot&nbsp;password?</a>
							</p>

						</span> <input type="text" class="signin-input" id="pwd" name="pwd">
					</div>
				</div>

				<!-- modal-footer -->
				<div class="modal-footer">
					<button type="button" class="btnChk" id="signin" name="signin">Sign
						in</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>