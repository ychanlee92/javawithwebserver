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
<link rel="stylesheet" href="projectmain.css?after" />
<script src="projectmain.js?ver=1"></script>
<meta charset="UTF-8">
<title>사랑스러운 고사양 홈페이지</title>
</head>
<body onload="call_js()">
	<div id="mainDiv">
	<%-- 	<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="nav.jsp"></jsp:include>
		<jsp:include page="slideAside.jsp"></jsp:include> --%>
		<section>
			<div id="sectionFreeboard">
				<img src="source/14.jpg" alt="고양이사진8"
					onclick="call_confirm(this.src,'14.jpg')" style="height: 200px" />
				<div>
					<table id="freeBoardTable">
						<tr>
							<th>게시물 번호</th>
							<th>제목</th>
							<th>아이디</th>
							<th>날짜</th>
						</tr>
						<tr>
							<td class="tdNum">20</td>
							<td class="tdTitle"><a href="free-board/page20.html"
								target="free-boardIframe">고양이사진20</a></td>
							<td class="tdId">ychanlee92</td>
							<td class="tdDate">2024-04-28</td>
						</tr>
						<tr>
							<td>19</td>
							<td class="tdTitle"><a href="free-board/page19.html"
								target="free-boardIframe">고양이사진19</a></td>
							<td class="tdId">ychanlee92</td>
							<td>2024-04-28</td>
						</tr>
						<tr>
							<td>18</td>
							<td class="tdTitle"><a href="free-board/page18.html"
								target="free-boardIframe">고양이사진18</a></td>
							<td class="tdId">ychanlee92</td>
							<td>2024-04-28</td>
						</tr>
						<tr>
							<td>17</td>
							<td class="tdTitle"><a href="">고양이사진17</a></td>
							<td class="tdId">ychanlee92</td>
							<td>2024-04-28</td>
						</tr>
						<tr>
							<td>16</td>
							<td class="tdTitle"><a href="">고양이사진16</a></td>
							<td class="tdId">ychanlee92</td>
							<td>2024-04-28</td>
						</tr>
						<tr>
							<td>15</td>
							<td class="tdTitle"><a href="">고양이사진15</a></td>
							<td class="tdId">ychanlee92</td>
							<td>2024-04-28</td>
						</tr>
						<tr>
							<td>14</td>
							<td class="tdTitle"><a href="">고양이사진14</a></td>
							<td class="tdId">ychanlee92</td>
							<td>2024-04-28</td>
						</tr>
						<tr>
							<td>13</td>
							<td class="tdTitle"><a href="">고양이사진13</a></td>
							<td class="tdId">ychanlee92</td>
							<td>2024-04-28</td>
						</tr>
						<tr>
							<td>12</td>
							<td class="tdTitle"><a href="">고양이사진12</a></td>
							<td class="tdId">ychanlee92</td>
							<td>2024-04-28</td>
						</tr>
						<tr>
							<td>11</td>
							<td class="tdTitle"><a href="">고양이사진11</a></td>
							<td class="tdId">ychanlee92</td>
							<td>2024-04-28</td>
						</tr>
					</table>
					<div id="pageDiv">
						<a id="pageDivA1" href=""><b>1</b></a> <a href="section2.html"
							target="free-boardIframe"><b>2</b></a>
					</div>
				</div>
				<img src="source/12.jpg" alt="고양이사진9"
					onclick="call_confirm(this.src,'12.jpg')" style="height: 200px" />
			</div>
<%-- 		</section>
		<jsp:include page="footer.jsp"></jsp:include> --%>
	</div>
</body>
</html>
