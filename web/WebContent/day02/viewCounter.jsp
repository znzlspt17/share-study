<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!int counter = 0;%>
	<%
		counter++;
	%>

	<h1>
		현재페이지 방문횟수 :
		<%=counter%></h1>
</body>
</html>