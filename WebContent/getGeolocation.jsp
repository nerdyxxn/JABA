<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
	String brandName = request.getParameter("brand");
	if(brandName==null) {
		brandName = "스타";  // 예외처리  
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- // 이부분 index.jsp 에 잘 녹여서 사용하세요.
 -->
	<form name="frm">
		<input type="hidden" name="lat2">
		<input type="hidden" name="lon2">		
	</form>
	<script>
	if (navigator.geolocation) {
		var frm = document.frm;
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        //lat2 = 38.5652352; // position.coords.latitude, // 현재 위치의 위도
	        //lon2 = 127.98255359999999; // position.coords.longitude; // 현재 위치의 경도
	        lat2 = position.coords.latitude, // 현재 위치의 위도
	        lon2 = position.coords.longitude; // 현재 위치의 경도
	        console.log(frm.lat2.value);
	        console.log(frm.lon2.value);
	        frm.lat2.value = lat2;
	        frm.lon2.value = lon2;
	        console.log(frm.lat2.value);
	        console.log(frm.lon2.value);
	        frm.action="<%=ctxPath%>/store/storeSearch.do?brand=<%=brandName%>";
	        frm.method="post";
	        frm.submit();
	    })
	}
	</script>
</body>
</html>