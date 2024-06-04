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
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/a3088bf1ff.js"
	crossorigin="anonymous" defer></script>
<link rel="stylesheet" href="projectmain.css?ver=1" />
<script src="projectmain.js?ver=1"></script>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body onload="call_js()">
	<div id="mainDiv">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="nav.jsp"></jsp:include>
		<jsp:include page="slideAside.jsp"></jsp:include>
		<section>
			<div id="section">
				<center>
					<b>글삭제</b><br></br>
					<form method="POST" name="delForm"
						action="deleteProc.jsp?pageNum=<%=pageNum%>"
						onsubmit="return deleteSave()">
						<table border="1" align="center" cellspacing="0" cellpadding="0"
							width="360">
							<tr height="30">
								<td align=center bgcolor="<%=value_c%>"><b>비밀번호를 입력해
										주세요.</b></td>
							</tr>
							<tr height="30">
								<td align=center>비밀번호 : <input type="password" name="pass"
									size="8" maxlength="12"> <input type="hidden"
									name="num" value="<%=num%>"></td>
							</tr>
							<tr height="30">
								<td align=center bgcolor="<%=value_c%>"><input
									type="submit" value="글삭제"> <input type="button"
									value="글목록"
									onclick="document.location.href=
'list.jsp?pageNum=<%=pageNum%>'">
								</td>
							</tr>
						</table>
					</form>
				</center>
			</div>
		</section>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
