<%@page import="java.util.ArrayList"%>
<%@page import="com.beom.emp.model.EmpDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>모든 사원 목록</h2>
	<fieldset>
		<legend>사원 목록</legend>
		<table border="1" cellspacing="0" width="550">
			<thead>
				<tr>
					<th>사원번호</th>
					<th>사원이름</th>
					<th>E-mail</th>
					<th>부서명</th>
				</tr>
			</thead>
			<tbody>
				<%
				List<EmpDto> empDtos = (ArrayList<EmpDto>) request.getAttribute("empDtos");
				if (empDtos.size() == 0) {
				%>
				<tr>
					<td colspan="4" align="center">등록된 사원이 없습니다</td>
				</tr>
				<%
				} else {
				for (EmpDto empDto : empDtos) {
				%>
				<tr>
					<td><%=empDto.getIdx()%></td>
					<td><%=empDto.getName()%></td>
					<td><%=empDto.getEmail()%></td>
					<td><%=empDto.getDept()%></td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
	</fieldset>
</body>
</html>