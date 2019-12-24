<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script>
	$(function() {
		var img = $("#dog");
		img.on('click', function() {
			$.ajax({
				type : "GET",
				async : true,
				url : "getJSON1.jsp",
				dataType : "html",
				data : {
					"id" : "aaa",
					"pw" : "bbb"
				},
				success : function(response, status, request) {
					console.log("성공시 메세지 출력");
					console.log(response);
					img.attr("src", response);
				},
				error : function(response, status, request) {
					console.log("에러시 출력");
					img.attr("src", "../images/404.jpg").css("width", "800px")
							.css("height", "600px");
				},
				complete : function() {
					console.log("AJAX 통신 끝");
					img.fadeIn(2000);
				},
				beforeSend : function() {
					img.fadeOut(2000);
				}
			});
		});
	})
</script>
</head>
<body>
	<img src="../images/bluedog.jpg" id="dog" />
</body>
</html>