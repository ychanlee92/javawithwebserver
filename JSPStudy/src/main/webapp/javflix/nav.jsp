<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
String loginID = (String) session.getAttribute("loginID");
%>
<nav>
	<div id="nav">
		<div>
			<a href=""></a>
		</div>
		<div id="navDiv">
			<a href="" class="boardA">국비지원과정 </a> <a href="" class="boardA">Javflix소개</a>
			<a href="" id="boardAA" class="boardA">취업지원센터</a> <a href=""
				class="boardA">프로젝트</a> <a href="" class="boardA">커뮤니티 </a> <a
				href="" class="boardA">산학연계</a> <a href="" class="boardA">마이페이지</a>
			<a href="" id="navA" class="boardA">고객센터</a>
			<div id="boardDiv">
				<div id="boardHide">
					<%
					if (loginID != null) {
						if (loginID.equals("admin")) {
					%>
					<div id="hideBoard">
						<div>
							<div class="boardHide" id="board1">
								<a href="">개발자 양성 과정</a> <a href="">개강일정</a> <a href="">국비지원이란?</a>
							</div>
							<div class="boardHide" id="board2">
								<a href="">About Javflix</a> <a href="">제휴사이트</a> <a href="">직원구인</a>
							</div>
							<div class="boardHide" id="board3">
								<a href="">취업프로세스</a> <a href="">취업채용</a> <a href=""></a>
							</div>
							<div class="boardHide" id="board4">
								<a href="">OTT프로젝트</a> <a href="">Javflix 비전</a> <a href="">OTT신청</a>
							</div>
							<div class="boardHide" id="board5">
								<a href="ottlist.jsp">OTT정보</a> <a href="board.jsp">OTT후기</a> <a
									href=""></a>
							</div>
							<div class="boardHide" id="board6">
								<a href="">기술자문의원</a> <a href="">OTT특강</a> <a href="">실무자인터뷰</a>
							</div>
							<div class="boardHide" id="board7">
								<a href="">관리자모드</a> <a href="customerList.jsp">회원삭제</a> <a
									href="logout.jsp">로그아웃</a>
							</div>
							<%
							} else {
							%>
							<div id="hideBoard">
								<div>
									<div class="boardHide" id="board1">
										<a href="">개발자 양성 과정</a> <a href="">개강일정</a> <a href="">국비지원이란?</a>
									</div>
									<div class="boardHide" id="board2">
										<a href="">About Javflix</a> <a href="">제휴사이트</a> <a href="">직원구인</a>
									</div>
									<div class="boardHide" id="board3">
										<a href="">취업프로세스</a> <a href="">취업채용</a> <a href=""></a>
									</div>
									<div class="boardHide" id="board4">
										<a href="">OTT프로젝트</a> <a href="">Javflix 비전</a> <a href="">OTT신청</a>
									</div>
									<div class="boardHide" id="board5">
										<a href="ottUser.jsp">OTT정보</a> <a href="board.jsp">OTT후기</a>
										<a href=""></a>
									</div>
									<div class="boardHide" id="board6">
										<a href="">기술자문의원</a> <a href="">OTT특강</a> <a href="">실무자인터뷰</a>
									</div>
									<div class="boardHide" id="board7">
										<a href="modifyForm.jsp">개인정보수정</a> <a
											href="deleteUserForm.jsp">계정탈퇴</a> <a href="logout.jsp">로그아웃</a>
									</div>
									<%
									}
									} else {
									%>
									<div id="hideBoard">
										<div>
											<div class="boardHide" id="board1">
												<a href="">개발자 양성 과정</a> <a href="">개강일정</a> <a href="">국비지원이란?</a>
											</div>
											<div class="boardHide" id="board2">
												<a href="">About Javflix</a> <a href="">제휴사이트</a> <a href="">직원구인</a>
											</div>
											<div class="boardHide" id="board3">
												<a href="">취업프로세스</a> <a href="">취업채용</a> <a href=""></a>
											</div>
											<div class="boardHide" id="board4">
												<a href="">OTT프로젝트</a> <a href="">Javflix 비전</a> <a href="">OTT신청</a>
											</div>
											<div class="boardHide" id="board5">
												<a href="ottUser.jsp">OTT정보</a> <a href="" onclick="noAccess()">OTT후기</a>
												<a href=""></a>
											</div>
											<div class="boardHide" id="board6">
												<a href="">기술자문의원</a> <a href="">OTT특강</a> <a href="">실무자인터뷰</a>
											</div>
											<div class="boardHide" id="board7">
												<a href="login.jsp">로그인</a> <a href="signup.jsp">회원가입</a> <a
													href="">건의게시판</a>
											</div>
											<%
											}
											%>
											<div class="boardHide" id="board8">
												<a href="">온라인 상담</a> <a href="">FAQ</a> <a href="">국비대상자
													조회</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
</nav>