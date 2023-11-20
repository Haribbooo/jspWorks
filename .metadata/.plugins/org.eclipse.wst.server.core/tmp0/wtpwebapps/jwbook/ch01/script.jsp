<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- 스크립트릿 사용하기  -->
		<h2> html에서 jsp 사용하기</h2>
	<%
		int n1 =  10, n2 =20;
		//내장 객체 -out.println() 함수 사용 
		out.println( "두수의 곱 :" + n1+n2); 
		
		//1 부터 10까지 자연수중 짝수 출력
		for(int  i =1; i<=10; i++){
			
		}
	%>
	<h3> 합계 : <%=n1+n2 %></h3>
</body>
</html>