<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<%
		Enumeration<String> enumData = application.getInitParameterNames();
		while (enumData.hasMoreElements()) {
			String data = enumData.nextElement();
			pageContext.getOut().println(String.format("<li> %s %s </li>", data, application.getInitParameter(data)));
		}
		%>
	</ul>
</body>
</html>