<%@page import="day01.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp start3</title>
<style type="text/css">
	td{
		boder : 1px solid gray
	}

</style>

</head>
<body>
<%

	MyUser sana = new MyUser("이사나",24,"서울시 강남구 역삼동");

%>


	<table style="width:70%; margin:auto; border-collapse:collapse;">
		<tr>
			<th>이름</th>
			<th>나이</th>
			<th>거주지</th>
		</tr>
		<tr>
		<td><%=sana.getName() %></td>
		<td><%=sana.getAge() %></td>
		<td><%=sana.getAddress() %></td>
		</tr>
	
	</table>
</body>
</html>