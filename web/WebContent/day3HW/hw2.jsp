<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		setInterval(() => {
			var v = document.getElementById("h1");
			var a = new Date;
			v.innerHTML = a.getHours() + " : " + a.getMinutes() + " : " + a.getSeconds();
		}, 1000);
	}
	
</script>
</head>
<body>

	<%!String str;%>
	<%
		str = request.getRemoteAddr();
	%>
	<h1><%=str%></h1>
	<h1 id="h1"></h1>

</body>
</html>