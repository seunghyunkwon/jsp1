<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   <!-- page 지시자 : -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day01_jsp start</title>
</head>
<body>

<%

	//스크립트릿: html 문서안에서 자바코드가 작성되는 부분
	String[] names = {"박세리", "허재", "김연경", "안정환"};
	for(int i=0;i<names.length;i++){
		

%>
	<!-- HTML 태그를 작성할 수 있다. -->
	<!-- 3)표현식 : 데이터를 html문서에 출력 (변수,수식결과,메소드리턴값) -->
	<li><%= names[i]%></li> <!-- li태그요소가 for반복횟수만큼 생성 -->
<%
	}	//for종료
%>

</body>
<!-- JSP 파일에 사용되는 기호 : 지시자, 스크립트릿(scriptlet), 표현식(변수, 계산식, 메소드 등) -->
</html>