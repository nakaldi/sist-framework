<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
</head>
<body>
	<%@include file="/header.jsp"%>

	<section>
		<article>
			<h2>모든 전화번호 내역 part1</h2>
			<table border="1" width="550">
				<thead>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>번호</th>
						<th>주소</th>
					</tr>
				</thead>
				<tbody>
					<%
					Class.forName("oracle.jdbc.driver.OracleDriver");
					String url = "jdbc:oracle:thin:@localhost:1521:xe";
					String user = "scott";
					String pwd = "1234";
					Connection conn = DriverManager.getConnection(url, user, pwd);
					String sql = "select * from phonebook order by idx desc";
					PreparedStatement ps = conn.prepareStatement(sql);
					ResultSet rs = ps.executeQuery();
					if (rs.next()) {
						do {
					%>

					<tr>
						<td><%=rs.getInt("idx")%></td>
						<td><%=rs.getString("name")%></td>
						<td><%=rs.getString("tel")%></td>
						<td><%=rs.getString("addr")%></td>
					</tr>

					<%
					} while (rs.next());

					} else {
					%>
					<tr>
						<td colspan="4">등록된 전화번호가 없습니다.</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</article>
	</section>

	<%@include file="/footer.jsp"%>
</body>
</html>