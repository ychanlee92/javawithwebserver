<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Map"%>
<%
request.setCharacterEncoding("euc-kr");
%>
<html>
<head>
<meta charset="UTF-8">
<title>��û �Ķ���� ���</title>
</head>
<body>
	<b>request.getParameter() �޼ҵ� ���</b>
	<br></br> name �Ķ���� =
	<%=request.getParameter("name")%><br></br> address �Ķ���� =
	<%=request.getParameter("address")%><br></br>
	<br></br>
	<b>request.getParameterValues() �޼ҵ� ���</b>
	<br></br>
	<%
	String[] values = request.getParameterValues("pet");
	if (values != null) {
		for (int i = 0; i < values.length; i++) {
	%>
	<%=values[i]%>
	<%
	}
	}
	%>
	<br></br>
	<br></br>
	<b>request.getParameterNames() �޼ҵ� ���</b>
	<br></br>
	<%
	Enumeration enumData = request.getParameterNames();
	while (enumData.hasMoreElements()) {
		String name = (String) enumData.nextElement();
	%>
	<%=name%>
	<%
	}
	%>
	<br></br>
	<br></br>
	<b>request.getParameterMap() �޼ҵ� ���</b>
	<br></br>
	<%
	Map parameterMap = request.getParameterMap();
	String[] nameParam = (String[]) parameterMap.get("name");
	if (nameParam != null) {
	%>
	name =
	<%=nameParam[0]%>
	<%
	}
	%>
</body>
</html>