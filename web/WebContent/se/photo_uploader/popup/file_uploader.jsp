<%@page import="com.sun.org.apache.bcel.internal.generic.ALOAD"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String return1 = "";
	String return2 = "";
	String return3 = "";
	String name = "";
	if (ServletFileUpload.isMultipartContent(request)) {
		ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());

		uploadHandler.setHeaderEncoding("UTF-8");
		List<FileItem> items = uploadHandler.parseRequest(request);

		for (FileItem item : items) {
			if (item.getFieldName().equals("callback")) {
				return1 = item.getString("UTF-8");
			} else if (item.getFieldName().equals("callback_func")) {
				return2 = "?callback_func=" + item.getString("UTF-8");
			} else if (item.getFieldName().equals("Fliedata")) {
				if (item.getSize() > 0) {
					//파일의 크기가 0 초과라면, 즉 빈파일이 아니라면 ? 파일명 구해오기
					name = item.getName().substring(item.getName().lastIndexOf(File.separator) + 1);
					String fileExt = name.substring(name.lastIndexOf("." + 1));

					// 파일 확장자를 소문자로 만들기

					fileExt = fileExt.toLowerCase();

					String[] allowFile = { "jpg", "png", "bmp", "gif" };

					int cnt = 0;
					for (int i = 0; i < allowFile.length; i++) {
						if (fileExt.equals(allowFile[i])) {
							cnt++;
						}
					}
					if (cnt == 0) {
						return3 = "&errstr=" + name;
					} else {
						String path = request.getRealPath("/upload");

						File f = new File(path);

						if (!f.exists()) {
							f.mkdir();
						}

					}
					String realFileName = "";
				}
			}
		}
	}
%>