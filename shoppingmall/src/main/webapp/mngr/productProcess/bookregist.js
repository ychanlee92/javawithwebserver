document.addEventListener('DOMContentLoaded', function() {
	// [책등록] 버튼 클릭
	// 이미지를 포함한 상품등록
	var form = document.getElementById('upForm1');
	form.addEventListener('submit', function(event) {
		event.preventDefault();
		var formData = new FormData(form);

		var xhr = new XMLHttpRequest();
		xhr.open('POST', form.action, true);

		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				window.location.href = "/shoppingmall/mg/bookList.do?book_kind=all";
			} else if (xhr.readyState === 4) {
				console.error('Error:', xhr.statusText);
			}
		};

		xhr.onerror = function() {
			console.error('Request failed');
		};

		xhr.send(formData);
	});
	// [관리자 메인으로] 버튼 클릭
	var bookMainButton = document.getElementById('bookMain');
	bookMainButton.addEventListener('click', function() {
		window.location.href = "/shoppingmall/mg/managerMain.do";
	});

	// [목록으로] 버튼 클릭
	var bookListButton = document.getElementById('bookList');
	bookListButton.addEventListener('click', function() {
		window.location.href = "/shoppingmall/mg/bookList.do?book_kind=all";
	});
});