<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복검사</title>
<script>
	function sendIdToParent(id) {
		if (window.opener && !window.opener.closed) {
			window.opener.document.getElementsByName("id")[0].value = id;
			window.close();
		} else {
			alert("부모 창이 존재하지 않습니다.");
		}
	}
</script>
</head>
<body>
	<h2>아이디 중복 검사</h2>
	<form name="fm" method="post">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" /></td>
				<td><input type="submit" name="idCheck" value="중복검사" /></td>
			</tr>
		</table>
	</form>
	<jsp:useBean id="memberDAO" class="com.yong.member.MemberDAO"></jsp:useBean>
	<%
	String id = request.getParameter("id");
	if (id != null && !id.trim().isEmpty()) {
		boolean isDuplicate = memberDAO.idCheck(id);
		// 결과에 따라 JavaScript 경고창 출력
		if (isDuplicate) {
	%>
	<script>
		alert("이미 사용 중인 ID입니다.");
	</script>
	<%
	} else {
	%>
	<script>
		alert("사용 가능한 ID입니다.");
		sendIdToParent("<%=id%>");
	</script>
	<%
	}
	}
	%>

</body>
</html>