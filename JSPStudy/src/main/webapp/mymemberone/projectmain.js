function call_js() {
	//ui 객체 참조 변수 선언
	let slideshow = document.querySelector(".slideshow");
	let slideshow_slides = document.querySelector(".slideshow_slides");
	//<a herf='#'><img></a> ui 객체 배열
	let slides = document.querySelectorAll(".slideshow_slides a");
	let prev = document.querySelector(".prev");
	let next = document.querySelector(".next");
	let indicators = document.querySelectorAll(".indicator a");
	//회전목마 현재 위치 값, 시간 설정, 슬라이드 수
	let currentIndex = 0;
	let timer = null;
	let slideCount = slides.length;
	//회전목마 이미지를 우측으로 배치시켜준다.
	for (let i = 0; i < slideCount; i++) {
		let newLeft = i * 100 + "%";
		slides[i].style.left = newLeft;
	}
	//회전목마를 움직인다. () slideshow_slides 왼쪽으로 -100% 이동
	function gotoSlide(index) {
		currentIndex = index;
		let newLeft = index * -100 + "%";
		slideshow_slides.style.left = newLeft;
		indicators.forEach((e) => {
			e.classList.remove("active");
		});
		indicators[currentIndex].classList.add("active");
	}
	gotoSlide(0);
	function startTimer() {
		timer = setInterval(() => {
			currentIndex += 1;
			let index = currentIndex % slideCount;
			gotoSlide(index);
		}, 3000);
	}
	startTimer();
	slideshow_slides.addEventListener("mouseenter", function() {
		clearInterval(timer);
	});
	slideshow_slides.addEventListener("mouseleave", function() {
		startTimer();
	});
	prev.addEventListener("mouseenter", function() {
		clearInterval(timer);
	});
	next.addEventListener("mouseenter", function() {
		clearInterval(timer);
	});
	prev.addEventListener("click", function(e) {
		e.preventDefault(); //앵커의 tag 기본 기능을 막는다.
		currentIndex -= 1;
		if (currentIndex < 0) {
			currentIndex = slideCount - 1;
		}
		gotoSlide(currentIndex);
	});
	next.addEventListener("click", function(e) {
		e.preventDefault(); //앵커의 tag 기본 기능을 막는다.
		currentIndex += 1;
		if (currentIndex > slideCount - 1) {
			currentIndex = 0;
		}
		gotoSlide(currentIndex);
	});
	indicators.forEach((e) => {
		e.addEventListener("mouseenter", function() {
			clearInterval(timer);
		});
	});
	for (let i = 0; i < indicators.length; i++) {
		indicators[i].addEventListener("click", (e) => {
			e.preventDefault();
			gotoSlide(i);
		});
	}
}
//스크롤함수
let ctnt = []; // 배열 선언
ctnt[0] = "<img src='./source/2.jpg' height='130px'>";
ctnt[1] = "<img src='./source/16.jpg' height='130px'>";
ctnt[2] = "<img src='./source/17.jpg' height='130px'>";
ctnt[3] = "<img src='./source/18.jpg' height='130px'>";
ctnt[4] = "<img src='./source/19.jpg' height='130px'>";
ctnt[5] = "<img src='./source/20.png' height='130px'>";
ctnt[6] = "<img src='./source/21.jpg' height='130px'>";
ctnt[7] = "<img src='./source/22.jpg' height='130px'>";
let timer = 0;
function start() {

	document.write("<div id='area" + 0 + "' style='position: absolute; top:0; left:" + 0 + "px'>");
	document.write(ctnt[0]);
	document.write("</div>");

	document.write("<div id='area" + 1 + "' style='position: absolute; top:0; left:" + 196 + "px'>");
	document.write(ctnt[1]);
	document.write("</div>");

	document.write("<div id='area" + 2 + "' style='position: absolute; top:0; left:" + 326 + "px'>");
	document.write(ctnt[2]);
	document.write("</div>");

	document.write("<div id='area" + 3 + "' style='position: absolute; top:0; left:" + 456 + "px'>");
	document.write(ctnt[3]);
	document.write("</div>");

	document.write("<div id='area" + 4 + "' style='position: absolute; top:0; left:" + 586 + "px'>");
	document.write(ctnt[4]);
	document.write("</div>");

	document.write("<div id='area" + 5 + "' style='position: absolute; top:0; left:" + 718 + "px'>");
	document.write(ctnt[5]);
	document.write("</div>");

	document.write("<div id='area" + 6 + "' style='position: absolute; top:0; left:" + 868 + "px'>");
	document.write(ctnt[6]);
	document.write("</div>");

	document.write("<div id='area" + 7 + "' style='position: absolute; top:0; left:" + 994 + "px'>");
	document.write(ctnt[7]);
	document.write("</div>");

	setTimeout(scroll, 0);
}
function scroll() {
	let tmp = null;
	tmp = document.getElementById("area" + 0).style;
	tmp.left = parseInt(tmp.left) - 2 + "px";
	if (parseInt(tmp.left) <= -196) {
		tmp.left = 902 + "px"
	}
	tmp = document.getElementById("area" + 1).style;
	tmp.left = parseInt(tmp.left) - 2 + "px";
	if (parseInt(tmp.left) <= -130) {
		tmp.left = 968 + "px"
	}
	tmp = document.getElementById("area" + 2).style;
	tmp.left = parseInt(tmp.left) - 2 + "px";
	if (parseInt(tmp.left) <= -130) {
		tmp.left = 968 + "px"
	}
	tmp = document.getElementById("area" + 3).style;
	tmp.left = parseInt(tmp.left) - 2 + "px";
	if (parseInt(tmp.left) <= -130) {
		tmp.left = 968 + "px"
	}
	tmp = document.getElementById("area" + 4).style;
	tmp.left = parseInt(tmp.left) - 2 + "px";
	if (parseInt(tmp.left) <= -132) {
		tmp.left = 966 + "px"
	}
	tmp = document.getElementById("area" + 5).style;
	tmp.left = parseInt(tmp.left) - 2 + "px";
	if (parseInt(tmp.left) <= -150) {
		tmp.left = 948 + "px"
	}
	tmp = document.getElementById("area" + 6).style;
	tmp.left = parseInt(tmp.left) - 2 + "px";
	if (parseInt(tmp.left) <= -128) {
		tmp.left = 970 + "px"
	}
	tmp = document.getElementById("area" + 7).style;
	tmp.left = parseInt(tmp.left) - 2 + "px";
	if (parseInt(tmp.left) <= -104) {
		tmp.left = 994 + "px"
	}

	timer = setTimeout(scroll, 30);
}
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
function userIdCheck(state) {
	const userId = document.querySelector("#userId");
	const userIdInfo = document.querySelector("#userIdInfo");
	if (state === "blur") {
		if (userId.value === "") {
			userIdInfo.innerHTML = `필수 입력 항목입니다.`;
			return false;
		} else {
			userIdInfo.innerHTML = "&nbsp;";
			return true;
		}
	} else if (state === "focus") {
		userIdInfo.innerHTML = "&nbsp;";
		return false;
	}
}
function idCheck(id) {
	if (id === "") {
		alert("아이디를 입력해 주세요.");
		document.signup.userId.focus();
	} else {
		url = "idCheck.jsp?id=" + id;
		window.open(url, "post", "width=300,height=150");
	}
}
function closeWindow(i) {
	if (i === 1) {
		opener.document.signup.userId.value = '';
	}
	self.close();
}
function userPwCheck(state) {
	const userPw = document.querySelector("#userPw");
	const userPwInfo = document.querySelector("#userPwInfo");
	if (state === "blur") {
		if (userPw.value === "") {
			userPwInfo.innerHTML = `필수 입력 항목입니다.`;
			return false;
		} else {
			userPwInfo.innerHTML = "&nbsp;";
			return true;
		}
	} else if (state === "focus") {
		userPwInfo.innerHTML = "&nbsp;";
		return false;
	}
}
function userPwEqualCheck(state) {
	const userPw = document.querySelector("#userPw");
	const userPwEqual = document.querySelector("#userPwEqual");
	const userPwEqualInfo = document.querySelector("#userPwEqualInfo");
	if (state === "blur") {
		if (userPwEqual.value === "") {
			userPwEqualInfo.innerHTML = "필수입력 항목입니다.";
			return false;
		} else if (userPwEqual.value === userPw.value) {
			userPwEqualInfo.innerHTML = "비밀번호와 일치합니다.";
			return true;
		} else {
			userPwEqualInfo.innerHTML = "비밀번호와 일치하지 않습니다.";
			return false;
		}
	} else if (state === "focus") {
		userPwEqualInfo.innerHTML = "&nbsp;";
		return false;
	}
}
function userNameCheck(state) {
	const userName = document.querySelector("#userName");
	const userNameInfo = document.querySelector("#userNameInfo");
	let nameExp = /^[가-힣]{2,4}$/;
	if (state === "blur") {
		if (userName.value === "") {
			userNameInfo.innerHTML = `필수입력항목입니다.`;
			return false;
		} else {
			if (!userName.value.match(nameExp)) {
				userNameInfo.innerHTML = `한글2~4문자입력바람`;
				return false;
			} else {
				userNameInfo.innerHTML = `ok`;
				return true;
			}
		}
	} else if (state === "focus") {
		userNameInfo.innerHTML = `&nbsp;`;
	}
}
function userEmailCheck(state) {
	const userEmail = document.querySelector("#userEmail");
	const userEmailInfo = document.querySelector("#userEmailInfo");
	let emailExp = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$/i;
	if (state === "blur") {
		if (!userEmail.value.match(emailExp)) {
			userEmailInfo.innerHTML = `이메일 형식에 맞게 입력하세요.`;
			return false;
		} else if (userEmail.value === "") {
			userEmailInfo.innerHTML = `필수입력항목`;
			return false;
		} else {
			userEmailInfo.innerHTML = `ok`;
			return true;
		}
	} else if (state === "focus") {
		userEmailInfo.innerHTML = `&nbsp;`;
	}
}
function allCheck(event) {
	const idCheck = document.querySelector("#userId");
	const userPw = document.querySelector("#userPw");
	const userName = document.querySelector("#userName");
	const userEmail = document.querySelector("#userEmail");
	const userPost = document.querySelector("#userAddressNumber");
	const userAddress = document.querySelector("#userAddress");
	const userAddressDetailed = document.querySelector("#userAddressDetailed");
	const userAddressExtra = document.querySelector("#userAddressExtra");
	const userPhone = document.querySelector("#userPhone");
	const userPhone2 = document.querySelector("#userPhone2");
	const userPhone3 = document.querySelector("#userPhone3");
	let c = 0;
	if (userPost.value !== "" && userAddress.value !== "" && userAddressDetailed.value !== "" && userAddressExtra.value !== "" && userPhone.value !== "" && userPhone2.value !== "" && userPhone3.value !== "") {
		c = 1;
	}
	if (
		userIdCheck("blur") &&
		userPwCheck("blur") &&
		userPwEqualCheck("blur") &&
		userNameCheck("blur") &&
		userEmailCheck("blur") && c === 1
	) {
		userI[userI.length] = idCheck.value;
		userP[userI.length] = userPw.value;
		userN[userI.length] = userName.value;
		window.scrollTo(0, document.body.scrollHeight)
		alert(
			`가입 완료!! \n아이디: ${idCheck.value} \n비밀번호: ${userPw.value} \n성명: ${userName.value}\nEmail: ${userEmail.value} `
		);
		document.signup.submit();
		return true;
	} else {
		alert("가입 양식을 완성하세요.");
	}
}
function sample6_execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			let addr = '';
			let extraAddr = '';
			if (data.userSelectedType === 'R') {
				addr = data.roadAddress;
			} else {
				addr = data.jibunAddress;
			}
			if (data.userSelectedType === 'R') {
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				} if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				document.getElementById("userAddressExtra").value = extraAddr;
			} else {
				document.getElementById("userAddressExtra").value = '';
			}
			document.getElementById('userAddressNumber').value = data.zonecode;
			document.getElementById("userAddress").value = addr;
			document.getElementById("userAddressDetailed").focus();
		}
	}).open();
}
//로그인 함수
function userId2Check(state) {
	const userId2 = document.querySelector("#userId2");
	const loginInfo = document.querySelector("#loginInfo");
	if (state === "blur") {
		if (userId2.value === "") {
			loginInfo.innerHTML = `&nbsp`;
			return false;
		} else {
			loginInfo.innerHTML = "&nbsp;";
			return true;
		}
	} else if (state === "focus") {
		loginInfo.innerHTML = "아이디 혹은 이메일을 입력하세요";
		return false;
	}
}
function userPw2Check(state) {
	const userPw2 = document.querySelector("#userPw2");
	const loginInfo = document.querySelector("#loginInfo");
	if (state === "blur") {
		if (userPw2.value === "") {
			loginInfo.innerHTML = `필수 입력 항목입니다.`;
			return false;
		} else {
			loginInfo.innerHTML = "&nbsp;";
			return true;
		}
	} else if (state === "focus") {
		loginInfo.innerHTML = "비밀번호를 입력하세요.";
		return false;
	}
}
function loginCheck(event) {
	const id2Check = document.querySelector("#userId2");
	const userPw2 = document.querySelector("#userPw2");
	document.login.submit();
	alert(`로그인 성공!! \n아이디: ${id2Check.value} \n비밀번호: ${userPw2.value}`);
	if (userId2Check("blur") && userPw2Check("blur")) {
		return true;
	} else {
		alert("로그인 양식을 완성하세요.");
	}
}
function idSearch() {
	let idSearch = prompt(`이름을 입력하세요.`);
	let d = null;
	for (let i = 0; i < userN.length; i++) {
		if (idSearch === userN[i]) {
			b = 1;
			d = userI[i];
		}
	}
	if (idSearch !== null) {
		if (b === 1) {
			alert(`${idSearch}님의 아이디는 ${d} 입니다.`);
		} else {
			alert("회원 정보가 조회되지 않습니다.");
		}
	} else {
		alert("이름을 입력하지 않았습니다.");
	}
}
function pwSearch() {
	let idSearch = prompt(`이름을 입력하세요.`);
	let pwSearch = prompt(`아이디를 입력하세요.`);
	let d = null;
	for (let i = 0; i < userN.length; i++) {
		if (idSearch === userN[i] && pwSearch === userI[i]) {
			b = 1;
			d = userP[i];
		}
	}
	if (idSearch !== null && pwSearch !== null) {
		if (b === 1) {
			alert(`${idSearch}님의 비밀번호는 ${d} 입니다.`);
		} else {
			alert("회원 정보가 조회되지 않습니다.");
		}
	} else {
		alert("회원 정보을 입력하지 않았습니다.");
	}
}
function writeSave() {
	if (document.writeForm.writer.value == "") {
		alert("작성자를 입력하십시요.");
		document.writeForm.writer.focus();
		return false;
	}
	if (document.writeForm.subject.value == "") {
		alert("제목을 입력하십시요.");
		document.writeForm.subject.focus();
		return false;
	}
	if (document.writeForm.content.value == "") {
		alert("내용을 입력하십시요.");
		document.writeForm.content.focus();
		return false;
	}

	if (document.writeForm.pass.value == "") {
		alert(" 비밀번호를 입력하십시요.");
		document.writeForm.pass.focus();
		return false;
	}
}

function noAccess() {
	alert('고사양 회원만 자유게시판 이용이 가능합니다. \n로그인이나 회원가입을 하시기 바랍니다.');
}