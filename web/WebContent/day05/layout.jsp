<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<%
		String fname = "";
		Object obj = request.getParameter("fno");
		if (obj == null) {
			fname = "leftContents.jsp";
		} else {
			fname = (String) obj + ".jsp";
		}
	%>
	<div id="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="nav.jsp" />
		<jsp:include page="<%=fname%>" />
		<jsp:include page="sidebar.jsp" />
		<jsp:include page="footer.jsp" />

	</div>
</body>
</html>