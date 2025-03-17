<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="dto" class="com.yong.phonebook.PhonebookDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto" />
<jsp:useBean id="dao" class="com.yong.phonebook.PhonebookDAO"></jsp:useBean>

<%
int result = dao.phoneAdd(dto);
String msg = result > 0 ? "전화번호등록성공(beans)" : "전화번호등록실패(bean)";
%>
<script>
	window.alert('<%=msg%>');
	location.href = 'phonebookForm.jsp';
</script>