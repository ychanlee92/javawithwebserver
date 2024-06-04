<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mymemberone.BoardDAO"%>
<%@ page import="mymemberone.BoardVO"%>
<%@ include file="color.jsp"%>
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
<%
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
try {
	BoardDAO dbPro = BoardDAO.getInstance();
	BoardVO article = dbPro.updateGetArticle(num);
%>
</head>
<body onload="call_js()">
	<div id="mainDiv">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="nav.jsp"></jsp:include>
		<jsp:include page="slideAside.jsp"></jsp:include>
		<section>
			<div id="section">
				<center>
					<b>글수정</b> <br>
					<form method="post" name="writeform"
						action="updateProc.jsp?pageNum=<%=pageNum%>"
						onsubmit="return writeSave()">
						<table width="400" border="1" cellspacing="0" cellpadding="0"
							bgcolor="<%=bodyback_c%>" align="center">
							<tr>
								<td width="70" bgcolor="<%=value_c%>" align="center">이 름</td>
								<td align="left" width="330"><span name="writer"><%=article.getWriter()%></span><input
									type="hidden" name="num" value="<%=article.getNum()%>"></td>
							</tr>
							<tr>
								<td width="70" bgcolor="<%=value_c%>" align="center">Email</td>
								<td align="left" width="330"><span name="email"><%=article.getEmail()%></span></td>
							</tr>
							<tr>
								<td width="70" bgcolor="<%=value_c%>" align="center">제 목</td>
								<td align="left" width="330"><input type="text" size="40"
									maxlength="50" name="subject" value="<%=article.getSubject()%>"></td>
							</tr>
							<tr>
								<td width="70" bgcolor="<%=value_c%>" align="center">내 용</td>
								<td align="left" width="330"><textarea name="content"
										rows="13" cols="40">
<%=article.getContent()%></textarea></td>
							</tr>
							<tr>
								<td width="70" bgcolor="<%=value_c%>" align="center">비밀번호</td>
								<td align="left" width="330"><input type="password"
									size="8" maxlength="12" name="pass"></td>
							</tr>
							<tr>
								<td colspan=2 bgcolor="<%=value_c%>" align="center"><input
									type="submit" value="글수정"> <input type="reset"
									value="다시작성"> <input type="button" value="목록보기"
									onclick="document.location.href=
'list.jsp?pageNum=<%=pageNum%>'">
								</td>
							</tr>
						</table>
					</form>
				</center>
				<%
				} catch (Exception e) {
				}
				%>
			</div>
		</section>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
