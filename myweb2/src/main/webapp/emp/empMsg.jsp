<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	window.alert('<%=request.getAttribute("msg")%>');
	window.location.href = document.referrer;
</script>