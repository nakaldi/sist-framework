<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<h1>beanTest_ok.jsp</h1>
<jsp:useBean id = "btest" class = "com.yong.bean.BeanTest"></jsp:useBean>
<jsp:setProperty property="*" name="btest"/>
<h3>이름:<jsp:getProperty property="name" name="btest"/></h3>
<h3>나이:<%=btest.getAge() %></h3>
<h3>전화번호:<%=btest.getAddress() %></h3>
<h3>주소:<%=btest.getPhone() %></h3>
</body>
</html>