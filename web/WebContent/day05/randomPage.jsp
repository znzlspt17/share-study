<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
img {
	width: 300px;
	height: 300px;
}
</style>
<script type="text/javascript">
	window.onload = function() {
		var m = document.getElementById("movie");
		
	<%Random rnd = new Random();
			int value = rnd.nextInt(10);
			if (value % 2 == 0) {%>
		m.src = "../images/tomcat.png";
	<%} else {%>
		 m.src="../images/tomcat-power.gif";
	<%}%>
</script>
</head>
<body>
	<img src="" id="movie" alt="" />
</body>
</html>