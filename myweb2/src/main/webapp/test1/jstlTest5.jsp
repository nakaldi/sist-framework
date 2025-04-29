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
	<h1>jstlTest5.jsp</h1>

<h3>hi.jsp?name=kimbeomhee&id=123</h3>
<c:url var="hi" value="hi.jsp">
<c:param name="name">kimbeomhee</c:param>
<c:param name="id">123</c:param>
</c:url>
<h3>${hi }</h3>
<c:catch var="exception">
<%
String str = "a";
int num=Integer.parseInt(str);
%>
</c:catch>
<h4>${exception }</h4>
</body>
</html>