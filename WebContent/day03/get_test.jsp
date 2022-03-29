<%@page import="koreait.vo.HrdMember"%>
<%@page import="java.util.List"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day03 Hrd Member List</title>
</head>
<body>
	<%
		//테이블의 데이터 모두 가져오기 
HrdMemberDao dao = HrdMemberDao.getInstance();
		List<HrdMember> list = dao.selectAll(); 
	%>
	

	<h3>Hrd Member List</h3>
	<hr>
	<ul>
	<%
		for(int i=0;i<list.size();i++){
	%>
		<!-- get 방식의 오청을 보낸다. 1)요청url에 쿼리스트링으로 조회할 값을 전달한다. -->
		<li><a href="get_result.jsp?custno=<%=list.get(i).getCustno() %>"><%=list.get(i).getCustno() %></a>
			:<%=list.get(i).getCustName() %>
		</li>
		
	<%
		}
	%>
	</ul>
		<!-- 2) 검색값을 입력받아 처리할때에는 form을 사용
		실행된 url : http://localhost:808/jsp01/day03/get_result.jsp?no=100001 -->
		<hr>
		<form action="get_result.jsp">	<!-- method='get' 생략 -->
		<input name="custno" placeholder="회원번호 입력">	<button>조회</button>	
		
		</form>
</body>
</html>