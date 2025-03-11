<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css" />

</head>
<body>
	<%@include file="../header.jsp"%>
	<section>
		<article>
			<h2>전화번호부 프로그램</h2>
			<form name="phoneAdd1">
				<fieldset>
					<legend>전화번호등록 part1</legend>
					<ul>
						<li><label>이름</label><input type="text" name="name" /></li>
						<li><label>전화번호</label><input type="text" name="tel" /></li>
						<li><label>주소</label><input type="text" name="addr" /></li>
					</ul>
					<div>
						<input type="submit" value="전화번호등록" /> <input type="reset"
							value="다시작성하기" />
					</div>
				</fieldset>
			</form>
		</article>

	</section>


	<%@include file="../footer.jsp"%>
</body>
</html>