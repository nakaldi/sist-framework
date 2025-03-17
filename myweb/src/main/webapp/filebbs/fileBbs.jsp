<%@page import="com.yong.filebbs.FileBbsDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="fileDAO" class="com.yong.filebbs.FileBbsDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css" />
<style>
h2 {
	text-align: center;
}

table {
	width: 550px;
	margin: 0px auto;
}

table th {
	background-color: skyblue;
}
</style>

</head>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<h2>심플 자료실</h2>
			<fieldset>
				<legend>자료목록</legend>
				<div>
					<input type="button" value="파일 업로드"
						onclick="location.href='fileBbsUploadForm.jsp';" />

				</div>
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>파일명</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody>
						<%
						ArrayList<FileBbsDTO> list = fileDAO.fileBbsList();
						if (list == null || list.size() == 0) {
						%>
						<tr>
							<td colspan="3" align="center">등록된 파일이 없습니다.</td>
						</tr>
						<%
						} else {
						for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><%=list.get(i).getIdx()%></td>
							<td><a href="files/<%=list.get(i).getFilename()%>"><%=list.get(i).getFilename()%></a></td>
							<td><%=list.get(i).getWriter()%></td>
						</tr>
						<%
						}
						}
						%>
					</tbody>
				</table>

			</fieldset>

		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>