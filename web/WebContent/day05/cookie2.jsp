<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript">
	$(function() {
		$.cookie("id", "hong");

		$.cookie("keyword", "coffee", {
			expire : 7
		});

		console.log("keyword : " + $.cookie("keyword"));
		console.log($.cookie());
		console.log("keyword 쿠키 삭제 " + $.removeCookie("keyword"));
		
	})
</script>
</head>
<body>
</body>
</html>