<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<script>
	function call_confirm(imageURL, fileName) {
		if (confirm("이미지를 다운로드하겠습니까?")) {
			let img = new Image();
			img.crossOrigin = "Anonymous";
			img.id = "getshot";
			img.src = imageURL;
			document.body.appendChild(img);

			let a = document.createElement("a");
			a.href = getshot.src;
			a.download = fileName;
			a.click();
			document.body.removeChild(img);
		}
	}
</script>
<!-- </head>
<body> -->
<div id="divSectionMainSection" />
<div>
	<img src="source/1.jpg" alt="사진1"
		onclick="call_confirm(this.src,'1.jpg')" style="height: 280px" /> <img
		src="source/3.jpg" alt="사진2" onclick="call_confirm(this.src,'3.jpg')"
		style="height: 280px" /> <img src="source/4.jpg" alt="사진3"
		onclick="call_confirm(this.src,'4.jpg')" style="height: 280px" />
</div>
<div>
	<img src="source/5.jpg" alt="사진4"
		onclick="call_confirm(this.src,'5.jpg')" style="height: 280px" /> <img
		src="source/6.jpg" alt="사진5" onclick="call_confirm(this.src,'6.jpg')"
		style="height: 280px" /> <img src="source/7.jpg" alt="사진6"
		onclick="call_confirm(this.src,'7.jpg')" style="height: 280px" />
</div>
</div>
<!-- </body>
</html> -->