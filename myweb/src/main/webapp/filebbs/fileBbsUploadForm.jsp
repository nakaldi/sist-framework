<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css" />
</head>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<h2>파일 업로드</h2>
			<form name="fileBbsUpload" action="fileBbsUpload_ok.jsp" method="post" enctype="multipart/form-data">
				<fieldset>
					<legend>파일 올리기</legend>
					<ul>
						<li><label>업로드파일</label> <input type="file" name="upload" />
						</li>
					</ul>
					<div>
						<input type="submit" value="파일올리기" />
					</div>
				</fieldset>
			</form>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>