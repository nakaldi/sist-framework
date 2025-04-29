<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jstlTest3.jsp</h1>
	<%
	String[] fruits = { "사과", "배", "수박", "포도", "딸기" };
	%>
	<c:set var="fruits" value="<%=fruits%>"></c:set>
	<ul>
		<c:forEach var="fruit" items="${fruits }" varStatus="index">
			<li>${fruit }/${index.count }</li>
		</c:forEach>
	</ul>

	<hr />
	<ul>
		<c:forEach var="i" begin="1" end="10" step="2">
			<li>${i }</li>
		</c:forEach>
	</ul>
</body>
</html>