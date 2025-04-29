<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>elTest.jsp</h1>
	<h3>문자열 출력1 : ${"java" }</h3>
	<h3>문자열 출력2 : ${'jsp' }</h3>
	<h3>정수 : ${10 }</h3>
	<h3>실수 : ${1.23 }</h3>
	<h3>불린 : ${true }</h3>
	<h3>null : ${null }</h3>
	<h3>3+5 : ${3+5 }</h3>
	<h3>"3"+5 : ${"3"+5}</h3>

	<h3>"삼"+5 :</h3>
	<!-- <h3>null+5 : ${null+5 }</h3> -->
	
	<h3>3 / 2 : ${3/2 }</h3>

	<h3>3 % 2 : ${3 % 2 }</h3>

	<h3></h3>
</body>
</html>