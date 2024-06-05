<%@page import="java.util.Collection"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!String extractFileName(String partHeader) {
		for (String cd : partHeader.split(";")) {
			if (cd.trim().startsWith("filename")) {
				String fileName = cd.substring(cd.indexOf("=") + 1).trim().replace("\"", "");
				//(예: C:\app\test.txt 의 경우 마지막 \ 뒤인 text.txt가 실제 파일명)
				int index = fileName.lastIndexOf(File.separator);
				return fileName.substring(index + 1);
			}
		}
		return null;
	}%>
<%
String CHARSET = "utf-8";
String ATTACHES_DIR = "D:\\temp";
request.setCharacterEncoding(CHARSET);
String contentType = request.getContentType();
if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
	Collection<Part> parts = request.getParts();
	for (Part part : parts) {
		System.out.printf("파라미터명:%s,contentType:%s,size:%d bytes \n", part.getName(), part.getContentType(),
		part.getSize());
		//입력한 input가 파일 일경우
		if (part.getHeader("Content-Disposition").contains("filename=")) {
	String fileName = extractFileName(part.getHeader("Content-Disposition"));
	if (part.getSize() > 0) {
		System.out.printf("업로드 파일 명 : %s  \n", fileName);
		//임시저장된 파일 데이터를 복사하여 지정한 경로에 저장
		part.write(ATTACHES_DIR + File.separator + fileName);
		part.delete(); //임시저장 파일 제거
	}
	String test = application.getContextPath() + "/FileDownloadTest?fileName=" + fileName;
	out.print("파일명:<a href='" + test + "'>" + fileName + "</a href><br>");
	out.print("파일크기: " + part.getSize() + " bytes" + "<br>");
		} else { //일반input일 경우 이름명과 값을 출력
	String formValue = request.getParameter(part.getName());
	System.out.printf("name : %s, value : %s  \n", part.getName(), formValue);
		}
	}
	out.println("<h1>업로드 완료</h1>");
} else {
	out.println("<h1>enctype이 multipart/form-data가  아님</h1>");
}
%>