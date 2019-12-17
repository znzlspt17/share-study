<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!String str;
	int a;%>
	<%
		str = request.getParameter("d1");
		if (str != null) {
			a = Integer.parseInt(str);
			for (int i = 1; i < 10; i++) {
				out.println("<h1>" + a + " * " + i + " = " + (a * i) + "</h1>");
			}
		}
	%>

</body>
</html>