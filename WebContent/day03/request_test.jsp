<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day02 request test</title>
</head>
<body>
	<!-- post_test.html 에서 사용자가 데이터 입력 후 submit 실행하면 url :
		http://localhost:808/jsp01/day03/request_test.jsp		
		query string이 없다.	(개발자도구 F12 - 네트워크 탭 - ctrl + r - url 선택 - payload - form data)
		
		form 태그에서 method 설정 없으면 기본이 'get' : 쿼리 스트링으로 입력값 전달 ( 데이터 조회할 때 사용)
											사용자 요청의 url 인코딩은 기본이 utf-8
								method='post'로 하면 : form data로 입력값 전달 ( 데이터 저장할 때 사용 )
												이 때 form data 인코딩은 직접 설정이 필요하다.
												
										day02의 memberReg.html의 method는 'post'로 한다.
							
							get과 post 방식의 주요한 또 하나의 차이는 보낼 수 있는 데이터의 크기 제한이 다르다.-->
		<%
		
		
			String data1 = request.getParameter("data1");
			String data2 = request.getParameter("data2");		
			String data3 = request.getParameter("data3");	//null		
		
			
			out.print("사용자 입력값 출력 테스트");	//out도 jsp의 내장객체이다.
			out.print("<br>data1=");
			out.print(data1);
			out.print("<br>data2=");
			out.print(data2);
			out.print("<br>data3=");
			out.print(data3);	/*post_test.html 입력요소에 name이 data3이 없다. - null */
			
		
	
			/* 결론 : 사용자 입력오류를 제거하기 위해 
					1) 자바스크립트 유효성 검사하기
					2) 서버단에서 try~catch 로 처리하기
			*/
			
		%>
		
		
</body>
</html>