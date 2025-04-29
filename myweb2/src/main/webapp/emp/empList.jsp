<%@page import="java.util.ArrayList"%>
<%@page import="com.beom.emp.model.EmpDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>사원 목록</h2>
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
				<c:set var="empDtos" value="${requestScope.empDtos }"></c:set>
				<c:if test="${empty empDtos }">
					<tr>
						<td colspan="4" align="center">등록된 사원이 없습니다</td>
					</tr>
				</c:if>
				<c:forEach var="empDto" items="${empDtos }">
					<tr>
						<td>${empDto.idx}</td>
						<td>${empDto.name}</td>
						<td>${empDto.email}</td>
						<td>${empDto.dept}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
</body>
</html>