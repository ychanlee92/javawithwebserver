document.addEventListener('DOMContentLoaded', function() {
	// [수정] 버튼 클릭
	var modifyProcessButton = document.getElementById('modifyProcess');
	modifyProcessButton.addEventListener('click', function() {
		var query = {
			id: document.getElementById('id').value,
			passwd: document.getElementById('passwd').value,
			name: document.getElementById('name').value,
			address: document.getElementById('address').value,
			tel: document.getElementById('tel').value
		};

		var xhr = new XMLHttpRequest();
		xhr.open('POST', '/shoppingmall/modifyPro.do', true);
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				var data = xhr.responseText;
				var str1 = '<p id="ck">';
				var loc = data.indexOf(str1);
				var len = str1.length;
				var check = data.substr(loc + len, 1);
				if (check == '1') {
					alert('회원정보가 수정되었습니다.');
					window.location.href = '/shoppingmall/modify.do';
				} else {
					alert('비밀번호 틀림.');
					document.getElementById('passwd').value = '';
					document.getElementById('passwd').focus();
				}
			} else if (xhr.readyState === 4) {
				console.error('Error:', xhr.statusText);
			}
		};

		xhr.onerror = function() {
			console.error('Request failed');
		};
   xhr.send("id="+encodeURIComponent(query.id)+
		 "&passwd="+encodeURIComponent(query.passwd)+
		 "&name="+encodeURIComponent(query.name)+
		 "&address="+encodeURIComponent(query.address)+
		 "&tel="+encodeURIComponent(query.tel)
		 );

		xhr.send(JSON.stringify(query));
	});

	// [취소] 버튼 클릭
	var cancelButton = document.getElementById('cancle');
	cancelButton.addEventListener('click', function() {
		window.location.href = '/shoppingmall/modify.do';
	});
});