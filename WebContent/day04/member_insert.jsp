<%@page import="koreait.vo.HrdMember"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day04 멤버 등록</title>
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
/* 방법1)
	HrdMember vo = new HrdMember();
	vo.setCustno(custno);
	vo.setCustName(custname);
	vo.setPhone(phone);
	vo.setAddress(address);
	vo.setCity(city);	
	out.print(vo);
	dao.insert(vo);
	out.print(vo);

 */	 
/* 	방법2) */
	HrdMember vo = new HrdMember(custno, custname, phone, address, null, grade, city);
	dao.insert(vo);
	out.print(dao.selectOne(vo.getCustno()));		//dao.selectOne(vo.getCustNo()) 널이 아니면 정상 등록완료
	if(dao.selectOne(vo.getCustno()) != null){
		out.print("<script>alert('회원등록이 완료되었습니다.');location.href='post_insert.jsp'");
		out.print("</script>");
	} 

%>
</body>
</html>