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
			<h2>자바빈테스트</h2>
			<form name="beanTest" action="beanTest_ok.jsp">
				<fieldset>
					<legend>자바빈테스트</legend>
					<table>
						<tr>
							<th>이름</th>
							<td><input type="text" name="name" /></td>
						</tr>
						<tr>
							<th>나이</th>
							<td><input type="text" name="age" /></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" name="address" /></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" name="phone" /></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="submit" /><input type="reset" value="reset" /></td>
						</tr>

					</table>
				</fieldset>
			</form>
		</article>
	</section>

	<%@include file="footer.jsp"%>
</body>
</html>