<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="mymemberone.BoardDAO"%>
<%@ page import="java.sql.Timestamp"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
String pass = request.getParameter("pass");
BoardDAO dbPro = BoardDAO.getInstance();
int check = dbPro.deleteArticle(num, pass);
int count = 0;
count = dbPro.getArticleCount();//전체 글수
if (count > 10 && count % 10 == 0) {
	pageNum = String.valueOf(Integer.parseInt(pageNum) - 1);
}
if (check == 1) {
%>
<meta http-equiv="Refresh"
	content="0;url=board.jsp?pageNum=<%=pageNum%>">
<%
} else {
%>
<script language="JavaScript">
<!--
	alert("비밀번호가 맞지 않습니다");
	history.go(-1);
	-->
</script>
<%
}
%>