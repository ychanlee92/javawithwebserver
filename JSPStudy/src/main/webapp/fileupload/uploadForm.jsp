<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<form action="uploadProc.jsp" method="post"
			enctype="multipart/form-data">
			<table border=1>
				<tr>
					<td colspan=2 align=center><h3>파일 업로드 폼</h3></td>
				</tr>
				<tr>
					<td>파일명1 :</td>
					<td><input type="file" name="file"></td>
				</tr>
				<tr>
					<td colspan=2 align=center><input type="submit" value="전송"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>