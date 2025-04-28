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
	<h1>사원관리프로그램(mvc버전)</h1>
	<form name="empAdd" action="empAdd.beom">
		<fieldset>
			<legend>사원등록</legend>
			<table>
				<tr>
					<th>사원이름</th>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td><input type="text" name="email" /></td>
				</tr>
				<tr>
					<th>부서</th>
					<td><input type="text" name="dept" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="사원등록" /> <input type="reset" value="리셋" /></td>
				</tr>
			</table>
		</fieldset>
	</form>
	<hr />
	<form name="empDel" action="empDel.beom">
		<fieldset>
			<legend>사원삭제</legend>
			<table>
				<tr>
					<th>사원이름</th>
					<td><input type="text" name="name" /></td>
					<td><input type="submit" value="삭제" /></td>
				</tr>
			</table>
		</fieldset>
	</form>
	<hr />
	<fieldset>
		<legend>모든 사원 목록</legend>
		<h3>
			<a href="empList.beom">모든 사원 목록</a>
		</h3>
	</fieldset>

	<form name="empSearch" action="empSearch.beom">
		<fieldset>
			<legend>사원검색</legend>
			<table>
				<tr>
					<th>사원이름</th>
					<td><input type="text" name="name" /></td>
					<td><input type="submit" value="검색" /></td>
				</tr>
			</table>
		</fieldset>
	</form>

	<form name="empUpdateFind" action="empUpdateFind.beom">
		<fieldset>
			<legend> 사원수정 </legend>
			<table>
				<tr>
					<th>사원번호</th>
					<td><input type="text" name="idx" /></td>
					<td><input type="submit" value="사원수정" /></td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>