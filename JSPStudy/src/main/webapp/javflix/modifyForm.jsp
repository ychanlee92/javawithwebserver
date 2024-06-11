<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*,memberone.*,mymemberone.*"%>
<%
StudentDAO dao = StudentDAO.getInstance();
%>
<html>
<head>
<title>Update Form</title>
<script src="projectmain.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
	
</script>
<style>
.span2 {
	color: red;
	font-size: 6px;
	position: relative;
	bottom: 3px;
}

.span3 {
	color: rgb(136, 136, 136);
	font-size: 8px;
	position: relative;
	bottom: 2px;
}

.div2 {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	border-collapse: collapse;
	padding: 30px 0;
	margin-top: 15px;
}

.div1 {
	margin: 0 auto;
	width: 90%;
}

h1 {
	text-align: center;
}

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

.div3 {
	padding-top: 15px;
	display: flex;
	justify-content: center;
}

td {
	padding-left: 15px;
	font-size: 15px;
	width: 80%;
}

.span4 {
	color: cornflowerblue;
}

.emailTh {
	height: 120px;
}

fieldset {
	width: 550px;
}

#addressTh {
	height: 100px;
}
</style>
</head>
<%
String loginID = (String) session.getAttribute("loginID");
UserInfoVO vo = dao.getMember(loginID);
String phone1 = vo.getPhone().substring(0, 3);
String phone2 = vo.getPhone().substring(3, 7);
String phone3 = vo.getPhone().substring(7, 11);
%>
<body>
	<h1>개인정보 수정</h1>
	<div class="div1">
		<span class="span1"><span class="span2">●</span> 개인 정보 수정</span>
		<div class="div2">
			<span><span class="span3">●</span> 고객님의 정보는 개인 정보 보호 정책에 의해
				철저하게 보호됩니다.</span>
		</div>
		<form name="regForm" method="post" action="modifyProc.jsp?ver=1">
			<table>
				<tr>
					<th><label for="userId">사용자 ID <span class="span2">●</span></label>
					</th>
					<td><span style="font-size: 18px" name="userId"><b><%=vo.getUserId()%></b></span>
					</td>
				</tr>
				<tr>
					<th><label for="userPw">비밀번호 <span class="span2">●</span></label>
					</th>
					<td><span style="font-size: 12px">&nbsp;</span><br /> <input
						type="password" name="userPw" id="userPw" size="12" maxlength="12"
						minlength="4" onblur="userPwCheck('blur')"
						onclick="userPwCheck('focus')" value="<%=vo.getPassword()%>" />&nbsp;
						<span><span class="span3">●</span> 4~12자리의 영문, 숫자,
							특수문자(!,@,$,%,^,&,*)만 가능</span><br /> <span id="userPwInfo"
						style="font-size: 12px; color: red">&nbsp;</span></td>
				</tr>
				<tr>
					<th class="emailTh"><label for="userId">E-mail <span
							class="span2">●</span></label></th>
					<td><input type="email" name="userEmail" id="userEmail"
						onkeyup="userEmailCheck()" onblur="userEmailCheck('blur')"
						onclick="userEmailCheck('focus')" value="<%=vo.getEmail()%>" />&nbsp;<input
						type="checkbox" name="userEmailCheckBox" id="userEmailCheckBox"
						style="accent-color: red" /> <span>메일 수신 여부</span><br /> <span
						id="userEmailInfo" style="color: red; font-size: 12px">&nbsp;</span><br />
						<span class="span3">●</span> <span><b>할인 이벤트 정보</b> 및 할인
							쿠폰, 관심 분야 등 꼭 필요한 정보를 빠르게 받아보실 수 있습니다.<br /> <span class="span3">●</span>
							비밀번호 분실 시 E-mail로 확인해 드리니, <span class="span4"><b>정확한
									E-mail주소를 기입</b></span>해 주세요.</span></td>
				</tr>
				<tr>
					<th><label for="userAddressNumber">우편번호 <span
							class="span2">●</span>
					</label></th>
					<td><input type="text" name="userAddressNumber"
						id="userAddressNumber" size="7" maxlength="7"
						value="<%=vo.getPostNum()%>" /><span>&nbsp;</span><input
						onclick="sample6_execDaumPostcode()" type="button" value="우편번호" /></td>
				</tr>
				<tr>
					<th id="addressTh"><label for="userAddress">주소 <span
							class="span2">●</span></label></th>
					<td><input type="text" name="userAddress" id="userAddress"
						size="55" style="margin: 2px 0" value="<%=vo.getAddress1()%>" />
						<input type="text" name="userAddressDetailed"
						id="userAddressDetailed" size="55" style="margin: 2px 0"
						value="<%=vo.getAddress2()%>" /> <input type="text"
						name="userAddressExtra" id="userAddressExtra" size="55"
						style="margin: 2px 0" value="<%=vo.getAddress3()%>" /></td>
				</tr>
				<tr>
					<th><label for="userId">휴대폰 번호 <span class="span2">●</span></label></th>
					<td><input type="text" name="userPhone1" id="userPhone"
						size="4" maxlength="4" value="<%=phone1%>" /><span>-</span><input
						type="text" name="userPhone2" id="userPhone2" size="4"
						maxlength="4" value="<%=phone2%>" /><span>-</span><input
						type="text" name="userPhone3" id="userPhone3" size="4"
						maxlength="4" value="<%=phone3%>" /></td>
				</tr>
			</table>
			<div class="div3">
				<button onclick="allCheck(event)" type="submit">다음</button>
			</div>
		</form>
	</div>
</body>
</html>