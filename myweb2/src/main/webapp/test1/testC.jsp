<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testC.jsp</h1>
	<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String tel = (String) request.getAttribute("tel");
	String addr = (String) request.getAttribute("addr");
	%>
	<h3><%=name %></h3>
	<h3><%=age %></h3>
	<h3><%=tel %></h3>
	<h3><%=addr %></h3>
</body>
</html>