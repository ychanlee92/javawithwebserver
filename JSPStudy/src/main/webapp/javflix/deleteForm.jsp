<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="color.jsp"%>
<%
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
%>
<%
String loginID = (String) session.getAttribute("loginID");
%>

<html>
<head>
<link rel="stylesheet" href="mainpage.css?ver=2" />
<script src="mainpage.js"></script>
<title>Jaflix</title>
</head>
<body onload="call_js()">
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<section>
		<jsp:include page="slide.jsp"></jsp:include>
		<center>
			<b>글삭제</b><br></br>
			<form method="POST" name="delForm"
				action="deleteProc.jsp?pageNum=<%=pageNum%>"
				onsubmit="return deleteSave()">
				<table border="1" align="center" cellspacing="0" cellpadding="0"
					width="360">
					<tr height="30">
						<td align=center bgcolor="<%=value_c%>"><b>비밀번호를 입력해 주세요.</b></td>
					</tr>
					<tr height="30">
						<td align=center>비밀번호 : <input type="password" name="pass"
							size="8" maxlength="12"> <input type="hidden" name="num"
							value="<%=num%>"></td>
					</tr>
					<tr height="30">
						<td align=center bgcolor="<%=value_c%>"><input type="submit"
							value="글삭제"> <input type="button" value="글목록"
							onclick="document.location.href=
'board.jsp?pageNum=<%=pageNum%>'">
						</td>
					</tr>
				</table>
			</form>
		</center>

	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>