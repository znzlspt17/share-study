<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	window.onload = function() {
		document.cookie = "name=coffee";
		document.cookie = "product=moniter;expires=Sat,12 Dec 2019 10:00:00 UTC";

		var x = document.cookie;
		console.log(x);

		var name = getCookie("product");

		function getCookie(cname) {
			var name = cname + "=";
			var decodeCookie = decodeURIComponent(document.cookie);
			var ca = decodeCookie.split(";");
			for (var i = 0; i < ca.length; i++) {
				var c = ca[i];
				while (c.charAt(0) == ' ') {
					c = c.substring(1);
				}
				if (c.indexOf(name) == 0) {
					return c.substring(name.length, c.length);
				}

			}

		}

	}
</script>
</head>
<body>

</body>
</html>