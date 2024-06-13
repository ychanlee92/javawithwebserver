document.addEventListener('DOMContentLoaded', function() {
	// [ID중복확인] 버튼 클릭
	var checkIdButton = document.getElementById('checkId');
	checkIdButton.addEventListener('click', function() {
		var idValue = document.getElementById('id').value;
		if (idValue) {
			var query = { id: idValue };
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "/shoppingmall/confirmId.do", true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.onreadystatechange = function() {
			if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
					var data = xhr.responseText;
          var str1 = '<p id="ck">';
          var loc = data.indexOf(str1);
          var len = str1.length;
          var check = data.substr(loc + len, 1);
          if (check === '1') {
                alert('사용할 수 없는 아이디');
                document.getElementById('id').value = '';
          } else {
                 alert('사용할 수 있는 아이디');
          }
				}else{
            console.error('Error:', xhr.statusText);
				}
			};
			xhr.send("id=" + encodeURIComponent(query.id));
			
		} else { // 아이디를 입력하지 않고 [ID중복확인] 버튼을 클릭한 경우
			alert('사용할 아이디를 입력');
			document.getElementById('id').focus();
		}
	});
	
  
	// [취소] 버튼 클릭
	var cancelButton = document.getElementById('cancle');
	cancelButton.addEventListener('click', function() {
		window.location.href = '/shoppingmall/index.do';
	});
});

function process() {
	// [가입하기] 버튼 클릭
	alert('가입하기3');
	var query = {
		id: document.getElementById('id').value,
		passwd: document.getElementById('passwd').value,
		name: document.getElementById('name').value,
		address: document.getElementById('address').value,
		tel: document.getElementById('tel').value
	};

	var xhr = new XMLHttpRequest();
	xhr.open("POST", "/shoppingmall/registerPro.do", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.onreadystatechange = function() {
		if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
			window.location.href = "/shoppingmall/index.do";
		}else{
			console.error('Error:', xhr.statusText);
		}
	};
	xhr.send("id=" + encodeURIComponent(query.id) +
	 "&passwd=" + encodeURIComponent(query.passwd) +
	 "&name=" + encodeURIComponent(query.name) +
	 "&address=" + encodeURIComponent(query.address) +
	 "&tel=" + encodeURIComponent(query.tel)
	 );
}
