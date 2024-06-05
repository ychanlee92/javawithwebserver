<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String[] movie = { "프리즌브레이크", "매드맥스", "마블" };
request.setAttribute("movie", movie);
%>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	인기 미국 드라마:
	<ul>
		<c:forEach var="movie" items="${movie}">
			<li>${movie}</li>
		</c:forEach>
	</ul>
</body>
</html>