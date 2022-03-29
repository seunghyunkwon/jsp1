<%@page import="koreait.vo.HrdMember"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 처리</title>
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
	dao.update(vo);
	
	out.print("<script>alert('정보수정이 완료되었습니다.');location.href='1_index.jsp'");
	out.print("</script>");
%>

<!-- 회원수정이 완료되면 1_index.jsp url로 이동하도록 해보기 -->
</body>
</html>