<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String loginID = (String) session.getAttribute("loginID");
%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
	width: 100%;
	border-collapse: collapse;
}

th {
	height: 70px;
	width: 20%;
	border-right: 1px solid black;
	background-color: rgb(224, 241, 255);
}

th, td {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	border-collapse: collapse;
}

td {
	padding-left: 15px;
	font-size: 15px;
	width: 80%;
}

table {
	width: 100%;
	border-collapse: collapse;
}
</style>
<script src="https://kit.fontawesome.com/a3088bf1ff.js"
	crossorigin="anonymous" defer></script>
<link rel="stylesheet" href="projectmain.css?ver=1" />
<script src="projectmain.js?ver=1"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
	
</script>
<meta charset="UTF-8">
<title>사랑스러운 고사양 홈페이지</title>
</head>
<body onload="call_js()">
	<div id="mainDiv">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="nav.jsp"></jsp:include>
		<jsp:include page="slideAside.jsp"></jsp:include>
		<section>
			<div id="sectionSignup">
				<h1 style="text-align: center">고사양 회원가입</h1>
				<div class="div1">
					<span class="span1"><span class="span2">●</span> 온라인 회원가입 작성</span>
					<div class="div2">
						<span><span class="span3">●</span> 고객님의 정보는 개인 정보 보호 정책에 의해
							철저하게 보호됩니다.</span>
					</div>
					<form method="post" action="/JSPStudy/UserInfoInsert">
						<table>
							<tr>
								<th><label for="userId">사용자 ID <span class="span2">●</span></label>
								</th>
								<td><span style="font-size: 12px">&nbsp;</span> <br /> <input
									type="text" name="userId" id="userId" size="12" maxlength="12"
									onblur="userIdCheck('blur')" onclick="userIdCheck('focus')" />&nbsp;
									<button onclick="idCheck(this.form.userId.value)" type="button">ID
										중복확인</button> <br /> <span id="userIdInfo"
									style="font-size: 12px; color: red">&nbsp;</span></td>
							</tr>
							<tr>
								<th><label for="userPw">비밀번호 <span class="span2">●</span></label>
								</th>
								<td><span style="font-size: 12px">&nbsp;</span><br /> <input
									type="password" name="userPw" id="userPw" size="12"
									maxlength="12" minlength="4" onblur="userPwCheck('blur')"
									onclick="userPwCheck('focus')" />&nbsp; <span><span
										class="span3">●</span> 4~12자리의 영문, 숫자, 특수문자(!,@,$,%,^,&,*)만 가능</span><br />
									<span id="userPwInfo" style="font-size: 12px; color: red">&nbsp;</span>
								</td>
							</tr>
							<tr>
								<th><label for="userPw">비밀번호 확인 <span class="span2">●</span></label></th>
								<td><span style="font-size: 12px">&nbsp;</span><br /> <input
									type="password" name="userPwEqual" id="userPwEqual" size="12"
									maxlength="12" minlength="4" onblur="userPwEqualCheck('blur')"
									onclick="userPwEqualCheck('focus')" />&nbsp;<br /> <span
									id="userPwEqualInfo" style="font-size: 12px; color: red">&nbsp;</span>
								</td>
							</tr>
							<tr>
								<th><label for="userId">성명 <span class="span2">●</span></label>
								</th>
								<td><span style="font-size: 12px">&nbsp;</span><br /> <input
									type="text" name="userName" id="userName" size="12"
									onkeyup="userNameCheck()" onblur="userNameCheck('blur')"
									onclick="userNameCheck('focus')" />&nbsp;<span><span
										class="span3">●</span> 띄어쓰기 없이 입력, 반드시 실명이어야 합니다!</span><br /> <span
									id="userNameInfo" style="color: red; font-size: 12px">&nbsp;</span>
								</td>
							</tr>
							<tr>
								<th class="emailTh"><label for="userId">E-mail <span
										class="span2">●</span></label></th>
								<td><input type="email" name="userEmail" id="userEmail"
									onkeyup="userEmailCheck()" onblur="userEmailCheck('blur')"
									onclick="userEmailCheck('focus')" />&nbsp;<input
									type="checkbox" name="userEmailCheckBox" id="userEmailCheckBox"
									style="accent-color: red" /> <span>메일 수신 여부</span><br /> <span
									id="userEmailInfo" style="color: red; font-size: 12px">&nbsp;</span><br />
									<span class="span3">●</span> <span><b>할인 이벤트 정보</b> 및 할인
										쿠폰, 관심 분야 등 꼭 필요한 정보를 빠르게 받아보실 수 있습니다.<br /> <span
										class="span3">●</span> 비밀번호 분실 시 E-mail로 확인해 드리니, <span
										class="span4"><b>정확한 E-mail주소를 기입</b></span>해 주세요.</span></td>
							</tr>
							<tr>
								<th><label for="userAddressNumber">우편번호 <span
										class="span2">●</span>
								</label></th>
								<td><input type="text" name="userAddressNumber"
									id="userAddressNumber" size="7" maxlength="7" /><span>&nbsp;</span><input
									onclick="sample6_execDaumPostcode()" type="button"
									value="우편번호 검색" /></td>
							</tr>
							<tr>
								<th id="addressTh"><label for="userAddress">주소 <span
										class="span2">●</span></label></th>
								<td><input type="text" name="userAddress" id="userAddress"
									size="55" style="margin: 2px 0" /><br> <input type="text"
									name="userAddressDetailed" id="userAddressDetailed" size="55"
									style="margin: 2px 0" /><br> <input type="text"
									name="userAddressExtra" id="userAddressExtra" size="55"
									style="margin: 2px 0" /></td>
							</tr>
							<tr>
								<th><label for="userId">휴대폰 번호 <span class="span2">●</span></label></th>
								<td><input type="text" name="userPhone1" id="userPhone"
									size="4" maxlength="4" /><span>-</span><input type="text"
									name="userPhone2" id="userPhone2" size="4" maxlength="4" /><span>-</span><input
									type="text" name="userPhone3" id="userPhone3" size="4"
									maxlength="4" /></td>
							</tr>
						</table>
						<div class="div3">
							<button onclick="allCheck(event)" type="button">다음</button>
						</div>
					</form>
				</div>
			</div>
		</section>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
