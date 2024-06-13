/*$(document).ready(function(){
    $("#update").click(function(){//[수정]버튼 클릭
    	  var book_id = $("#book_id").val();
    	  var book_kind = $("#book_kind").val();

  		  var query = {qna_content:$("#updateCont").val(),
  				       qna_id:$("#qna_id").val()};
  		  
  		  $.ajax({
  		     type: "POST",
  		     url: "/shoppingmall/qnaUpdatePro.do",
  		     data: query,
  		     success: function(data){
  		    	var str1 = '<p id="ck">';
	    		var loc = data.indexOf(str1);
	    		var len = str1.length;
	    		var check = data.substr(loc+len,1);
	    		if(check == "1"){
	    			alert("QnA가 수정되었습니다.");
	    			var query = "/shoppingmall/bookContent.do?book_id="+book_id;
 		    		query += "&book_kind="+book_kind;
 		    		window.location.href(query);
	    	     }else
	    	  	    alert("QnA수정 실패");
  		     }
  		  });
	});
    
    $("#cancle").click(function(){//[취소]버튼 클릭
    	var book_id = $("#book_id").val();
  	    var book_kind = $("#book_kind").val();
    	var query = "/shoppingmall/bookContent.do?book_id="+book_id;
 		query += "&book_kind="+book_kind;
 		window.location.href(query);
	});
     
});
*/

document.addEventListener('DOMContentLoaded', function() {
    var updateButton = document.getElementById('update');
    updateButton.addEventListener('click', function() {
        // [수정] 버튼 클릭
        var book_id = document.getElementById('book_id').value;
        var book_kind = document.getElementById('book_kind').value;

        var query = {
            qna_content: document.getElementById('updateCont').value,
            qna_id: document.getElementById('qna_id').value
        };

        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/shoppingmall/qnaUpdatePro.do', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var data = xhr.responseText;
                var str1 = '<p id="ck">';
                var loc = data.indexOf(str1);
                var len = str1.length;
                var check = data.substr(loc + len, 1);
                if (check == '1') {
                    alert('QnA가 수정되었습니다.');
                    var query = '/shoppingmall/bookContent.do?book_id=' + book_id;
                    query += '&book_kind=' + book_kind;
                    window.location.href = query;
                } else {
                    alert('QnA 수정 실패');
                }
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

    var cancleButton = document.getElementById('cancle');
    cancleButton.addEventListener('click', function() {
        // [취소] 버튼 클릭
        var book_id = document.getElementById('book_id').value;
        var book_kind = document.getElementById('book_kind').value;
        var query = '/shoppingmall/bookContent.do?book_id=' + book_id;
        query += '&book_kind=' + book_kind;
        window.location.href = query;
    });
});
