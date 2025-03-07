<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css" />
<style>
h2 {
	text-align: center;
	color: black;
}

fieldset {
	width: 550px;
	margin: 0px auto;
}

input[type='text'] {
	width: 80px;
	font-size: 20px;
}
input[type='number'] {
	width: 80px;
	font-size: 20px;
}

#operator {
	width: 80px;
	font-size: 20px;
}
</style>
<script>

</script>
</head>
<body>
	<%@include file="header.jsp"%>
	<section>
		<article>
			<h2>사칙 계산기</h2>
			<form name="fm" action="cal_ok.jsp" >
				<fieldset>
					<legend>사칙계산기</legend>
					<input type="number" name="num1" required/> <select name="operator" id="operator">
						<option value="+">+</option>
						<option value="-">-</option>
						<option value="/">/</option>
						<option value="*">*</option>
					</select> <input type="text" name="num2" /> <input type="submit" value="계산" />
				</fieldset>
			</form>
		</article>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>