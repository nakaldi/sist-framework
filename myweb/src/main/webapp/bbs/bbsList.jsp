<%@page import="java.util.List"%>
<%@page import="com.yong.bbs.BbsDAO"%>
<%@page import="com.yong.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css" />
<style>
h2 {
	
}

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

.pagination-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 20px;
	width: 650px;
	margin: 20px auto;
}

.pagination {
	display: inline-block;
}

.pagination a {
	margin: 0 5px;
	text-decoration: none;
	color: black;
}

.pagination a.active {
	color: blue;
	font-weight: bold;
}

.pagination a:hover {
	text-decoration: underline;
}
</style>
</head>
<%
final int VIEW_POST_COUNT = 10;
String postsPage = request.getParameter("page");
if (postsPage == null || postsPage.length() == 0) {
	postsPage = "1";
}

BbsDAO bbsDAO = new BbsDAO();
List<BbsDTO> posts = bbsDAO.findAllPosts();
%>
<body>
	<%@include file="/header.jsp"%>
	<h2>자유게시판</h2>
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>

			<%
			if (posts == null || posts.size() == 0) {
			%>
			<tr>
				<td colspan=5>게시글이 없습니다.</td>
			</tr>
			<%
			} else {
			for (BbsDTO post : posts) {
			%>
			<tr>
				<td><%=post.getId()%></td>
				<td><%=post.getTitle()%></td>
				<td><%=post.getAuthor()%></td>
				<td><%=post.getCreatedAt()%></td>
				<td><%=post.getViewCount()%></td>
			</tr>
			<%
			}
			}
			%>


		</tbody>
	</table>

	<!-- 페이지네이션과 글쓰기 버튼 컨테이너 -->
	<div class="pagination-container">
		<div class="pagination">
			<a href="board.jsp?page=1">이전</a> <a href="board.jsp?page=1"
				class="active">1</a> <a href="board.jsp?page=2">2</a> <a
				href="board.jsp?page=3">3</a> <a href="board.jsp?page=4">4</a> <a
				href="board.jsp?page=5">5</a> <a href="board.jsp?page=2">다음</a>
		</div>
		<button class="write-button" onclick="location.href='bbsWrite.jsp';">글쓰기</button>
	</div>

	<%@include file="/footer.jsp"%>
</body>
</html>