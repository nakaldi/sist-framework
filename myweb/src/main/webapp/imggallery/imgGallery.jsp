<%@page import="java.util.List"%>
<%@page import="com.yong.imggallery.ImgGalleryDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="imgGalleryDAO"
	class="com.yong.imggallery.ImgGalleryDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css" />
<style>
h2 {
	text-align: center;
}

table {
	width: 550px;
	margin: 0px auto;
}

table th {
	background-color: skyblue;
}
</style>

</head>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<h2>이미지 갤러리</h2>
			<fieldset>
				<legend>자료목록</legend>
				<%
				if (session.getAttribute("sid") != null) {
				%>
				<div>
					<input type="button" value="이미지 업로드"
						onclick="location.href='imgGalleryUploadForm.jsp';" />
				</div>
				<%
				}
				%>
				<table>
					<tbody>
						<%
						List<ImgGalleryDTO> imgGalleries = imgGalleryDAO.findAllImgGallery();
						if (imgGalleries == null || imgGalleries.size() == 0) {
						%>
						<tr>
							<td align="center">이미지가 없습니다.</td>
						</tr>
						<%
						} else {
						int count = 0;
						for (int i = 0; i < imgGalleries.size(); i++) {
							if (count % 4 == 0) { // 4개마다 새로운 행 추가
						%>
						<tr>
							<%
							}
							%>
							<td><img src="imgs/<%=imgGalleries.get(i).getSystemName()%>"
								alt="<%=imgGalleries.get(i).getSystemName()%>" /><br /> 작성자: <%=imgGalleries.get(i).getWriter()%><br />
								원본이름: <%=imgGalleries.get(i).getOriginName()%></td>
							<%
							count++;
							if (count % 4 == 0 || i == imgGalleries.size() - 1) { // 4개 완료 또는 마지막 이미지
							%>
						</tr>
						<%
						}
						}
						}
						%>
					</tbody>
				</table>

			</fieldset>

		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>