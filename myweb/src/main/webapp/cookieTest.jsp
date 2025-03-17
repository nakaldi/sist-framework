<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieTest.jsp</h1>

	<%
	String str="홍 길동";
	str=URLEncoder.encode(str);
	
	
	//--------------쿠키 생성하기 3단계-----------
	// 1. 쿠키객체 생성
	Cookie ck = new Cookie("username", str);
	// 2. 수명 지정(second)
	ck.setMaxAge(60*3);
	// 3. 사용자에게 심기
	response.addCookie(ck);
	
	Cookie ck2 = new Cookie("userage", "3");
	ck2.setMaxAge(60*3);
	response.addCookie(ck2);
	
	//---------------쿠키 가져오기 3단계-------------
	// 1. 쿠키들을 가져오기
	Cookie[] cks = request.getCookies();
	// 2. 쿠키 요소에 접근해서 키값을 확인
	for(Cookie c : cks){
		out.println(c.getName() + " : " + URLDecoder.decode(c.getValue()) + "<br>");
	}
	
	
	
	%>
</body>
</html>