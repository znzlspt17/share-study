<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!int a;
	String str;%>
	<!-- action값을 지정하지 않으면 자기 자신에게 리턴 -->
	<form action="" method="get">
		<input type="text" name="dan" /> <input type="submit" value="출력" />
	</form>
	<div>
		<%
			str = request.getParameter("dan");
			if (str != null) {
				a = Integer.parseInt(str);
				for (int i = 1; i < 10; i++) {
		%>
		<h1>
			<%=a%>
			*
			<%=i%>
			=
			<%=a * i%>
		</h1>
		<%
				}
			}
		%>






	</div>
</body>
</html>