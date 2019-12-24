<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//200 : 
		//404 : 
		//405 : method 방식의 doget dopost가 존재하지 않을때
		//500 : server side logic error

		int status = response.getStatus();
		out.println("상태 : " + status);
	%>

	<h2>다른 페이지로 이동</h2>


	<ol>
		<li>forward</li>
		<%
			//딱 봐도 포워드지 포워드 메소드 호출했으니까
			/* RequestDispatcher rd = request.getRequestDispatcher("menu.jsp");
			rd.forward(request, response); */
		%>

		<li>
			<%
				response.sendRedirect("menu.jsp");
			%>

		</li>
	</ol>
</body>
</html>