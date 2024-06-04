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
</head>
<body onload="call_js()">
	<div id="mainDiv">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="nav.jsp"></jsp:include>
		<jsp:include page="slideAside.jsp"></jsp:include>
		<section>
			<div id="section">
				<div>
					<img src="source/1.jpg" alt="사진1"
						onclick="call_confirm(this.src,'1.jpg')" /> <img
						src="source/3.jpg" alt="사진2"
						onclick="call_confirm(this.src,'3.jpg')" /> <img
						src="source/4.jpg" alt="사진3"
						onclick="call_confirm(this.src,'4.jpg')" />
				</div>
				<div>
					<img src="source/5.jpg" alt="사진4"
						onclick="call_confirm(this.src,'5.jpg')" /> <img
						src="source/6.jpg" alt="사진5"
						onclick="call_confirm(this.src,'6.jpg')" /> <img
						src="source/7.jpg" alt="사진6"
						onclick="call_confirm(this.src,'7.jpg')" />
				</div>
			</div>
		</section>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
