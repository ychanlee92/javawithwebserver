document.addEventListener('DOMContentLoaded', function() {
	
	var insertCartButton = document.getElementById('insertCart');
	insertCartButton.addEventListener('click', function() {
		alert("장바구니에 담았습니다.2"); 
		var buyer = document.getElementById('buyer').value;
		var book_kind = document.getElementById('book_kind').value;
		var query = {
			book_id: document.getElementById('book_id').value,
			buy_count: document.getElementById('buy_count').value,
			book_image: document.getElementById('book_image').value,
			book_title: document.getElementById('book_title').value,
			buy_price: document.getElementById('buy_price').value,
			buyer: buyer
		};

		var xhr = new XMLHttpRequest();
		xhr.open('POST', '/shoppingmall/insertCart.do', true);
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				alert('장바구니에 담겼습니다.');
			} else if (xhr.readyState === 4) {
				console.error('Error:', xhr.statusText);
			}
		};

		xhr.onerror = function() {
			console.error('Request failed');
		};
		var queryString = Object.keys(query)
			.map(function(key) {
				return encodeURIComponent(key) + '=' + encodeURIComponent(query[key]);
			})
			.join('&');

		xhr.send(queryString);
	});


	// [상품QnA쓰기] 버튼 클릭
	var writeQnaButton = document.getElementById('writeQna');
	writeQnaButton.addEventListener('click', function() {
		var book_id = document.getElementById('book_id').value;
		var book_kind = document.getElementById('book_kind').value;
		var query = '/shoppingmall/qnaForm.do?book_id=' + book_id + '&book_kind=' + book_kind;
		window.location.href = query;
	});
});

//[목록으로]버튼 클릭
function list() {
	window.location.href = '/shoppingmall/list.do?book_kind=all';
}

// [메인으로] 버튼 클릭
function shopMain() {
	window.location.href = '/shoppingmall/index.do';
}

function edit(editBtn) { // [수정] 버튼 클릭
	var rStr = editBtn.name;
	var arr = rStr.split(',');
	var query = '/shoppingmall/qnaUpdateForm.do?qna_id=' + arr[0] + '&book_kind=' + arr[1];
	window.location.href = query;
}

// [삭제] 버튼 클릭
function del(delBtn) {
	alert("삭제진행2");
	var rStr = delBtn.name;
	var arr = rStr.split(',');
	var query = { qna_id: arr[0] };

	var xhr = new XMLHttpRequest();
	xhr.open('POST', '/shoppingmall/qnaDeletePro.do', true);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			var data = xhr.responseText;
			var str1 = '<p id="ck">';
			var loc = data.indexOf(str1);
			var len = str1.length;
			var check = data.substr(loc + len, 1);
			if (check == '1') {
				alert('QnA가 삭제 되었습니다.');
				var query = '/shoppingmall/bookContent.do?book_id=' + arr[1] + '&book_kind=' + arr[2];
				window.location.href = query;
			} else {
				alert('QnA 삭제 실패');
			}
		} else if (xhr.readyState === 4) {
			console.error('Error:', xhr.statusText);
		}
	};

	xhr.onerror = function() {
		console.error('Request failed');
	};

	xhr.send("qna_id" + '=' + encodeURIComponent(query.qna_id));
}
