<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Enumeration"%>
<html>
<head>
<title>헤더 목록 출력</title>
</head>
<body>
	<%
	Enumeration enumData = request.getHeaderNames();
	while (enumData.hasMoreElements()) {
		String headerName = (String) enumData.nextElement();
		String headerValue = request.getHeader(headerName);
	%>
	<%=headerName%>
	=
	<%=headerValue%>
	<br></br>
	<%
	}
	%>
</body>
</html>