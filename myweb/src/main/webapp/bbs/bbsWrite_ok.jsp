<%@page import="com.yong.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="bbsDTO" class="com.yong.bbs.BbsDTO"></jsp:useBean>
<jsp:setProperty property="*" name="bbsDTO" />
<jsp:useBean id="bbsDAO" class="com.yong.bbs.BbsDAO"></jsp:useBean>

<%
int result = bbsDAO.addPost(bbsDTO);
%>
<script>
	window.alert('<%="게시글 등록" + (result > 0 ? "성공" : "실패")%>');
	location.href = 'bbsList.jsp';
</script>
