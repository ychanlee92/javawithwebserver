<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%
String name = "";
if (request.getParameter("name") == null) {
	name = "null";
} else if (request.getParameter("name").equals("")) {
	name = "빈공간";
} else if (request.getParameter("name") != null || !(request.getParameter("name").equals(""))) {
	name = request.getParameter("name");
}

response.setStatus(HttpServletResponse.SC_OK);
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%=request.getParameter("name")%></h2>
</body>
</html>