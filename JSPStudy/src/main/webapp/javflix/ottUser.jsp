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
		PreparedStatement pstmt = con.prepareStatement("select * from jav_ott");
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

#address {
	width: 100px;
}
#name {
	width: 100px;
}
#userDate {
	width: 100px;
}
#number {
	width: 100px;
}
#pw {
	width: 100px;
}
#post {
	width: 200px;
}
#delete {
	width: 100px;
}
#title {
	width: 600px;
}
#actor {
	width: 400px;
}
</style>

</head>
<body onload="call_js()">
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<section>
		<jsp:include page="slide.jsp"></jsp:include>
		<form action="customerListProc.jsp" method="post">
			<table align	="center" width="1200" border="1">
				<tr>
					<th id="number">번호</th>
					<th id="title">제목</th>
					<th id="pw">나라</th>
					<th id="name">장르</th>
					<th id="actor">배우</th>
					<th id="post">감독</th>
					<th id="address">연도</th>
					<th>평점</th>
					<th id="userDate">나이제한</th>
					<th id="delete">조회수</th>
				</tr>
				<%
				while (rs.next()) {
					int userNo = rs.getInt("ott_num");
					String userId = rs.getString("ott_title");
					String userPw = rs.getString("ott_country");
					String userName = rs.getString("ott_genre");
					String email = rs.getString("ott_actor");
					String postNum = rs.getString("ott_director");
					String address1 = rs.getString("ott_year");
					double address2 = rs.getDouble("ott_rate");
					String address3 = rs.getString("ott_age");
					int phone = rs.getInt("ott_view");
				%>
				<tr>
					<td><%=userNo%></td>
					<td><%=userId%></td>
					<td><%=userPw%></td>
					<td><%=userName%></td>
					<td><%=email%></td>
					<td><%=postNum%></td>
					<td><%=address1%></td>
					<td><%=address2%></td>
					<td><%=address3%></td>
					<td><%=phone%></td>
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
