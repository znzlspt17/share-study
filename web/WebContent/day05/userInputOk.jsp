<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String txt = request.getParameter("txt");
		out.println("<h2>" + txt + "</h2>");

		Cookie c = new Cookie("txt", txt);
		c.setMaxAge(60 * 5);

		response.addCookie(c);
	%>
</body>
</html>