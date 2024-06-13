/*$(document).ready(function(){
	$("#bookMain").click(function(){//[관리자 메인으로]버튼 클릭
		window.location.href("/shoppingmall/mg/managerMain.do");
	});
});*/
document.addEventListener('DOMContentLoaded', function() {
    // [관리자 메인으로] 버튼 클릭
    var bookMainButton = document.getElementById('bookMain');
    bookMainButton.addEventListener('click', function() {
        window.location.href = "/shoppingmall/mg/managerMain.do";
    });
});