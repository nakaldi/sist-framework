<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testB.jsp</h1>
	<%
	request.setAttribute("addr", "서울");
	request.setAttribute("tel", "010-1234-5678");
	//response.sendRedirect("testC.jsp");
	%>
	<jsp:forward page="testC.jsp"/>
</body>
</html>