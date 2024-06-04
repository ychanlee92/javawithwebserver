<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>사랑스러운 고사양 홈페이지</title>
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
	<div id="mainDiv">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="nav.jsp"></jsp:include>
		<jsp:include page="slideAside.jsp"></jsp:include>
		<section>
			<div id="section">
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
								onclick="javascript:window.location='projectmain.jsp'"></td>
						</tr>
					</table>
				</form>
			</div>
		</section>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
