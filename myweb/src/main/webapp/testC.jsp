<%@page import="java.util.stream.IntStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h1>이것은 html태그에 작성된 문장입니다.</h1>
	<!-- 이것은 html 주석입니다 -->
	<%
	//이곳은 자바코드를 작성할 수 있는 영역
	System.out.println("히히");
	String str = "java";
	System.out.println("str");
	//out : servlet에서 제시한 PrintWriter객체, jsp에서 제공되는 기본 객체
	out.println("이것은 out을 사용해서 출력한 문자열");
	out.println("<h2>str : " + str + "</h2>");
	%>

	<h2>
		str :
		<%=str%></h2>


	<%!public int getSumNumber(int num1, int num2) {
		return num1 + num2;
	}

	String str = "jsp~";%>

	<%
	out.println("3+5=" + getSumNumber(3, 5));
	out.println(str);
	out.println(this.str);
	%>

	<table width="700px">
		<%
		for (int i = 1; i <= 9; i++) {
			out.println("<tr>");
			for (int j = 1; j <= 9; j++) {
				out.println("<td>");
				out.println(i + "*" + j + "=" + i * j);
				out.println("</td>");
			}
			out.println("</tr>");
		}
		%>
	</table>
</body>
</html>