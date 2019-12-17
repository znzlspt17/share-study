<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String saveDir = request.getRealPath("/upload");
		out.println(saveDir);
		int maxFilesize = 1024 * 1024 * 10; // 10MB;
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxFilesize, "UTF-8",
				new DefaultFileRenamePolicy());

		String title = mr.getParameter("title");
		String writer = mr.getParameter("writer");
		String contents = mr.getParameter("contents");
		String f = mr.getOriginalFileName("filename");
	%>
	<br /> 제목 :
	<%=title%>
	<br /> 작성자 :
	<%=writer%>
	<br /> 내용 :
	<%=contents%>
	<br /> 파일명 :
	<%=f%>
	<br />

	<a href="dirView.jsp">파일 저장 디렉토리</a>
</body>
</html>