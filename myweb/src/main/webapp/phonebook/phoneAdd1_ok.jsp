<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
//1. 사용자 값 회수
String name = request.getParameter("name");
String tel = request.getParameter("tel");
String addr = request.getParameter("addr");

// 2. DB 연동
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "scott";
String pwd = "1234";
Connection conn = DriverManager.getConnection(url, user, pwd);

// 3. INSERT
String sql = "insert into phonebook values(phonebook_idx.nextval, ?, ?, ?)";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1, name);
ps.setString(2, tel);
ps.setString(3, addr);
int count = ps.executeUpdate();

ps.close();
conn.close();

// 4. 결과 사용자에게 응답
String msg = count > 0 ? "전화번호 등록 완료" : "전화번호 등록 실패";
%>
<script>
	window.alert('<%=msg%>');
	location.href = 'phonebookForm.jsp';
</script>