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

</style>
</head>
<%

BbsDAO bbsDAO = new BbsDAO();

String currentPage_str = request.getParameter("currentPage");
int currentPage = currentPage_str==null?1:Integer.parseInt(currentPage_str);
int postsCount = bbsDAO.getCountFromPosts();
int postsPerPage = 5;
int pagesPerPage = 5;

int pagesCount = (postsCount / postsPerPage) + 1;
if (postsCount % postsPerPage == 0) {
	pagesCount--;
}

int currentPageGroup = currentPage / pagesPerPage;
if (currentPage % pagesPerPage == 0) {
	currentPageGroup--;
}
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
			List<BbsDTO> posts = bbsDAO.findPostsWithOffsetAndLimit(currentPage*postsPerPage, postsPerPage);
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
				<td><a href="bbsContent.jsp?id=<%=post.getId()%>"><%=post.getTitle()%></a></td>
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

		<%
	if (currentPageGroup != 0) {
	%>
	<a href="bbsList.jsp?currentPage=<%=(currentPageGroup-1) * pagesPerPage+pagesPerPage%>">&lt;&lt;</a>
	<%
	}
	%>

	<%
	for (int i = (currentPageGroup * pagesPerPage + 1); i <= currentPageGroup * pagesPerPage + pagesPerPage; i++) {
	%>
	&nbsp;&nbsp;<a href="bbsList.jsp?currentPage=<%=i%>"><%=i%></a>&nbsp;&nbsp;
	<%
	if (i == pagesCount) {
		break;
	}
	}
	%>
	<%
	if ((pagesCount / pagesPerPage) - (pagesCount % pagesPerPage == 0 ? 1 : 0) != currentPageGroup) {
	%>
	<a href="bbsList.jsp?currentPage=<%=(currentPageGroup+1) * pagesPerPage+1%>">&gt;&gt;</a>

	<%
	}
	%>
		<button class="write-button" onclick="location.href='bbsWrite.jsp';">글쓰기</button>
	</div>

	<%@include file="/footer.jsp"%>
</body>
</html>