<%@page import="koreait.dao.HrdSaleDao"%>
<%@page import="koreait.vo.HrdSaleSum"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 조회</title>
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
	HrdSaleDao dao = HrdSaleDao.getInstance();
	List<HrdSaleSum> list = dao.selectSale();  
	%>
	 <header>
            <h2 class="header-item">쇼핑몰 회원관리 ver1.0</h2>
        </header>
            <nav class="sticky">
                <ul class="container">
                    <li><a href="2_insertForm.jsp"><b>회원등록</b></a></li>
                    <li><a href="4_memberList.jsp"><b>회원목록조회/수정</b></a></li>
                    <li><a href="7_salelist.jsp"><b>회원매출조회</b></a></li>
                    <li><a href="1_index.jsp"><b>홈으로</b></a></li>
                </ul>
            </nav>
        <section>
	<form action="">
	 <table style="width: 70%;margin:auto;">
	<tr>
		<th class="col1_title">회원번호</th>
		<th class="col1_title">회원성명</th>
		<th class="col1_title">고객등급</th>
		<th class="col1_title">매출</th>		
  	</tr>          
<%
		for(int i=0;i<list.size();i++){

%>
	 <tr>
	<td><%=list.get(i).getCustNo() %></td>    
	<td><%=list.get(i).getCustName() %></td>    
	<td><%=list.get(i).getGrade() %></td> 
	<td><%=list.get(i).getSum() %></td>
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