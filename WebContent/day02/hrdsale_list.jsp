<%@page import="day02.vo.SaleSum"%>
<%@page import="java.util.List"%>
<%@page import="day02.dao.HrdProblemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hrd sale list</title>
</head>
<body>
<ul>
<%
		out.print("<script>alert('조회가 완료되었습니다.')");
		out.print("</script>");
	HrdProblemDao dao = HrdProblemDao.getHrdProblemDao();
	List<SaleSum> list = dao.selectSale();
		for(int i=0;i<list.size();i++){
	//테스트		out.print(list.get(i));
	//테스트		out.print("<br>");
%>
	<li><%= list.get(i).getCustNo() %></li>
	<li><%= list.get(i).getCustName() %></li>
	<li><%= list.get(i).getGrade()%></li>
	<li style="padding-bottom: 20px"><%= list.get(i).getSum() %></li>
<%	
		}
%>
</ul>
</body>
</html>