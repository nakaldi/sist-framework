<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="memberDAO" class="com.yong.member.MemberDAO"></jsp:useBean>

<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

if (memberDAO.loginCheck(id, pwd) == 3) {
	String name = memberDAO.getUserInfo(id);
	session.setAttribute("loggedInUser", name);
	session.setAttribute("sid", id);

	Cookie lastLoggedinId = new Cookie("lastLoggedInId", id);
	int maxAge = 0;
	if (request.getParameter("rememberId") != null) {
		maxAge = 60 * 60 * 24 * 30;
	}
	lastLoggedinId.setMaxAge(maxAge);
	response.addCookie(lastLoggedinId);
%>
<script>
	opener.window.location.reload();
	window.alert('<%=name%>님 환영합니다!');
	window.self.close();
</script>
<%
} else {
%>
<script>
	window.alert('아이디 또는 비밀번호가 다릅니다.');
	location.href = 'login.jsp';
</script>
<%
}
%>