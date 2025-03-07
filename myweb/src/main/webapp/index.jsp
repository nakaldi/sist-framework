<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css" />
</head>
<body>
<%@include file="header.jsp" %>
	<section>
		<article id="mainImg">
			<img src="img/main.png" alt="MainImage" />
		</article>
		<article id="mainSubMenu">
			<h2>아래에 계속 추가됨.</h2>
			<ul>
				<li><a href="formTest.jsp">formTest.jsp</a></li>
				<li><a href="cal.jsp">cal.jsp</a></li>
				<li><a href="emp.jsp">emp.jsp</a></li>
				<li><a href="emp/emp2.jsp">사원관리프로그램(Beans방식)</a></li>
			</ul>
		</article>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>