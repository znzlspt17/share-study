<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var a = document.img;
	console.dir(a);
</script>
</head>
<body>
	<%
		String source = null;
	%>
	<%
		request.setCharacterEncoding("UTF-8");

		String str = request.getParameter("movieName");
		switch (str) {
		case "파워톰캣":
			source = "../images/tomcat-power.gif";
			break;

		case "일반톰캣":
			source = "../images/tomcat.png";
			break;
		}

		out.println("<img src=" + '"' + source + '"' + "alt='' name='img' />");
	%>
</body>
</html>