<%@page import="koreait.vo.HrdMember"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 화면</title>
   <link rel="stylesheet" href="0_hrdkorea.css">
   <script src="0_member_valid.js"></script>
<script type="text/javascript">
   	function isSubmit(){
	const frm = document.forms[0];
		if(valid_check()){
			frm.submit();
		}	
	}
	function init(){
		const frm = document.forms[0];
			frm.name.value="";
			frm.tel.value="";
			frm.addr.value="";
			frm.grade.value="";
			frm.city_code.value="";
		}
</script>
</head>
<body>
<div class="wrap_container">

<%
		String custno = request.getParameter("custno");
		out.print("<br>");
		int no=0;
		
		if(custno == null){	//?custno 자체가 없을 때 http://localhost:808/jsp1/day03/get_result.jsp
			out.print("<script>alert('검색값이 없습니다.');location.href='get_test.jsp';");
			out.print("</script>");
		}else{
			try{
				no = Integer.parseInt(custno);				
			}catch(NumberFormatException e){
			//form 태그 조회값이 없이 실행 됐을 때 http://localhost:808/jsp1/day03/get_result.jsp?custno=	
				out.print("<script>alert('잘못된 검색값입니다.');location.href='get_test.jsp';");
				out.print("</script>");
			}
		}
		HrdMemberDao dao = HrdMemberDao.getInstance();
		HrdMember member = dao.selectOne(no);
		if(member==null){
			out.print("<script>alert('잘못된 검색값입니다.');location.href='get_test.jsp';");
			out.print("</script>");
		}
%>
<% if(member!=null){
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
        <h4 style="text-align: center;">홈쇼핑 회원 정보 수정</h4>
        <form action="6_updateSave.jsp" method="post"> <!--action으로 설정된 url로 입력요소에 작성된 데이터를 서버로 전송한다.-->
        <input type="hidden" name="num" value="<%=member.getCustno()%>">
            <!-- hidden 추가 대신 회원번호 input의 readonly 속성으로한다. -->
            <table style="width: 70%;margin:auto;">
                <tr>
                    <td class="col1_title">회원번호(자동발생)</td>
                    <td><input type="text" name="num" value="<%=member.getCustno() %>"></td> <!--입력요소 데이터 식별하는 속성은 name-->
                </tr>
                <tr>
                    <td class="col1_title">회원성명</td>
                    <td><input type="text" name="name" value="<%=member.getCustName()%>"></td>
                </tr>
                <tr>
                    <td class="col1_title">회원전화</td>
                    <td><input type="text" name="tel" size="30" value="<%=member.getPhone() %>"></td>
                </tr>
                <tr>
                    <td class="col1_title">회원주소</td>
                    <td><input type="text" name="addr" size="40" value="<%=member.getAddress() %>"></td>
                </tr>
                <tr>
                    <td class="col1_title">가입일자</td>
                    <td><input type="text" name="reg_date" value="<%=member.getReg_date()%>"></td>
                </tr>
                <tr>
                    <td class="col1_title">고객등급[A:VIP,B:일반,C:직원]</td>
                    <td><input type="text" name="grade" value="<%=member.getGrade() %>"></td>
                </tr>
                <tr>
                    <td class="col1_title">도시코드</td>
                    <td><input type="text" name="city_code" value="<%=member.getCity() %>"></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center;">
                    <button >수정</button>
                	<button type="button" onclick="init()">조회</button>
                </td>
                </tr>
            </table>
        </form>
    </section>
    <footer>
        HRDKOREA Copyrightⓒ2016 All rights reserved. Human Resources Development Service of Korea.
    </footer>
           	<script type="text/javascript">
            const reg = document.forms[0].reg_date;
            const today = new Date();
            const year = today.getFullYear();
            const month = (today.getMonth()+1).toString().padStart(2,0);
            const day = today.getDate().toString().padStart(2,0);
            reg.value=[year,month,day].join('');
            </script>
     <%
		}
	 %>
</div>
</body>
</html>