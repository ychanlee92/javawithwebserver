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
				<h2
					style="text-align: center; font-size: 35px; color: rgb(255, 255, 255); -webkit-text-stroke-width: 2px; -webkit-text-stroke-color: rgb(0, 0, 0);">고사양에
					오신 것을 환영합니다!</h2>
				<form action="loginProc.jsp" method="post"
					style="margin: 0 470px 0 470px;">
					<fieldset>
						<legend style="text-align: center">로그인</legend>
						<div style="display: flex">
							<div style="display: flex; flex-direction: column">
								<input type="text" name="userId2" id="userId2"
									placeholder="아이디 or 이메일" style="margin: 2px"
									onblur="userId2Check('blur')" onclick="userId2Check('focus')" />
								<input type="password" name="userPw2" id="userPw2"
									placeholder="비밀번호" style="margin: 2px"
									onblur="userPw2Check('blur')" onclick="userPw2Check('focus')" />
							</div>
							<div>
								<input
									style="width: 120px; height: 46px; margin: 2px; background-color: red; border: 1px solid black; border-radius: 4px; color: white;"
									type="submit" id="loginbutton" value="로그인" />
							</div>
						</div>
						<div>
							<span style="font-size: 13px; color: red" id="loginInfo">&nbsp;</span>
						</div>
						<div style="margin: 0 0 5px 0">
							<input style="accent-color: orange" type="checkbox"
								name="loginRemain" id="loginRemain" /><label
								style="font-size: 14px" for="loginRemain">로그인 상태 유지</label><input
								style="accent-color: green" type="checkbox" name="loginSave"
								id="loginSave" /><label style="font-size: 14px"
								for="loginRemain">아이디 저장</label>
						</div>
						<span
							style="border: 1px solid rgb(143, 143, 143); font-size: 13px; padding: 2px; border-radius: 3px;">개인
							정보 보호를 위해 <span style="color: red">개인 PC에서 사용해주세요.</span>
						</span>
						<div style="margin-top: 10px">
							<input type="button" value="아이디 찾기" onclick="idSearch()" /><input
								type="button" value="비밀번호 찾기" style="margin: 0 3px"
								onclick="pwSearch()" />
							<button type="button"
								style="background-color: gray; color: white; border: 1px solid rgb(63, 63, 63); border-radius: 2px;"
								type="button" value="회원가입" onclick="window.scrollTo(0,0)">
								<a href="/JSPStudy/mymemberone/signup.jsp">회원가입</a>
							</button>
						</div>
					</fieldset>
				</form>
			</div>
		</section>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
