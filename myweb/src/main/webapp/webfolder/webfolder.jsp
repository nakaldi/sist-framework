<%@page import="com.yong.webfolder.WebFolder"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css" />
<style>
h2 {
	text-align: center;
	color: skyblue;
}

section li {
	list-style-type: none;
}

section label {
	width: 100px;
}

table {
	width: 550px;
	margin: 0px auto;
	border-top: 3px double darkblue;
	border-bottom: 3px double darkblue;
}

table th {
	background-color: skyblue;
}

meter {
	width: 200px;
}
</style>
</head>

<%
String sid = (String) session.getAttribute("sid");
if (sid == null) {
%>
<script>
	window.alert('로그인 후 이용 가능한 서비스입니다');
	location.href = '/myweb';
</script>
<%
return;
}
%>

<%
WebFolder webFolder = new WebFolder(request.getServletContext().getRealPath("/webfolder/upload"),sid);
session.setAttribute("webFolder", webFolder);

final long MAX_FOLDER_SIZE = webFolder.getMAX_FOLDER_SIZE();
long currentFolderSize = webFolder.getUsedSize();
long freeFolderSize = MAX_FOLDER_SIZE-currentFolderSize;
%>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<h2>드라이브</h2>
			<fieldset>
				<legend>사용정보</legend>
				<ul>
					<li><label>총 용량 : </label> <meter max="<%=MAX_FOLDER_SIZE%>"
							min="0" value="<%=MAX_FOLDER_SIZE%>"></meter><%=MAX_FOLDER_SIZE%>(byte)</li>
					<li><label>사용용량 : </label> <meter max="<%=MAX_FOLDER_SIZE%>"
							min="0" value="<%=currentFolderSize%>"></meter><%=currentFolderSize%>(byte)</li>
					<li><label>남은용량 : </label> <meter max="<%=MAX_FOLDER_SIZE%>"
							min="0" value="<%=freeFolderSize%>"></meter><%=freeFolderSize%>(byte)</li>
				</ul>
			</fieldset>
		</article>
		<article>
			<div>
				<input type="button" value="파일올리기" /> <input type="button"
					value="폴더만들기" />
			</div>
			<fieldset>
				<legend>탐색기</legend>
				<table>
					<thead>
						<tr>
							<th>구분</th>
							<th>파일명 및 폴더명</th>
							<th>삭제</th>
						</tr>
					</thead>
				</table>
			</fieldset>

		</article>

	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>