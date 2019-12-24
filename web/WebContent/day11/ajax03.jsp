<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
img {
	width: 150px;
	height: 150px;
}
</style>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript">
	function prt() {
		var txt = document.getElementById("txt").value;
		var params = "txt=" + encodeURIComponent(txt);

		console.log(params);
		sendRequest("search.jsp", params, callback, "POST");
	}

	function callback() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			console.log(xhr.responseText);
			var img = document.getElementById("img");
			img.src = xhr.responseText;
		}
	}
</script>
</head>
<body>
	<input type="text" name="txt" id="txt" />
	<input type="button" value="출력" onclick="prt()" />
	<div id="myconsole">
		<img src="../images/bluedog.jpg" id="img" alt="" />
	</div>
</body>
</html>