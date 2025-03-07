<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css" />
<style>
h2 {
	text-align: center;
	color: black;
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<%!private double calc(double num1, char oper, double num2) {
		switch (oper) {
		case '+':
			return num1 + num2;
		case '-':
			return num1 - num2;
		case '/':
			return num1 / num2;
		case '*':
			return num1 * num2;
		default:
			return 0.0;
		}
	}%>
	<section>
		<article>
			<h1>계산 결과</h1>
			<%
			double num1 = 0;
			if (!"".equals(request.getParameter("num1"))) {
				num1 = Double.parseDouble(request.getParameter("num1"));
			}
			
			double num2 = Double.parseDouble(request.getParameter("num2"));
			char oper = (char) request.getParameter("operator").charAt(0);
			out.print(calc(num1, oper, num2));
			%>

		</article>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>