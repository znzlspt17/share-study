<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	window.onload = function() {
		var btn = document.getElementById("btn");
		btn.onclick = openKaKaoPostcode
	}

	function openKaKaoPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById("post1").value = data.postcode1;
				document.getElementById("post2").value = data.postcode2;
				document.getElementById("addr").value = data.address;
			}
		}).open();
	}
</script>
</head>
<body>
	<h1>우편번호</h1>
	<input type="text" name="" id="post1">
	<input type="text" name="" id="post2">
	<input type="button" name="" value="우편번호찾기" id="btn">
	<input type="text" name="" id="addr" />
</body>
</html>