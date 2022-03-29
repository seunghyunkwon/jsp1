<%@page import="koreait.vo.HrdMember"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록 처리</title>
   <link rel="stylesheet" href="0_hrdkorea.css">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	HrdMemberDao dao = HrdMemberDao.getInstance();
	
	int custno =  Integer.parseInt(request.getParameter("num"));
	String custname = request.getParameter("name");
	String phone =  request.getParameter("tel");
	String address = request.getParameter("addr");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city_code");
	
	HrdMember vo = new HrdMember(custno, custname, phone, address, null, grade, city);
	dao.insert(vo);
	out.print(dao.selectOne(vo.getCustno()));		//dao.selectOne(vo.getCustNo()) 널이 아니면 정상 등록완료
	if(dao.selectOne(vo.getCustno()) != null){
		out.print("<script>alert('회원등록이 완료되었습니다.');location.href='1_index.jsp'");
		out.print("</script>");
	} 

%>
<!-- 회원등록이 완료되면 1_index.jsp url로 이동하도록 해보기 -->
</body>
</html>