<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>C.jsp</title>
</head>
<body>
	<!-- 출력 -->
	<h3>요청 C.jsp</h3>
	<ul>
		<li>요청 URL : <%= request.getRequestURL() %></li>  <!--   L위치(주소)-->
		<li>요청 URL : <%= request.getRequestURI() %></li>  <!--   L위치(주소)-->
		<li>data 이름의 애트리뷰트 : <%=request.getAttribute("data") %></li>
		<li>name 이름의 파라미터 : <%=request.getParameter("name") %></li>
	</ul>
</body>
</html>