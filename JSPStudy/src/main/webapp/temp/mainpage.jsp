<%@ page contentType="text/html; charset=euc-kr"%>
<%
request.setAttribute("PAGETITLE", "��������");
%>
<jsp:forward page="/temp/template/template.jsp">
	<jsp:param name="CONTENTPAGE" value="info_view.jsp" />
</jsp:forward>