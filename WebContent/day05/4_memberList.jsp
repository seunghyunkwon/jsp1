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
		String find = request.getParameter("search_name");	
	
		HrdMemberDao dao = HrdMemberDao.getInstance();
		List<HrdMember> list = dao.selectAll(); 
		
		if(find == null || find.length()==0)
		list = dao.selectAll();			//전체 리스트
		else
		list = dao.searchName(find);	//이름으로 조회한 리스트
	%>
	    <header>
        <h2 class="header-item">쇼핑몰 회원관리 ver1.0</h2>
    </header>
	            <nav class="sticky">
                <ul class="container">
                    <li><a href="2_insertForm.jsp"><b>회원등록</b></a></li>
                    <li><a href="4_memberList.jsp"><b>회원목록조회/수정</b></a></li>
                    <li><a href="7_saleList.jsp"><b>회원매출조회</b></a></li>
                    <li><a href="1_index.jsp"><b>홈으로</b></a></li>
                </ul>
            </nav>
	<section>
	<h2 style="text-align:center;" class="section"><strong>회원목록조회/수정</strong></h2>
	<form action="4_memberList.jsp">
		<input name="search_name" placeholder="검색할 이름 입력">
		<button>검색</button>
		<button type="button" onclick="location.href='4_memberList.jsp'">전체보기</button>
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
  		if(list.size() != 0){	//리스트에 데이터가 있을 때에만 실행
			for(int i=0;i<list.size();i++){
		%>
  	 <tr>
        <td><a style="color:black;" href="5_updateForm.jsp?custno=<%=list.get(i).getCustno() %>"><%=list.get(i).getCustno() %></a></td>
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
  	}else { 	//list에 데이터가 없을 때
	%>
		<tr>
		<td colspan="7">조회 결과가 없습니다.</td>
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