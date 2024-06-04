<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String name = "yehchan";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Hello jsp</h2>
	<h3>
		현재 날짜와 시간은
		<%=new Date()%></h3>
	<h3>
		당신의 이름은
		<%=name%></h3>
</body>
</html>