<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- memberREg.html 에서 입력한 7개의 사용자 입력값을 전달받아서 table 태그에 출력하세요. -->
<%
	
	request.setCharacterEncoding("UTF-8");	//method='post'에서는 꼭 필요	

	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	int age = Integer.parseInt(request.getParameter("age"));	//프론트엔드에서 유효성 검사를 했다는 조건
	String addr = request.getParameter("addr");
	String gender = request.getParameter("gender");
	String[] hobby = request.getParameterValues("hobby");	//배열을 가져오기위해 getParameterValues가 필요 변수타입은 String[]
	String hobbies = Arrays.toString(request.getParameterValues("hobby"));	//배열을 문자열로 변경
	
	
/* 	out.print("회원등록 입력값 확인<br>");
	out.print("<table>");
	out.print("<tr>");
	out.print("<th>이름</th>");
	out.print("<td>"+name+"</td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<th>비밀번호</th>");
	out.print("<td>"+password+"</td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<th>이메일</th>");
	out.print("<td>"+email+"</td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<th>나이</th>");
	out.print("<td>"+age+"</td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<th>주소</th>");
	out.print("<td>"+addr+"</td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<th>성별</th>");
	out.print("<td>"+gender+"</td>");
	out.print("</tr>");	 */
/* 	out.print("<tr>");
	out.print("<th>취미</th>");
	out.print("<td>"+hobby+"</td>");
	out.print("</tr>"); */
	
%>

<table>
	<tr>
		<th>이름</th>
		<td><%=name%></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><%=password%></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><%=email%></td>
	</tr>
	<tr>
		<th>나이</th>
		<td><%=age%></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><%=addr%></td>
	</tr>
	<tr>
		<th>성별</th>
		<td><%=gender.equals("male")? "남성":"여성"%></td>
	</tr>
	<tr>
 		<th>취미</th>
		<td><%=hobby%></td>
	</tr>


</table>
</body>
</html>