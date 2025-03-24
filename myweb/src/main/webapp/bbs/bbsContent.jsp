<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.yong.bbs.*"%>
<jsp:useBean id="bbsDAO" class="com.yong.bbs.BbsDAO"></jsp:useBean>
<%
String id_str = request.getParameter("id");
if (id_str == null || "".equals(id_str)) {
	id_str = "0";
}
int id = Integer.parseInt(id_str);
BbsDTO post = bbsDAO.findPostById(id);
if (post == null) {
%>
<script>
	window.alert('게시글이 없어용');
</script>
<%
return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
</head>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<h2>자유게시판 본문보기</h2>
			<fieldset>
				<legend>본문내용</legend>
				<table width="550" border="1" cellspacing="0">
					<tr>
						<th>번호</th>
						<td><%=post.getId()%></td>
					</tr>
					<tr>
						<th>작성날짜</th>
						<td><%=post.getCreatedAt()%></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><%=post.getAuthor()%></td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3"><%=post.getTitle()%></td>
					</tr>
					<tr height="150">
						<td colspan="4" align="left" valign="top"><%=post.getContent().replace("\r\n", "<br/>")%>
						</td>
					</tr>
					<tr height="50">
						<td colspan="4" align="center">목록으로</td>
					</tr>
				</table>
			</fieldset>
		</article>
	</section>


	<%@include file="/footer.jsp"%>
</body>
</html>