<%@page import="com.yong.webfolder.WebFolder"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String fileName = URLDecoder.decode(request.getParameter("fileName"), "UTF-8");
String absolutePath = URLDecoder.decode(request.getParameter("absolutePath"), "UTF-8");
File targetFile = new File(absolutePath);

WebFolder webFolder = (WebFolder) session.getAttribute("webFolder");
String msg = webFolder.deleteFile(targetFile) ? "성공" : "실패";
%>
<script>
	window.alert('파일 삭제 <%=msg%>');
	window.location.href = 'webfolder.jsp'
</script>
