<%@page import="koreait.vo.HrdMember"%>
<%@page import="java.util.List"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록 조회</title>
<link rel="stylesheet" href="0_hrdkorea.css">
<style type="text/css">
    th{
        background-color: rgb(117, 255, 166);
        color: black;
    }
    th,td{
        padding: 10px;
        text-align: center;
    }
    td{
    	background-color: antiquewhite;
    	margin-botton: 10px;
    }
</style>
</head>
<body>
<div class="wrap_container">
	<%
		Object temp2 = request.getAttribute("list");
		List<HrdMember> list = (List<HrdMember>)temp2;
	%>
	    <header>
        <h2 class="header-item">쇼핑몰 회원관리 ver1.0</h2>
    </header>
	 <%@include file="top.jsp" %>
	<section>
	<form action="">
	 <table style="width: 70%;margin:auto;">
	<tr>
		<th class="col1_title">회원번호</th>
		<th class="col1_title">회원성명</th>
		<th class="col1_title">전화번호</th>
		<th class="col1_title">주소</th>
		<th class="col1_title">가입일자</th>
		<th class="col1_title">고객등급</th>
		<th class="col1_title">거주지역</th>
		
  	</tr>
  		<%
		for(int i=0;i<list.size();i++){
	%>
  	 <tr>
        <td><a style="color:black;" href="update.jsp?custno=<%=list.get(i).getCustno() %>"><%=list.get(i).getCustno() %></a></td>
        <td><%=list.get(i).getCustName() %></td>    
        <td><%=list.get(i).getPhone() %></td>    
        <td><%=list.get(i).getAddress() %></td>    
        <td><%=list.get(i).getReg_date() %></td>   
        <td><%
			String temp= list.get(i).getGrade();
        	switch(temp){
        	case "A":
        		out.print("VIP");
        		break;
        	case "B":
        		out.print("일반");
        		break;
        	case "C":
        		out.print("직원");
        		break;
        	}
			%></td>   
        <td><%=list.get(i).getCity() %></td>   
	</tr>
	<%
		}
	%>
	</table>
	</form>
</section>
    <footer>
        HRDKOREA Copyrightⓒ2016 All rights reserved. Human Resources Development Service of Korea.
    </footer>
</div>
</body>
</html>