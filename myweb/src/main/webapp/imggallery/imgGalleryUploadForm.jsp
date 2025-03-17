<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
    String sid = (session != null) ? (String) session.getAttribute("sid") : null;
    if (sid == null) {
        response.sendRedirect("/myweb/index.jsp");
        return;
    }
%>
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
			<h2>이미지 업로드</h2>
			<form name="imgGalleryUpload" action="imgGalleryUpload_ok.jsp"
				method="post" enctype="multipart/form-data">
				<fieldset>
					<legend>이미지 올리기</legend>
					<ul>
						<li><label>업로드파일</label> <input type="file" name="upload"
							accept=".jpg, .png" /></li>
					</ul>
					<div>
						<input type="submit" value="이미지올리기" />
					</div>
				</fieldset>
			</form>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>