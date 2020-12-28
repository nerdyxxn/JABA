<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jaba.store.dao.DBoardDao" %>
<%@ page import="jaba.store.vo.DBoardVO" %>
<%@ page import="jaba.store.model.service.DBoardService" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
</head>
<body>
<% 
int bno = Integer.parseInt(request.getParameter("bno"));
DBoardService dService = new DBoardService(); 
List<DBoardVO> list = dService.getBoard(bno);  // bno를 가지고 읽어왔으므로 list는 0번 인덱스만 존재할 것임.
DBoardVO vo = list.get(0);   //

// 목록보기 시 이전에 보던 페이지로 이동하도록 하기 위함.
String pageNum = request.getParameter("pageNum");
if(pageNum==null){
	pageNum="1";
}
%>
	<p>글 보기</p>
	<form method="post" action="bwrite.jsp">
		<input type="hidden" name="bno" value="<%=bno%>">   <!-- 현재 보고 있는 글의 글 번호를 입력 -->
		<input type="hidden" name="bref" value="<%=vo.getBref()%>">   <!-- 현재 보고 있는 글의 ref를 입력 -->
		<input type="hidden" name="bre_step" value="<%=vo.getBre_step()%>">   <!-- 현재 보고 있는 글의 re_step를 입력 -->
		<input type="hidden" name="bre_level" value="<%=vo.getBre_level()%>">   <!-- 현재 보고 있는 글의 re_level를 입력 -->
		<table border="1">
			<tr>
				<td colspan="2"><a href="boardList">글목록</a></td>
			</tr>
			<tr>
				<td>작성자ID</td>
				<td><%= vo.getBwrite() %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><%= vo.getBsubject() %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><%= vo.getBcontent() %></td>
			</tr>
			<tr>
				<td>파일선택</td>
				<td><%= vo.getBfilepath() %></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><%= vo.getBpwd() %></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="답글작성">
					<input type="button" value="삭제">
					<input type="button" value="글목록" onclick="window.location='blist.jsp?pageNum=<%=pageNum%>'">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>