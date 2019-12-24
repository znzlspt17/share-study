<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	var xhr = null;

	function getXMLHttpRequest() {
		if (window.ActiveObject) {
			try {
				return new ActiveObject("MsMXL2.XMLHttp");
			} catch (e) {
				try {
					return new ActiveObject("Microsoft.XMLHttp");
				} catch (e) {
					null;
				}
			}
		} else if (window.XMLHttpRequest) {
			return new XMLHttpRequest();
		} else {
			return null;
		}
	}

	function load(url) {
		console.log(url);
		xhr = getXMLHttpRequest();
		console.log(xhr);
		xhr.onreadystatechange = viewMessage;
		xhr.open("GET", url, true);
		xhr.send(null);
	}

	function viewMessage() {
		console.log(xhr.readyState);
		if (xhr.readyState == 4) {
			document.getElementById("div1").innerText = xhr.responseText;
		}
	}
</script>
</head>
<body>
	<input type="button" value="" id="simple1" onclick="load('simple1.txt')" /> 심플1txt
	<br />
	<input type="button" value="" id="simple2" onclick="load('simple1.jsp')" /> 심플1jsp
	<br />
	<input type="button" value="" id="simple3" onclick="load('simple2.txt')" /> 심플2txt
	<br />
	<input type="button" value="" id="simple4" onclick="load('simple2.jsp')" /> 심플2jsp
	<br />

	<div id="div1"></div>
</body>
</html>