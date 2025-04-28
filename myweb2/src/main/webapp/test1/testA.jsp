<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testA.jsp</h1>
	<form name="fm" action="testB.jsp">
		이름:<input type="text" name="name" /> 나이:<input type="text" name="age" />
		<input type="submit" value="전달하기" />
	</form>
</body>
</html>