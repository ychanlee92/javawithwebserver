<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="mymemberone.BoardDAO"%>
<%@ page import="java.sql.Timestamp"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="article" scope="page" class="mymemberone.BoardVO">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>
<%
String pageNum = request.getParameter("pageNum");
BoardDAO dbPro = BoardDAO.getInstance();
int check = dbPro.updateArticle(article);
if (check == 1) {
%>
<meta http-equiv="Refresh"
	content="0;url=board.jsp?pageNum=<%=pageNum%>">
<%
} else {
%>
<script language="JavaScript">
	/* alert("비밀번호가 맞지 않습니다");
	history.go(-1); */
</script>
<%
}
%>