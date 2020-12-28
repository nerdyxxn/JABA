<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<script type="text/javascript">
	function writefrm_submit(){
		//document.getElementById("bwriter");
		// 유효성 체크 부분 이부분에 넣어 줌
		// 유효성에 문제가 있으면 return false;
		// 유효성에 문제가 없다면 
		return true;
	}
</script>
</head>
<body>

	<p>글쓰기</p>
	<form enctype="multipart/form-data"	method="post" action="<%=request.getContextPath()%>/boardInsert.lo"	onsubmit="return writefrm_submit();">

		<table border="1">
			
			<tr>
				<td>작성자ID</td>
				<td><input type="text" name="bwriter" id="bwriter"></td>
			</tr>

			<tr>
				<td>내용</td>
				<td><input type="text" name ="bcontent" id="bcontent"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글등록">
					<input type="reset" value="다시작성">
					<input type="button" value="글목록" onclick="window.location='adminStoreTotal.do'">
				</td>
			</tr>
		</table>


	</form>
</body>
</html>