<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setStatus(HttpServletResponse.SC_OK);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>null point exception</title>
</head>
<body>
	<h1>nullpointerexception 발생</h1>
	<h2><%=request.getParameter("name")%></h2>
</body>
</html>