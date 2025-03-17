<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.Instant"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css" />
<script>
function openPopup(){
	window.open('popup.jsp', 'popup', 'width=450, height=400');
}
</script>
</head>
	<%
	Cookie[] cks = request.getCookies();
	String msg = "첫방문이시군요!";
	boolean existsPopupck = false;
	if (cks != null) {
		for (Cookie ck : cks) {
			if ("visitedAt".equals(ck.getName())) {
				long visitedAt = 0;
				visitedAt = Long.parseLong(ck.getValue());
	
				// 에포크 타임을 LocalDateTime으로 변환
				LocalDateTime dateTime = LocalDateTime.ofInstant(Instant.ofEpochSecond(visitedAt), ZoneId.systemDefault());
				// 원하는 포맷으로 출력
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년MM월dd일 HH시mm분ss초");
				String formattedDate = dateTime.format(formatter);

				msg = "마지막 방문일시 : <br>" + formattedDate;
				break;
			}
			if("popupck".equals(ck.getName())){
				existsPopupck = true;
			}
		}
		Cookie ck_visitedAt = new Cookie("visitedAt", Long.toString(System.currentTimeMillis() / 1000));
		ck_visitedAt.setMaxAge(60 * 60 * 24 * 30);
		response.addCookie(ck_visitedAt);
	}
	%>
<body <%=existsPopupck?"":"onload='openPopup()'" %>>
	<%@include file="header.jsp"%>

	<section>
		<article id="mainImg">
			<img src="img/main.png" alt="MainImage" />
		</article>
		<article id="mainSubMenu">
			<h3><%=msg%></h3>
			<h2>아래에 계속 추가됨.</h2>
			<ul>
				<li><a href="formTest.jsp">formTest.jsp</a></li>
				<li><a href="cal.jsp">cal.jsp</a></li>
				<li><a href="emp.jsp">emp.jsp</a></li>
				<li><a href="emp/emp2.jsp">사원관리프로그램(Beans방식)</a></li>
				<li><a href="phonebook/phonebookForm.jsp">전화번호부(복습)</a></li>
				<li><a href="filebbs/fileBbs.jsp">심플 자료실</a></li>
				<li><a href="imggallery/imgGallery.jsp">이미지 갤러리</a></li>

			</ul>
		</article>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>