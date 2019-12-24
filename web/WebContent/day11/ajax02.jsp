<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="../js/httpRequest.js">
	
</script>
<script type="text/javascript" charset="UTF-8">
	function helloToServer() {
		var id = document.getElementById("id").value;
		/*  var pw = document.getElementById("pw").value; */
		var txt = document.getElementById("id").value;
		var params = "txt=" + txt;
		sendRequest('hello.jsp', params, err, "POST");
	}

	function err() {
		if (xhr.readyState == 4)
			if (xhr.status == 200) {
				console.dir(xhr);
				console.log(xhr.responseText);
				document.getElementById("div1").innerHTML = xhr.responseText;
			}
	}
</script>
</head>
<body>
	ID :
	<input type="text" name="" id="id" /> PW :
	<!-- <input type="text" name="" id="pw" /> -->
	<input type="button" value="입력" onclick="helloToServer()" />
	<div id="div1"></div>
</body>
</html>