<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
					Date d = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String time = sdf.format(d);

					// 저장할파일명  = 파일명 + 시간 + . +  확장자 

					realFileName = name + time + "." + fileExt;

					// 서버에 파일 쓰기 

					InputStream is = request.getInputStream();
					OutputStream os = new FileOutputStream(realFileName);

					int numRead;

					// 요청객체의 헤더에서 파일의 사이즈를 알아온다. 
					// 사이즈를 숫자형으로 바꾼다.
					// 크기에 맞는 byte[] 배열을 선언한다.
					byte[] b = new byte[(int) item.getSize()];

					// 1byte 씩 읽어서 파일에 저장한다.
					while ((numRead = is.read(b, 0, b.length)) != -1) {
						os.write(b, 0, numRead);
					}
					os.flush();
					// 자원 반납 
					if (is != null)
						is.close();
					if (os != null)
						os.close();

					// 저장한 파일의 경로 출력
					out.println(request.getRealPath("/upload") + realFileName);

				} else {
					return3 += "&errstr=error";
				}
			}
		}
	}
%>