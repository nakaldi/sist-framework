<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memberDTO" class="com.yong.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="memberDTO" />
<jsp:useBean id="memberDAO" class="com.yong.member.MemberDAO"></jsp:useBean>
<%
int result = memberDAO.memberJoin(memberDTO);
String msg = result > 0 ? "회원가입 성공" : "회원가입 실패";
%>
<script>
	window.alert('<%=msg%>');
	location.href = '../index.jsp';
</script>
