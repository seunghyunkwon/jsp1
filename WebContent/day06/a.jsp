<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a.jsp</title>
</head>
<body>
	<h3>요청 a.jsp</h3>
	<ul>
		<li>요청 URL : <%= request.getRequestURL() %></li>  <!--   L위치(주소)-->
		<li>요청 URL : <%= request.getRequestURI() %></li>  <!--   L위치(주소)-->
		<li>session 애트리뷰트 sdata : <%=session.getAttribute("sdata") %> </li>
		<!-- 실행 순서 : a.jsp 
				index.jsp -->
		<li>application 애트리뷰트 adata : <%=application.getAttribute("adata") %></li>
	</ul>
</body>
</html>