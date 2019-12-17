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
		//_jspService() 에 미리 선언되어 있는 지역변수를 JSP 내장객체라고 한다
		out.println("<h1> JSP 내장객체 </h1>");
		String msg = request.getParameter("msg");
		out.println("<h1> 전달받은 값 : " + msg + "</h1>");
	%>
</body>
</html>