<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
img {
	width: 150px;
	height: 150px;
}
</style>
</head>
<%
	String path = request.getRealPath("/upload");

	File f = new File(path);

	if (f.isDirectory()) {
		String[] flist = f.list();
		for (String x : flist) {
			out.println("<div><img src='../upload/" + x + "'/></div>");
		}
	}
%>
</html>