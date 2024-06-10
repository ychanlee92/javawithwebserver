<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mymemberone.BoardDAO"%>
<%@ page import="mymemberone.BoardVO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
String loginID = (String) session.getAttribute("loginID");
%>
<%!// 수정 <1>
	int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>
<%
String pageNum = request.getParameter("pageNum");
if (pageNum == null) {
	pageNum = "1";
}
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1) * pageSize + 1;
int endRow = currentPage * pageSize;

int count = 0;
int number = 0;
List<BoardVO> articleList = null;
BoardDAO dbPro = BoardDAO.getInstance();
count = dbPro.getArticleCount();//전체 글수
if (count > 0) {
	articleList = dbPro.getArticleList(startRow, endRow);//수정<3>
}
number = count - (currentPage - 1) * pageSize;//수정<4>
%>
<html>
<head>
<link rel="stylesheet" href="mainpage.css?ver=2" />
<link rel="stylesheet" href="board.css" />
<script src="mainpage.js"></script>
<title>Jaflix</title>
</head>
<body onload="call_js()">
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<section>
		<jsp:include page="slide.jsp"></jsp:include>
		<center>
			<b>글목록(전체 글:<%=count%>)
			</b>
			<table id="table1">
				<tr>
					<td id="td1"><a href="writeForm.jsp">글쓰기</a></td>
			</table>
			<%
			if (count == 0) {
			%>
			<table id="table2">
				<tr>
					<td id="td2">게시판에 저장된 글이 없습니다.</td>
			</table>
			<%
			} else {
			%>
			<table id="td3">
				<tr class="tr1">
					<td class="td4">번 호</td>
					<td id="td5">제 목</td>
					<td class="td6">작성자</td>
					<td class="td7">작성일</td>
					<td class="td4">조 회</td>
					<td class="td6">IP</td>
				</tr>
				<%
				for (int i = 0; i < articleList.size(); i++) {
					BoardVO article = (BoardVO) articleList.get(i);
				%>
				<tr class="tr1">
					<td class="td6"><%=number--%></td>
					<td id="td11">
						<!-- 수정 <5> --> <%
 int wid = 0;
 if (article.getDepth() > 0) {
 	wid = 5 * (article.getDepth());
 %> <img src="images/level.gif" width="<%=wid%>" class="img1"> <img
						src="images/re.gif"> <%
 } else {
 %> <img src="images/level.gif" width="<%=wid%>"> <%
 }
 %> <a
						href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
							<!-- 수정<6> --> <%=article.getSubject()%></a> <%
 if (article.getReadcount() >= 20) {
 %> <img src="images/hot.gif" id="img1"> <%
 }
 %>
					</td>
					<td class="td6"><a href="mailto:<%=article.getEmail()%>">
							<%=article.getWriter()%></a></td>
					<td class="td7"><%=sdf.format(article.getRegdate())%></td>
					<td class="td4"><%=article.getReadcount()%></td>
					<td class="td6"><%=article.getIp()%></td>
				</tr>
				<%
				}
				%>
			</table>
			<%
			}
			%>
			<!-- 수정 <7> -->
			<%
			if (count > 0) {
				int pageBlock = 5;
				int imsi = count % pageSize == 0 ? 0 : 1;
				int pageCount = count / pageSize + imsi;
				int startPage = (int) ((currentPage - 1) / pageBlock) * pageBlock + 1;
				int endPage = startPage + pageBlock - 1;
				if (endPage > pageCount)
					endPage = pageCount;
				if (startPage > pageBlock) {
			%>
			<a href="list.jsp?pageNum=<%=startPage - pageBlock%>">[이전]</a>
			<%
			}
			for (int i = startPage; i <= endPage; i++) {
			%>
			<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]
			</a>
			<%
			}
			if (endPage < pageCount) {
			%>
			<a href="list.jsp?pageNum=<%=startPage + pageBlock%>">[다음]</a>
			<%
			}
			}
			%>
		</center>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>