document.addEventListener('DOMContentLoaded', function() {
    var conShoppingButton = document.getElementById('conShopping');
    // [쇼핑계속] 버튼 클릭
    conShoppingButton.addEventListener('click', function() {
        window.location.href = "/shoppingmall/list.do?book_kind=all";
    });

    // [메인으로] 버튼 클릭
    var shopMainButton = document.getElementById('shopMain');
    shopMainButton.addEventListener('click', function() {
        window.location.href = "/shoppingmall/index.do";
    });
});
