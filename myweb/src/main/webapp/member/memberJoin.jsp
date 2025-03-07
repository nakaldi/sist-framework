<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css" />
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

<script>
	function openPopup() {
		window
				.open("idCheck.jsp", "중복검사",
						"width=400,height=300,top=200,left=200,scrollbars=no,resizable=no");
	}
</script>
</head>
<body>
	<%@include file="../header.jsp"%>
	<section>
		<article>
			<h2>회원가입</h2>
			<form name="memberJoin" action="memberJoin_ok.jsp">
				<fieldset>
					<legend>회원가입</legend>
					<table>
						<tr>
							<th>ID</th>
							<td><input type="text" name="id" readonly /></td>
							<td><input type="button" name="idCheck" value="중복검사"
								onclick="openPopup();" /></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="text" name="pwd" /></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="name" /></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="email" /></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" name="tel" /></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" name="addr" /></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="회원가입" /><input type="reset" value="초기화" /></td>
						</tr>
					</table>
				</fieldset>

			</form>
		</article>

	</section>


	<%@include file="../footer.jsp"%>
</body>
</html>