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
</head>
<body onload="call_js()">
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<section>
		<jsp:include page="slide.jsp"></jsp:include>
		<span id="sectionSpan"><b>Javflix에 새로 올라온 콘텐츠</b></span>
		<div id="sectionOtt">
			<div id="ottDiv">
				<div class="ottSlide">
					<a href="" onclick="youtube1()"><img src="./img/ott1.webp"
						alt="" /></a> <a href="" onclick="youtube2()"><img
						src="./img/ott2.jpg" alt="" /></a> <a href=""><img
						src="./img/ott3.jpeg" alt="" /></a> <a href=""><img
						src="./img/ott4.webp" alt="" /></a> <a href=""><img
						src="./img/ott5.jpg" alt="" /></a> <a href=""><img
						src="./img/ott6.webp" alt="" /></a>
				</div>
				<div class="ottSlide">
					<a href="" onclick="youtube3()"><img src="./img/ott7.jpg"
						alt="" /></a> <a href=""><img src="./img/ott8.jpg" alt="" /></a> <a
						href=""><img src="./img/ott9.webp" alt="" /></a> <a href=""><img
						src="./img/ott10.jpg" alt="" /></a> <a href=""><img
						src="./img/ott11.webp" alt="" /></a> <a href=""><img
						src="./img/ott12.webp" alt="" /></a>
				</div>
				<div class="ottSlide">
					<a href=""><img src="./img/ott13.webp" alt="" /></a> <a href=""
						onclick="youtube4()"><img src="./img/ott14.webp" alt="" /></a> <a
						href=""><img src="./img/ott15.jpg" alt="" /></a> <a href=""><img
						src="./img/ott16.jpg" alt="" /></a> <a href=""><img
						src="./img/ott17.webp" alt="" /></a> <a href=""><img
						src="./img/ott18.webp" alt="" /></a>
				</div>
			</div>
			<div id="slideSide2">
				<a href="" class="prev2"><img src="./img/side.png" alt="" /></a> <a
					href="" class="next2"><img src="./img/side2.png" alt="" /></a>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>