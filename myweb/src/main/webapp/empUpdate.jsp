<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String idx_s = request.getParameter("idx");
if (idx_s == null || idx_s.length() == 0) {
	idx_s = "0";
}
int idx = Integer.parseInt(idx_s);

Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "scott";
String pwd = "1234";
Connection conn = DriverManager.getConnection(url, user, pwd);
String sql = "select * from employee where idx=?";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setInt(1, idx);
ResultSet rs = ps.executeQuery();
if(!rs.next()){
	%>
	<script>
	window.alert('잘못된 접근 또는 삭제된 사원입니다');
	location.href='emp.jsp';
	</script>
	
	<%
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css" />



</head>
<body>
	<%@include file="header.jsp"%>
	<section>

		<article>
			<h2><%=rs.getInt("idx")%>사번의 사워정보 수정
			</h2>
			<form name="empUpdate">
				<table>
					<tr>
						<th>사원번호</th>
						<td><%=rs.getInt("idx")%></td>
					</tr>
					<tr>
						<th>사원이름</th>
						<td><input type="text" name="name"
							value="<%=rs.getString("name")%>" /></td>
					</tr>
					<tr>
						<th>e-mail</th>
						<td><input type="text" name="email" value="<%=rs.getString("email")%>"/></td>
					</tr>
					<tr>
						<th>부서명</th>
						<td><input type="text" name="dept" value="<%=rs.getString("dept")%>"/></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="정보수정" /> <input type="reset" value="취소하기" /></td>
					</tr>
				</table>


			</form>
		</article>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>