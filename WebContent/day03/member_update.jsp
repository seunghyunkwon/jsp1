<%@page import="koreait.vo.HrdMember"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	HrdMemberDao dao = HrdMemberDao.getInstance();
	HrdMember vo = new HrdMember();

	String phone = request.getParameter("tel");
	String address = request.getParameter("addr");
	String city = request.getParameter("city_code");
	int custno = Integer.parseInt(request.getParameter("num"));
	
	vo.setAddress(address);
	vo.setPhone(phone);
	vo.setCity(city);
	vo.setCustno(custno);
	out.print(vo);
	
	dao.update(vo);
	out.print(dao.selectOne(custno));
%>

</body>
</html>