<%@page import="koreait.vo.HrdMember"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String custno = request.getParameter("custno");
	out.print("<br>");
	int no=0;
	
/* 	if(custno == null){
		out.print("<script>alert('검색값이 없습니다.');location.href='memberList.jsp';");
		out.print("</script>");
	}else{ */
		try{
			no = Integer.parseInt(custno);		
			HrdMemberDao dao = HrdMemberDao.getInstance();
			HrdMember member = dao.selectOne(no);
			if(member != null){
			request.setAttribute("member",member);
			pageContext.forward("5_updateForm.jsp");
			}else{
				out.print("<script>alert('검색값이 없습니다.');location.href='memberList.jsp';");
				out.print("</script>");
			}
		}catch(NumberFormatException e){
			out.print("<script>alert('잘못된 검색값입니다.');location.href='memberList.jsp';");
			out.print("</script>");
		}
/* } */	


%>