<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="imgGalleryDAO"
	class="com.yong.imggallery.ImgGalleryDAO"></jsp:useBean>

<%
String savepath = "C:/student_java/jspstudy/.metadata/.plugins/"
		+ "org.eclipse.wst.server.core/tmp0/wtpwebapps/myweb/imggallery/imgs";


MultipartRequest mr = new MultipartRequest(request, savepath, 1024 * 1024 * 10, "utf-8");

File uploadedFile = mr.getFile("upload");
String newFileName = "";
if (uploadedFile != null) {
    String originalFileName = uploadedFile.getName();
    System.out.println("원래 파일 이름: " + originalFileName);

    newFileName = System.currentTimeMillis() + "_" + originalFileName;
    File newFile = new File(savepath, newFileName);
    boolean renamed = uploadedFile.renameTo(newFile);
} else {
        response.sendRedirect("imgGalleryUploadForm.jsp");
        return;
}

String filename = mr.getOriginalFileName("upload");
String writer = (String) session.getAttribute("sid");


int result = filename.endsWith(".jpg") || filename.endsWith(".png")
		? imgGalleryDAO.addImgGallery(writer, filename, newFileName)
		: -1;

String msg = result > 0 ? "이미지 업로드 성공!" : "이미지 업로드중 오류발생!";
%>

<script>
	window.alert('<%=msg%>');
	location.href = 'imgGallery.jsp';
</script>