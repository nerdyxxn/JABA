<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MODAL -->
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
<style type="text/css">

/* CSS 기본 세팅 */
body {
	font-family: 'Inter', 'Noto Sans KR', sans-serif;
	
}

div {
	display: block;
}

/* input 세팅 */
.signin-input {
   width: 100%;
   height: 40px;
   border-radius: 6px;
   font-weight: normal;
   border: 1px solid rgba(20, 23, 26, .2);
}

/* 모달 전체 세팅 */
.modal-dialog.modal-size {
	width: 555px;
	height: auto;
	margin: 0;
	padding: 0;
}


.modal-content{
	background-color: #f2f3f5;
}


.modal-content.modal-size {
	height: 500px;
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
	text-align: center;
	vertical-align: middle;
}

/* 모달 header 세팅 */
.modal-header {
	padding: 20px;
	display: flex;
	width: 100%;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	border-bottom: 0;
	text-align: center;
	
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
	background-color: #f2f3f5;
}

textarea {
   width: 100%;
   border-radius: 6px;
   font-weight: normal;
   border: 1px solid rgba(20, 23, 26, .2);
}

.text-box{
	display: grid;
	grid-template-columns: 1fr 3fr;
}


.text-content{
	display: grid;
	grid-template-columns: 4fr;
	height: fit-content;
}

#main_form {
	width: 100%;
	height: 150px;
	background: #f2f3f5;
	border-radius: 12px;
	padding: 40px 24px 16px 36px;
	margin-top: 20px;
}

#main_form .asap {
	display: flex;
	flex-wrap: wrap;
	margin-right: 0;
	position: relative;
}

#main_form .later {
	display: flex;
	flex-wrap: wrap;
	margin-right: 0;
	position: relative;
}
/* 모달 footer 세팅 */
.board-modal-footer {
	/*  flex: 0 0 auto;
   display: flex;
   padding: 16px 32px 32px 32px;
   align-items: center;
   justify-content: center; */
	flex-direction: row;
	justify-content: flex-end;
	margin: 20px;
	margin-bottom: -20px;
	border-top: 0;
	
}

.menu_btn{
	display: inline-block;
    justify-content: flex-end;
    background-color: #36727C;
	color: white;
	border-radius: 12px;
	border: 0;
	padding: 10px 20px 10px 20px;
	font-weight: normal;
	text-align: center;
}

</style>
<script>
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
				</div>

				<!-- modal-body -->
					<p>글쓰기</p>
	<form enctype="multipart/form-data"	method="post" action="<%=request.getContextPath()%>/boardInsert.lo"	onsubmit="return writefrm_submit();">
		
		<table border="1">
			<tr>
				<td colspan="2"><a href="boardList">글목록</a></td>
			</tr>
			<tr>
				<td>작성자ID</td>
				<td><input type="text" name="bwriter" id="bwriter"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name ="bsubject" id="bsubject"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name ="bcontent" id="bcontent"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글등록">
					<input type="reset" value="다시작성">
					<input type="button" value="글목록" onclick="window.location='boardList'">
				</td>
			</tr>
		</table>


	</form>
	</div>
	</div>
	</div>
	
</body>
</html>