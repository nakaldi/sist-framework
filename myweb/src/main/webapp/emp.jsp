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
}

fieldset {
	width: 400px;
	margin: 0px auto;
}

table {
	margin: 0px auto;
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<section>
		<article>
			<h2>사원관리프로그램(원시형)</h2>
			<form name="empAdd" action="empAdd_ok.jsp">
				<fieldset>
					<legend>사원등록</legend>
					<table>
						<tr>
							<th>사원이름</th>
							<td><input type="text" name="name" /></td>
						</tr>
						<tr>
							<th>E-mail</th>
							<td><input type="text" name="email" /></td>
						</tr>
						<tr>
							<th>부서명</th>
							<td><input type="text" name="dept" /></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="submit" /><input type="reset" value="reset" /></td>
						</tr>

					</table>
				</fieldset>
			</form>
		</article>
		<article>
			<form name="empUpdateSel" action="empUpdate.jsp">
				<fieldset>
					<legend>수정</legend>
					<table>
						<tr>
							<th>사원번호</th>
							<td><input type="text" name="idx" /></td>
							<td><input type="submit" name="정보수정" /></td>
						</tr>
					</table>

				</fieldset>
			</form>
		</article>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>