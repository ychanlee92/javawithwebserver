<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="mymemberone.BoardDAO"%>
<%@ page import="java.sql.Timestamp"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="article" scope="page" class="mymemberone.BoardVO">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>
<%
article.setRegdate(new Timestamp(System.currentTimeMillis()));
article.setIp(request.getRemoteAddr());
BoardDAO dbPro = BoardDAO.getInstance();
dbPro.insertArticle(article);
response.sendRedirect("list.jsp");
%>