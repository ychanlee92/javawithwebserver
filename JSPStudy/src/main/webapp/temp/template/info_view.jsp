<%@ page contentType="text/html; charset=euc-kr"%>
<table width="100%" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td>제품번호</td>
		<td>1234</td>
	</tr>
	<tr>
		<td>가격</td>
		<td>50000원</td>
	</tr>
</table>
<jsp:include page="infoSub.jsp" flush="false">
	<jsp:param name="type" value="B" />
</jsp:include>