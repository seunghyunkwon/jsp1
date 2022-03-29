<%@page import="java.time.LocalDate"%>
<%@page import="koreait.dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day04 post 요청 처리</title>
<style type="text/css">
td,th{
    border: 1px dotted gray;
}
td.col1_title {
    text-align: center;
    font-weight: bold;
    width: 40%;
    padding: 7px;
}
input[type=text]{
    padding: 5px;
    margin-left: 10px;
}
button {
    padding: 5px 15px;
    margin: 5px;
}
</style>
<!-- src속성에 지정한 자바스크립트 소스가 그대로 삽입된다. -->
<script src="member_valid.js"></script>
<script type="text/javascript">

	function isSubmit(){
	const frm = document.forms[0];
		if(valid_check()){
			// 유호성 검사 통과
			frm.submit();
		}
		
	}
	function init(){
	const frm = document.forms[0];
		frm.name.value="";
		frm.tel.value="";
		frm.addr.value="";
		frm.grade.value="";
		frm.city_code="";
	}
</script>
</head>
<body>

<%

		HrdMemberDao dao = HrdMemberDao.getInstance();
		int next = dao.getNextseq();
		
		/*  
		오늘 날짜 출력을 위한 문자열
		LocalDate today = LocalDate.now(); 
		String str_today = today.fomat(DateTimeFormatter.ofPattern("yyyyMMDD")); //특정패턴 문자열로 변환*/

%>

	<!-- 1) DAO 클래스에 insert() 메소드를 만든다. 
		2) post_insert.jsp 파일을 등록화면에 맞게 수정한다.
		3) member_insert.jsp를 구현하기. ( 사용자 입력값으로 DB테이블에 insert하기 )-->
	
		<h4 style="text-align: center;">회원 등록</h4>
        <form action="member_insert.jsp" method="post">  
        	<input type="hidden" name="num" value="<%=next%>">
            <table style="width:70%;margin:auto;">
                <tr>
                    <td class="col1_title">회원번호</td>
                    <td><input type="text" name="num" value="<%=next %>" disabled="disabled"></td>  <!-- 입력요소 데이터 식별하는 속성은 name -->
                	<!-- disabled가 설정되어 있으면 파라미터값이 전달되지 않는다. : 필요한 값은 hidden으로 전달한다. -->
                </tr>
                <tr>
                    <td class="col1_title">회원성명</td>
                    <td><input type="text" name="name"></td>
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
                    <td><input type="text" name="reg_date"  disabled="disabled"></td>
                </tr>  
                <tr>
                    <td class="col1_title">고객등급<br>[A:VIP,B:일반,C:직원]</td>
                    <td><input type="text" name="grade"></td>
                </tr>  
                <tr>
                    <td class="col1_title">도시코드</td>
                    <td><input type="text" name="city_code"></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <!-- <button>저장</button> -->
                        <button type="button" onclick="isSubmit()">저장</button>
                        <button type="button" onclick="init()">다시쓰기</button>
                        <!-- 다시쓰기는 input태그에 value 속성값을 초기값으로 되돌리는 것입니다. -->
                    </td>
                </tr>

            </table>
            <script type="text/javascript">
            const reg = document.forms[0].reg_date;
            const today = new Date();
            const year = today.getFullYear();
            const month = (today.getMonth()+1).toString().padStart(2,0);
            const day = today.getDate().toString().padStart(2,0);
            reg.value=[year,month,day].join('');
            </script>
        </form>
</body>
</html>