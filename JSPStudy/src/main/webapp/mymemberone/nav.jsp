<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String loginID = (String) session.getAttribute("loginID");
%>
<nav>
	<div id="nav">
		<%
		if (loginID != null) {
			if (loginID.equals("admin")) {
		%>
		<div id="navLeft">
			<a href=""><b>home</b></a> <a href=""><b>gallery</b></a>
			<div id="boardDiv">
				<a href="" id="boardAA"><b>board</b></a>
				<div id="boardHide">
					<a href="list.jsp" class="boardA"><b>자유게시판</b></a> <a href=""
						class="boardA"><b>문의게시판</b></a> <a href="" class="boardA"
						style="border-bottom: 2px solid darkgray"><b>건의게시판</b></a>
				</div>
			</div>
			<a href=""><b>goods</b></a> <a href=""><b>roadmap</b></a>
		</div>
		<div id="navRight">
			<a></a> <a href="" class="navA"><b><%=loginID%></b></a> <a
				href="customerList.jsp" class="navA"><b>회원삭제</b></a> <a
				href="logout.jsp" class="navA"><b>로그아웃</b></a>
		</div>
		<%
		} else {
		%>
		<div id="navLeft">
			<a href=""><b>home</b></a> <a href=""><b>gallery</b></a>
			<div id="boardDiv">
				<a href="" id="boardAA"><b>board</b></a>
				<div id="boardHide">
					<a href="list.jsp" class="boardA"><b>자유게시판</b></a> <a href=""
						class="boardA"><b>문의게시판</b></a> <a href="" class="boardA"
						style="border-bottom: 2px solid darkgray"><b>건의게시판</b></a>
				</div>
			</div>
			<a href=""><b>goods</b></a> <a href=""><b>roadmap</b></a>
		</div>
		<div id="navRight">
			<a href="" class="navA"><b><%=loginID%></b></a> <a
				href="modifyForm.jsp" class="navA"><b>개인정보수정</b></a> <a
				href="deleteUserForm.jsp" class="navA"><b>계정탈퇴</b></a> <a
				href="logout.jsp" class="navA"><b>로그아웃</b></a>
		</div>
		<%
		}
		} else {
		%>
		<div id="navLeft">
			<a href=""><b>home</b></a> <a href=""><b>gallery</b></a>
			<div id="boardDiv">
				<a href="" id="boardAA"><b>board</b></a>
				<div id="boardHide">
					<a href="" class="boardA" onclick="noAccess()"><b>자유게시판</b></a> <a
						href="" class="boardA"><b>문의게시판</b></a> <a href="" class="boardA"
						style="border-bottom: 2px solid darkgray"><b>건의게시판</b></a>
				</div>
			</div>
			<a href=""><b>goods</b></a> <a href=""><b>roadmap</b></a>
		</div>
		<div id="navRight">
			<a></a> <a></a> <a></a> <a></a> <a></a> <a href="login.jsp"
				class="navA"><b>login</b></a> <a href="signup.jsp" class="navA"><b>signup</b></a>
			<a href=""></a>
		</div>
		<%
		}
		%>
	</div>
</nav>