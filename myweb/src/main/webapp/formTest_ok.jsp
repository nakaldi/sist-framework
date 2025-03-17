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
	<%@include file="header.jsp"%>
	<section>
		<article>
			<h1>넘어온 파라미터 확인</h1>
			<%
			String name = request.getParameter("name");
			String password = request.getParameter("pwd");
			String gender = request.getParameter("se");
			String[] hobbies = request.getParameterValues("cbs");
			%>
			<h3>
				넘어온 이름:<%=name%></h3>
			<h3>
				넘어온 비밀번호:<%=password%></h3>
			<h3>
				넘어온 성별:<%=gender%></h3>
			<h3>
				넘어온 취미:<%
			if (hobbies == null) {
				out.print("선택한 취미 없음");
			} else {
				for (int i = 0; i < hobbies.length; i++)
					out.print(hobbies[i] + " ");
			}
			%>
			</h3>
		</article>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>