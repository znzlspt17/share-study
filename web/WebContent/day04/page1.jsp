<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>현재 페이지는 page 1 입니다</h1>
	<%
		pageContext.setAttribute("id1", "aaa");
		request.setAttribute("id2", "bbb");
		session.setAttribute("id3", "ccc");
		application.setAttribute("id4", "ddd");

		Object obj1 = pageContext.getAttribute("id1");
		String id1 = (String) obj1;
		Object obj2 = request.getAttribute("id2");
		String id2 = (String) obj2;
		Object obj3 = session.getAttribute("id3");
		String id3 = (String) obj3;
		Object obj4 = application.getAttribute("id4");
		String id4 = (String) obj4;

		out.println("<h1>id1 : " + id1 + "</h1>");
		out.println("<h1>id2 : " + id2 + "</h1>");
		out.println("<h1>id3 : " + id3 + "</h1>");
		out.println("<h1>id4 : " + id4 + "</h1>");

		/* RequestDispatcher rd = request.getRequestDispatcher("page2.jsp");
		out.println("요청객체 : " + request);
		rd.forward(request, response); */

		response.sendRedirect("page2.jsp");
	%>



</body>
</html>