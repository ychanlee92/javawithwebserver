/*$(document).ready(function(){
    $("#regist").click(function(){//[등록]버튼 클릭
    	  var book_kind = $("#book_kind").val();
    	  var book_id = $("#book_id").val();

  		  var query = {qna_content:$("#qnaCont").val(),
  				       qna_writer:$("#qna_writer").val(),
  				       book_title:$("#book_title").val(),
  				       book_id:book_id,
  				       qora:$("#qora").val()};
  		  
  		  $.ajax({
  		     type: "POST",
  		     url: "/shoppingmall/qnaPro.do",
  		     data: query,
  		     success: function(data){
  		    	var str1 = '<p id="ck">';
	    		var loc = data.indexOf(str1);
	    		var len = str1.length;
	    		var check = data.substr(loc+len,1);
	    		if(check == "1"){//
	    			alert("QnA가 등록되었습니다.");
 		    		var query = "/shoppingmall/bookContent.do?book_id="+book_id;
 		    		query += "&book_kind="+book_kind;
 		    		window.location.href(query);
	    	     }else
	    	    	 alert("QnA 등록 실패");
  		     }
  		  });
	});
    
    $("#cancle").click(function(){//[취소]버튼 클릭
    	var book_kind = $("#book_kind").val();
    	var book_id = $("#book_id").val();
    	var query = "/shoppingmall/bookContent.do?book_id="+book_id;
 		query += "&book_kind="+book_kind;
 		window.location.href(query);
	});
       
});*/

document.addEventListener('DOMContentLoaded', function() {
    var registButton = document.getElementById('regist');
    registButton.addEventListener('click', function() {
        // [등록] 버튼 클릭
        var book_kind = document.getElementById('book_kind').value;
        var book_id = document.getElementById('book_id').value;

        var query = {
            qna_content: document.getElementById('qnaCont').value,
            qna_writer: document.getElementById('qna_writer').value,
            book_title: document.getElementById('book_title').value,
            book_id: book_id,
            qora: document.getElementById('qora').value
        };

        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/shoppingmall/qnaPro.do', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var data = xhr.responseText;
                var str1 = '<p id="ck">';
                var loc = data.indexOf(str1);
                var len = str1.length;
                var check = data.substr(loc + len, 1);
                if (check == '1') {
                    alert('QnA가 등록되었습니다.');
                    var query = '/shoppingmall/bookContent.do?book_id=' + book_id;
                    query += '&book_kind=' + book_kind;
                    window.location.href = query;
                } else {
                    alert('QnA 등록 실패');
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
        var book_kind = document.getElementById('book_kind').value;
        var book_id = document.getElementById('book_id').value;
        var query = '/shoppingmall/bookContent.do?book_id=' + book_id;
        query += '&book_kind=' + book_kind;
        window.location.href = query;
    });
});
