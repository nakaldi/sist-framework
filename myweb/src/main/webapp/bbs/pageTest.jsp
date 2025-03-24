<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
String currentPage_str = request.getParameter("currentPage");
int currentPage = currentPage_str==null?1:Integer.parseInt(currentPage_str);
int postsCount = 101;
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
	<h1>pageTest.jsp</h1>
	<h3>
		총 게시물 수 :
		<%=postsCount%></h3>
	<h3>
		보여줄 리스트 수 :<%=postsPerPage%>
	</h3>
	<h3>
		총 페이지 수 :
		<%=pagesCount%></h3>
	<h3>
		보여줄 페이지 수 :<%=pagesPerPage%></h3>
	<h3>
		사용자의 현재 위치 :
		<%=currentPage%></h3>
	<%
	if (currentPageGroup != 0) {
	%>
	<a href="pageTest.jsp?currentPage=<%=(currentPageGroup-1) * pagesPerPage+pagesPerPage%>">&lt;&lt;</a>
	<%
	}
	%>

	<%
	for (int i = (currentPageGroup * pagesPerPage + 1); i <= currentPageGroup * pagesPerPage + pagesPerPage; i++) {
	%>
	&nbsp;&nbsp;<a href="pageTest.jsp?currentPage=<%=i%>"><%=i%></a>&nbsp;&nbsp;
	<%
	if (i == pagesCount) {
		break;
	}
	}
	%>
	<%
	if ((pagesCount / pagesPerPage) - (pagesCount % pagesPerPage == 0 ? 1 : 0) != currentPageGroup) {
	%>
	<a href="pageTest.jsp?currentPage=<%=(currentPageGroup+1) * pagesPerPage+1%>">&gt;&gt;</a>

	<%
	}
	%>
</body>
</html>