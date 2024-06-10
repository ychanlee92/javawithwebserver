<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*,memberone.*,mymemberone.*"%>
<%
StudentDAO dao = StudentDAO.getInstance();
%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="vo" class="mymemberone.UserInfoVO">
	<jsp:setProperty name="vo" property="*" />
</jsp:useBean>
<%
String loginID = (String) session.getAttribute("loginID");
vo.setUserId(loginID);
dao.updateMember(request, vo);
%>
<html>
<head>
<title>Update Process</title>
</head>
<meta http-equiv="Refresh" content="3;url=projectmain.jsp">
<body>
	<center>
		<font size="5" face="바탕체"> 입력하신 내용대로 <b>회원정보가 수정 되었습니다.</b><br></br>
			3초후에 Main Page로 이동합니다
		</font>
	</center>
</body>
</html>