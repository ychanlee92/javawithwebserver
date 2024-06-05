<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// input의 name을 매개변수로
Part filePart = request.getPart("file");
// 확인하기
System.out.println("컨텐츠 확인 (마임 타입) : " + filePart.getContentType());
System.out.println("바이트 기반 파일 크기 : " + filePart.getSize());
System.out.println("업로드된 파일 이름 : " + filePart.getSubmittedFileName());
// 입력 스트림 준비
InputStream fileContent = filePart.getInputStream();
// 출력 스트림 준비 (내 서버 컴퓨터에 파일을 저장할 예정)
OutputStream outputStream = null; // 예외 처리를 위해 null 처리 먼저
//같은 이름의 파일을 여러 번 올린다면 구분할 수 없기 때문에, 랜덤한 문자열을 앞에 붙여서 구분
try {
	// 랜덤 문자열 생성
	UUID uuid = UUID.randomUUID();
	// 랜덤 문자열 + 기존 파일명
	String fileName = uuid + "_" + filePart.getSubmittedFileName();
	// 파일을 저장할 폴더를 코드 상으로 생성하기
	String saveDirectory = "D:/temp";
	File dir = new File(saveDirectory);
	// dir 안에 파일이 하나도 없다면 폴더가 만들어지지 않은 것
	if (!dir.exists()) {
		dir.mkdirs(); // 폴더 생성
	}
	// 해당 경로에 fileName 변수에 담긴 이름으로 파일을 생성할 것
	File file = new File("D:/temp/", fileName);
	// 출력 스트림 사용
	outputStream = new FileOutputStream(file);
	byte[] buffer = new byte[1024]; // 1024 byte
	int length;
	while ((length = fileContent.read(buffer)) != -1) {
		// 1024 바이트씩 읽음
		outputStream.write(buffer, 0, length);
	}
} catch (Exception e) {
} finally {
	outputStream.flush(); // flush() 하지 않으면 데이터가 전송되지 않음
	// 폴더가 없을 경우 예외가 발생하기 때문에 방어적 코드 필요
	if (outputStream != null) {
		outputStream.close(); // 출력 스트림 닫기
	}
	fileContent.close(); // 입력 스트림 닫기
	out.println("<h1>성공임</h1>");
}
%>