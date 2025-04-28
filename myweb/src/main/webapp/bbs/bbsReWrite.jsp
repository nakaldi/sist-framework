<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css" />
<style>
table {
	width: 650px;
	margin: 0px auto;
	border-top: 3px double darkblue;
	border-bottom: 3px double darkblue;
	text-align: center;
}

table th {
	background-color: skyblue;
}

div {
	width: 650px;
	margin: 0px auto;
	text-align: center;
}

.full-width {
	width: 100%;
}
</style>
</head>
<body>
	<%@include file="/header.jsp"%>
	<h2>자유게시판 답글쓰기</h2>
	<form name="bbsWrite" action="bbsReWrite_ok.jsp" method="post"
		accept-charset="UTF-8" onsubmit="return validateForm()">
		<input type="hidden" name="ref"
			value="<%=request.getParameter("ref")%>" /> <input type="hidden"
			name="depth" value="<%=request.getParameter("depth")%>" /> <input
			type="hidden" name="orderNum"
			value="<%=request.getParameter("orderNum")%>" />



		<div>
			<input type="text" class="full-width" name="title"
				value="RE)<%=request.getParameter("title")%>" />
		</div>
		<div>
			<textarea name="content" rows="10" class="full-width"></textarea>
		</div>
		<div>
			<input type="text" name="author" placeholder="작성자" /> <input
				type="password" name="pwd" placeholder="비밀번호" /> <input
				type="submit" value="등록" />

		</div>
	</form>

	<%@include file="/footer.jsp"%>
</body>

<script>
	function validateForm() {
		const form = document.forms["bbsWrite"];
		const author = form["author"].value.trim();
		const pwd = form["pwd"].value.trim();
		const title = form["title"].value.trim();
		const content = form["content"].value.trim();

		if (!author) {
			alert("작성자를 입력하세요.");
			form["author"].focus();
			return false;
		}
		if (!pwd) {
			alert("비밀번호를 입력하세요.");
			form["pwd"].focus();
			return false;
		}
		if (!title) {
			alert("제목을 입력하세요.");
			form["title"].focus();
			return false;
		}
		if (!content) {
			alert("내용을 입력하세요.");
			form["content"].focus();
			return false;
		}
		return true; // 모든 필드가 유효한 경우 제출 허용
	}
</script>

</html>