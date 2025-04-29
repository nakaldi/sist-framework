<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jstlTest1.jsp</h1>
	<c:set var="num1" value="100"></c:set>
	<c:set var="num2">200</c:set>
	<h3>num1:${num1 }</h3>
	<h3>num2:${num2 }</h3>
	<h3>num1+num2:${num1+num2 }</h3>

	<%
	//컨트롤러에서 넘어왔다는 가정
	String[] fruits = { "사과", "딸기", "포도", "배" };
	%>
	<c:set var="fruits" value="<%=fruits%>"></c:set>
	<ul>
		<li>${fruits }</li>
		<li>${fruits[0] }</li>
		<li>${fruits[1] }</li>
		<li>${fruits["2"] }</li>
		<li>${fruits['3'] }</li>
	</ul>
	<c:remove var="fruits"/>
	<hr/>
		<ul>
		<li>${fruits }</li>
		<li>${fruits[0] }</li>
		<li>${fruits[1] }</li>
		<li>${fruits["2"] }</li>
		<li>${fruits['3'] }</li>
	</ul>
	<hr/>
	<%
	Map map = new HashMap();
	%>
	<c:set var="map" value="<%=map %>"></c:set>
	<c:set target="${map }" property="name" value="홍길동"></c:set>
	<c:set target="${map }" property="userId">hong</c:set>
	<c:set target="${map }" property="user-addr">서울</c:set>
	
	<h3>map에 저장된 이름 : ${map.name }</h3>
	<h3>map에 저장된 id : ${map.userId }</h3>
	<h3>map에 저장된 이름 : ${map["name"] }</h3>
	<h3>map에 저장된 id : ${map['userId'] }</h3>
	<h3>map에 저장된 id : ${map.user-addr }</h3>
	<h3>map에 저장된 id : ${map['user-addr'] }</h3>
</body>
</html>