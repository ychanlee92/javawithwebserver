<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String loginID = (String) session.getAttribute("loginID");
%>
<html>
<head>
<link rel="stylesheet" href="mainpage.css?ver=2" />
<script src="mainpage.js"></script>
<title>Jaflix</title>
<script language="javascript">
	function begin() {
		document.myForm.pass.focus();
	}
	function checkIt() {
		if (!document.myForm.pass.value) {
			alert("비밀번호를 입력하지 않았습니다");
			document.myForm.pass.focus();
			return false;
		}
	}
</script>

</head>
<body onload="call_js()">
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<section>
		<jsp:include page="slide.jsp"></jsp:include>
		<form name="myForm" method="post" action="deleteUserProc.jsp"
			onsubmit="return checkIt()">
			<table width="260" border="1" align="center">
				<tr>
					<td colspan="2" align="center"><b>회원 탈퇴</b></td>
				</tr>
				<tr>
					<td width="150"><b>비밀번호입력</b></td>
					<td width="110"><input type="password" name="pass" size="15"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="회원탈퇴"> <input type="button" value="취 소"
						onclick="javascript:window.location='mainpage.jsp'"></td>
				</tr>
			</table>
		</form>

	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>