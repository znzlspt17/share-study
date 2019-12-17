<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="">
		<input type="text" name="hap1" value="<%=a%>" /> + 
		<input type="text" name="hap2" value="<%=b%>"/>
		<input type="submit" value="=" /> 
		<input type="text" name="result" value="<%=result%>"/>
	</form>
	
	<%!
	int a;
	int b;
	int result;
	%>
	
	<%
		PrintWriter pw = response.getWriter();
		String[] str = { request.getParameter("hap1"), request.getParameter("hap2") };

		if (str[0] != null && str[1] != null) {
			a = Integer.parseInt(str[0]);
			b = Integer.parseInt(str[1]);
			result = a + b;
		}
	%>


</body>
</html>