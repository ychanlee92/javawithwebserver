<%@page import="jdbc.TempMemberVO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>JSP에서 데이터베이스 연동</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="white">
	<img width="500px" height="150px"
		src="data:image/jpeg;base64,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">
	<h2>JSP 스크립틀릿에서 데이터베이스 연동 예제입니다..</h2>
	<h3>회원정보</h3>
	<table bordercolor="red" border="3">
		<tr>
			<td><strong>ID</strong></td>
			<td><strong>PASSWD</strong></td>
			<td><strong>NAME</strong></td>
			<td><strong>MEM_NO1</strong></td>
			<td><strong>MEM_NO2</strong></td>
			<td><strong>E_MAIL</strong></td>
			<td><strong>PHONE</strong></td>
			<td><strong>ZIPCODE</strong><strong>/ADDRESS</strong></td>
			<td><strong>JOB</strong></td>
		</tr>
		<jsp:useBean id="dao" class="jdbc.TempMemberDAO" scope="page" />
		<%
		Vector<TempMemberVO> memberList = dao.getMemberList();
		int counter = memberList.size();
		for (int i = 0; i < counter; i++) {
			TempMemberVO tvo = memberList.get(i);
		%>
		<tr>
			<td><%=tvo.getId()%></td>
			<td><%=tvo.getPasswd()%></td>
			<td><%=tvo.getName()%></td>
			<td><%=tvo.getMem_num1()%></td>
			<td><%=tvo.getMem_num2()%></td>
			<td><%=tvo.getEmail()%></td>
			<td><%=tvo.getPhone()%></td>
			<td><%=tvo.getZipcode()%>/<%=tvo.getAddress()%></td>
			<td><%=tvo.getJob()%></td>
			<%
			} //end of for
			%>
		</tr>
	</table>
	<br> total records :
	<%=counter%>
</body>
</html>