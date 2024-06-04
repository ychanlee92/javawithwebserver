<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,memberone.*"%>
<%
StudentDAO dao = StudentDAO.getInstance();
%>
<%
String id = request.getParameter("id");
boolean check = dao.idCheck(id);
%>
<html>
<head>
<title>ID중복체크</title>
<script language="JavaScript" src="projectmain.js"></script>
</head>
<body bgcolor="#FFFFCC">
	<br>
	<center>
		<b><%=id%></b>
		<%
		int flag = 1;
		if (check) {
			out.println("는 이미 존재하는 ID입니다.<br></br>");
		} else {
			out.println("는 사용 가능 합니다.<br></br>");
			flag = 2;
		}
		%>
		<a href="#" onClick="closeWindow(<%=flag%>)">닫기</a>
	</center>
</body>
</html>