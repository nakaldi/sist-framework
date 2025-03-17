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
			<form name="phoneAdd1" action="phoneAdd1_ok.jsp">
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

		<article>
			<h2>전화번호부 프로그램(빈즈방식)</h2>
			<form name="phoneAdd2" action="phoneAdd2_ok.jsp">
				<fieldset>
					<legend>전화번호등록 part2</legend>
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
		<article>
			<form name="phoneDelete" action="phoneDelete_ok.jsp">
				<fieldset>
					<legend>전화번호삭제</legend>
					<ul>
						<li><label>이름</label><input type="text" name="name" /></li>

					</ul>
					<div>
						<input type="submit" value="전화번호등록" /> <input type="reset"
							value="다시작성하기" />
					</div>
				</fieldset>
			</form>
		</article>
		<article>
			<fieldset>
				<legend>모든 전화번호 내역 part1</legend>
				<h3>
					<a href="phonebookList1.jsp">모든 전화번호 내역 보기 part1</a>
				</h3>
			</fieldset>
		</article>
		<article>
			<fieldset>
				<legend>모든 전화번호 내역 part2</legend>
				<h3>
					<a href="phonebookList2.jsp">모든 전화번호 내역 보기 part2</a>
				</h3>
			</fieldset>
		</article>
	</section>

	<%@include file="../footer.jsp"%>
</body>
</html>