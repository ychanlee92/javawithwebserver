<%@ page contentType="text/html; charset=euc-kr"%>
<%
String type = request.getParameter("type");
if (type != null) {
%>
<table width="100%" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td>타입</td>
		<td><b><%=type%></b></td>
	</tr>
	<tr>
		<td>특징</td>
		<td>
			<%
			if (type.equals("A")) {
			%> 강한 내구성 <%
			} else if (type.equals("B")) {
			%> 약한 내구성 <%
			}
			%>
		</td>
	</tr>
</table>
<%
}
%>