<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
fieldset {
	width: 400px;
	margin: 0px auto;
}

table {
	margin: 0px auto;
}
</style>
</head>
<%
Cookie[] cookies = request.getCookies();
String presetId = "";
String presetCheckbox = "";
for (Cookie cookie : cookies) {
	if ("lastLoggedInId".equals(cookie.getName())) {
		presetId = cookie.getValue();
		presetCheckbox = "checked";
		break;
	}
}
%>
<body>
	<article>
		<form name="loginForm" action="login_ok.jsp" method="POST">
			<fieldset>
				<legend>로그인</legend>
				<table>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" value="<%=presetId%>" /></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pwd" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="checkbox"
							name="rememberId" value="on" <%=presetCheckbox%> />아이디 기억 <input
							type="submit" value="로그인" /></td>
					</tr>
				</table>
			</fieldset>

		</form>
	</article>
</body>
</html>