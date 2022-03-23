<%@page import="day01.Product"%>
<%@page import="day01.ProductDao"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product list</title>
<style type="text/css">
	table{
		width:70%;margin:auto;border-collapse: collapse;
	}
	caption {
		text-align: right;font-size: 0.8em;
	}
	td,th{
		border : 1px solid gray;text-align: center;padding: 7px 4px;
	}
	th{
		background-color: green;color:white;
	}
</style>
</head>
<body>
<!-- 오라클과 jdbc 연결을 위해서 ojdbc6.jar 라이브러리 추가해야한다.
	[WebContent 폴더] - [WEB-INF폴더] - [lib] 폴더에 파일을 복사한다. -->
<%
	ProductDao dao = ProductDao.getProductDao();
	List<Product> pd = dao.selectAll();
%>

	<h3>TBL_PRODUCT# 테이블 데이터</h3>
	<table>
		<caption>현재 날짜: <%= LocalDate.now() %></caption>
		<tr>
			<th>회원ID</th>
			<th>회원이름</th>
			<th>이메일</th>
			<th>나이</th>
		</tr>
		<%
			for(int i=0;i<pd.size();i++){
				Product product = pd.get(i);
		%>
		<tr>	<!-- MyUser 타입 객체의 데이터를 출력 -->
			<td><%= product.getPcode() %></td>
			<td><%= product.getCategory() %></td>
			<td><%= product.getPname() %></td>
			<td><%= product.getPrice() %></td>
		</tr>
		<%
			}
		%>
	
	</table>
</body>
</html>