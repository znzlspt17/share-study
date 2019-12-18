<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String[] str = request.getParameterValues("ck");
		if (str != null) {
			BoardDAO dao = new BoardDAO();
			int[] bno = new int[str.length];
			for (int i = 0; i < str.length; i++) {
				bno[i] = Integer.parseInt(str[i]);
			}
			dao.delete(bno);
		}
		response.sendRedirect("list.jsp");
	%>
</body>
</html>