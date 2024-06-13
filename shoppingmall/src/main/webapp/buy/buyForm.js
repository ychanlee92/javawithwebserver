document.addEventListener('DOMContentLoaded', function() {
    var cancleButton = document.getElementById('cancle');

    // [취소] 버튼 클릭
    cancleButton.addEventListener('click', function(event) {
			  alert('cancle');
			  event.preventDefault();
        window.location.href = "/shoppingmall/index.do";
    });
});


