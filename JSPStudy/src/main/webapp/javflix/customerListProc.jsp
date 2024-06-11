<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="mymemberone.DBPoolUtil"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<title>사용자 삭제</title>
</head>
<body>
	<%
	String[] userIds = request.getParameterValues("delete");
	int count = 0;
	if (userIds != null) {
		try (Connection conn = DBPoolUtil.getConnection()) {
			String query = "delete from userinfo where userId = ?";
			try (PreparedStatement pstmt = conn.prepareStatement(query)) {
		for (String userId : userIds) {
			pstmt.setString(1, userId);
			pstmt.executeUpdate();
			count++;
		}
		out.println(count + "명의 사용자가 삭제되었습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	} else {
		out.println("삭제할 사용자를 선택하지 않았습니다.");
	}
	%>
	<div style="text-align: center; margin-top: 20px;">
		<input type="button" value="뒤로가기"
			onclick="window.location='customerList.jsp'"> <a></a>
	</div>
</body>
</html>