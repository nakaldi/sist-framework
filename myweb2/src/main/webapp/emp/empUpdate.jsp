<%@page import="com.beom.emp.model.EmpDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
EmpDto empDto = (EmpDto) request.getAttribute("empDto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="empUpdate" action="empUpdate.beom">
		<input type="hidden" name="idx" value="<%=empDto.getIdx()%>" />
		<fieldset>
			<legend> 정보수정 </legend>
			<table>
				<tr>
					<th>사원번호</th>
					<td><%=empDto.getIdx()%></td>
				</tr>
				<tr>
					<th>사원이름</th>
					<td><input type="text" name="name"
						value="<%=empDto.getName()%>" /></td>
				</tr>
				<tr>
					<th>email</th>
					<td><input type="text" name="email"
						value="<%=empDto.getEmail()%>" /></td>
				</tr>
				<tr>
					<th>부서</th>
					<td><input type="text" name="dept"
						value="<%=empDto.getDept()%>" /></td>
				</tr>
			</table>
			<input type="submit" value="수정" />
		</fieldset>
	</form>
</body>
</html>