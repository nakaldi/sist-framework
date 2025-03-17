<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.removeAttribute("loggedInUser");
String redirectURL = request.getHeader("referer"); // 이전 페이지 URL 가져오기
if (redirectURL == null || redirectURL.isEmpty()) {
    redirectURL = "myweb/index.jsp"; // 기본 페이지 설정
}
%>
<script>
window.alert('로그아웃 되었습니다.');
location.href ='<%=redirectURL%>';
</script>

