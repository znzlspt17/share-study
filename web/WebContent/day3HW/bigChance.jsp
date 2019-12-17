
<%@page import="day03.Lotto"%>
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
		Lotto lt = new Lotto();
		int[] m = lt.get();
		for (int i = 0; i < m.length; i++) {
			out.println("<img src='../lotto/ball" + m[i] + ".png'/>");
		}
	%>
</body>
</html>