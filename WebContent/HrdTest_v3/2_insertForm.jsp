<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록 화면</title>
<link rel="stylesheet" href="0_hrdkorea.css">
<script src="0_member_valid.js"></script>
<script type="text/javascript">
   	function isSubmit(){
	const frm = document.forms[0];
		if(valid_check()){
			frm.submit();
		}	
	}
</script>
</head>
<body>
<div class="wrap_container">
<%-- <%
	//jstl 라이브러리를 사용하면 이 코드는 작성하지 않는다.
	Object temp = request.getAttribute("next");
	int next = (int)temp;	//형변환
%> el로 대체 --%>
 <header>
            <h2 class="header-item">쇼핑몰 회원관리 ver1.0</h2>
        </header>
          <!-- top.jsp를 include -->
          <%@include file="top.jsp" %>
          
    <section>
        <h4 style="text-align: center;">홈쇼핑 회원 등록</h4>
        <form action="3_insertSave.jsp" method="post"> <!--action으로 설정된 url로 입력요소에 작성된 데이터를 서버로 전송한다.-->
        <input type="hidden" name="num" value="${next }">
            <table style="width: 70%;margin:auto;">
                <tr>
                    <td class="col1_title">회원번호(자동발생)</td>
                    <td><input type="text" name="num" value="${next }"></td> <!--입력요소 데이터 식별하는 속성은 name-->
                </tr>
                <tr>
                    <td class="col1_title">회원성명</td>
                    <td><input type="text" name="name" required></td>
                    <!-- required="required"를 간단히 표현 -->
                </tr>
                <tr>
                    <td class="col1_title">회원전화</td>
                    <td><input type="text" name="tel" size="30"></td>
                </tr>
                <tr>
                    <td class="col1_title">회원주소</td>
                    <td><input type="text" name="addr" size="40"></td>
                </tr>
                <tr>
                    <td class="col1_title">가입일자</td>
                    <td><input type="text" name="reg_date"></td>
                </tr>
                <tr>
                    <td class="col1_title">고객등급[A:VIP,B:일반,C:직원]</td>
                    <td><input type="text" name="grade"></td>
                </tr>
                <tr>
                    <td class="col1_title">도시코드</td>
                    <td><input type="text" name="city_code"></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center;">
                    <button type="button" onclick="isSubmit()">등록</button>
                    <button onclick="location.href='4_memberList.jsp'">조회</button>
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
</div>
</body>
</html>