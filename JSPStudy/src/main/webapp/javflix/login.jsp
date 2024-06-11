<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String loginID = (String) session.getAttribute("loginID");
%>
<html>
<head>
<link rel="stylesheet" href="mainpage.css" />
<link rel="stylesheet" href="login.css" />
<script src="mainpage.js"></script>
<title>Jaflix</title>
</head>
<body onload="call_js()">
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<section>
		<jsp:include page="slide.jsp"></jsp:include>
		<h2>Javflix에 오신 것을 환영합니다!</h2>
		<form action="loginProc.jsp" method="post">
			<fieldset>
				<legend>로그인</legend>
				<div style="display: flex">
					<div id="div1">
						<input type="text" name="userId2" id="userId2"
							placeholder="아이디 or 이메일" onblur="userId2Check('blur')"
							onclick="userId2Check('focus')" /> <input
							type="password" name="userPw2" id="userPw2" placeholder="비밀번호"
							onblur="userPw2Check('blur')" onclick="userPw2Check('focus')" />
					</div>
					<div>
						<input type="submit" id="loginbutton" value="로그인" />
					</div>
				</div>
				<div>
					<span id="loginInfo">&nbsp;</span>
				</div>
				<div id="div2">
					<input type="checkbox" name="loginRemain" id="loginRemain" /><label
						id="label1" for="loginRemain">로그인 상태 유지</label><input
						type="checkbox" name="loginSave" id="loginSave" /><label
						for="loginRemain">아이디 저장</label>
				</div>
				<span id="span1">개인 정보 보호를 위해 <span id="span2">개인
						PC에서 사용해주세요.</span>
				</span>
				<div id="div3">
					<input type="button" value="아이디 찾기" onclick="idSearch()" /><input
						type="button" value="비밀번호 찾기" id="input1" onclick="pwSearch()" />
					<button type="button" id="button1" type="button" value="회원가입">
						<a href="/JSPStudy/javflix/signup.jsp">회원가입</a>
					</button>
				</div>
			</fieldset>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>