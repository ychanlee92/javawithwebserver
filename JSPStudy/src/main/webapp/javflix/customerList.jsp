<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Date"%>
<%@ page import="mymemberone.DBPoolUtil"%>
<%
String loginID = (String) session.getAttribute("loginID");
%>
<%
try (Connection con = DBPoolUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement("select * from userinfo");
		ResultSet rs = pstmt.executeQuery()) {
%>

<html>
<head>
<link rel="stylesheet" href="mainpage.css?ver=2" />
<script src="mainpage.js"></script>
<title>Jaflix</title>
<style>
th {
	width: 50px;
}
td{
height:50px;}
#address {
	width: 600px;
}
#name {
	width: 150px;
}
#userDate {
	width: 250px;
}
#number {
	width: 100px;
}
#pw {
	width: 200px;
}
#post {
	width: 200px;
}
#delete {
	width: 100px;
}
</style>

</head>
<body onload="call_js()">
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<section>
		<jsp:include page="slide.jsp"></jsp:include>
		<form action="customerListProc.jsp" method="post">
			<table align="center" width="1200" border="1">
				<tr>
					<th id="number">번호</th>
					<th>아이디</th>
					<th id="pw">비밀번호</th>
					<th id="name">이름</th>
					<th>이메일</th>
					<th id="post">우편번호</th>
					<th id="address">주소</th>
					<th>전화번호</th>
					<th id="userDate">등록일</th>
					<th id="delete">삭제</th>
				</tr>
				<%
				while (rs.next()) {
					String userNo = rs.getString("userno");
					String userId = rs.getString("userId");
					String userPw = rs.getString("userpassword");
					String userName = rs.getString("userName");
					String email = rs.getString("Email");
					String postNum = rs.getString("Postnum");
					String address1 = rs.getString("address1");
					String address2 = rs.getString("address2");
					String address3 = rs.getString("address3");
					String phone = rs.getString("phone");
					Date userDate = rs.getDate("userdate");
					String address = address1 + address2 + address3;
				%>
				<tr>
					<td><%=userNo%></td>
					<td><%=userId%></td>
					<td><%=userPw%></td>
					<td><%=userName%></td>
					<td><%=email%></td>
					<td><%=postNum%></td>
					<td><%=address%></td>
					<td><%=phone%></td>
					<td><%=userDate%></td>
					<td><input type="checkbox" name="delete" value="<%=userId%>"></td>
				</tr>
				<%
				}
				%>
			</table>
			<div style="text-align: center; margin-top: 20px;">
				<input type="submit" value="삭제">
			</div>
		</form>

	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<%
} catch (Exception e) {
e.printStackTrace();
}
%>
