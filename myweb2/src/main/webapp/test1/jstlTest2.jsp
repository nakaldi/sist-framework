<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jstlTest2.jsp</h1>
	<form name="fm">
		<fieldset>
			<legend>이름 입력</legend>
			<label>이름</label> <input type="text" name="name" /> <input
				type="submit" value="전달하기" />
		</fieldset>
	</form>
	<hr />
	<%
	String name = request.getParameter("name");
	if (name == null || "".equals(name)) {
	%>
	<h3>앗! 이름을 입력하지 않으셨어요~~</h3>
	<%
	} else {
	%>
	<h3>
		입력된 이름 :
		<%=name%></h3>
	<%
	}
	%>
	<hr />
	<c:if test="${empty param.name }">
		<h3>앗 ! 이름 없다 jstl!</h3>
	</c:if>

	<h3>입력된 이름 : ${param.name }</h3>

	<c:choose>
		<c:when test="${param.name=='킬러' }">
			<h3 style="color: red;">킬러는 입장이 불가합니다</h3>
		</c:when>
		<c:when test="${param.name=='홍길동' }">
			<h3 style="color: red;">홍길동은 입장이 불가합니다</h3>
		</c:when>
		<c:otherwise>
			<h3 style="color: blue;">입장을 환영합니다!</h3>
		</c:otherwise>
	</c:choose>
	<hr/>
</body>
</html>