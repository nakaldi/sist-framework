<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	function openLoginPopup() {
		window
				.open('/myweb/member/login.jsp', 'login',
						'width=450, height=400');
	}
</script>

<header>
	<div>
		<%
		String loggedInUserName = (String) session.getAttribute("loggedInUser");
		if (loggedInUserName != null) {
		%>
		<span><a><%=loggedInUserName%>님 </a></span> | <span><a
			href="/myweb/member/logout_ok.jsp">로그아웃</a></span>
		<%
		} else {
		%>
		<span><a href="#" onclick="openLoginPopup()">로그인</a></span> | <span><a
			href="/myweb/member/memberJoin.jsp">회원가입</a></span>
		<%
		}
		%>
	</div>
	<h1>JSP Study Site</h1>
	<nav>
		<ul>
			<li><a href="/myweb/index.jsp">Home</a></li>
			<li><a href="/myweb/introduce.jsp">Profile</a></li>
			<li><a href="/myweb/bbs/bbsList.jsp">자유게시판</a></li>
			<li><a href="/myweb/webfolder/webfolder.jsp">드라이브</a></li>
			<li><a href="#">방명록</a></li>
		</ul>
	</nav>
	<hr />
</header>