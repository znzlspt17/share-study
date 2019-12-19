<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 파일 정보
		String sFileInfo = "";
		//요청객체로 부터 전송하는 파일의 파일명을 받는다.	

		String filename = request.getHeader("file-name");
		//파일의 확장자는 ? abc.jpg 라면 파일의 확장자(extension) 는 ?
		//out.println(filename.lastIndexOf(".")); 확장자 구분위한 닷 위치 확인

		String fileExt = filename.substring(filename.lastIndexOf(".") + 1);
		fileExt = fileExt.toLowerCase();

		String[] allowFile = { "jpg", "png", "bmp", "gif" };

		int cnt = 0;
		for (String str : allowFile) {
			boolean b = fileExt.equals(str);
			if (b) {
				cnt++;
			}
		}

		if (cnt == 0) {
			out.println("<h1> 이미지 파일이 아닙니다. </h1>" + filename + " </h1>");
		} else {
			String path = request.getRealPath("/upload");
			File f = new File(path);
			if (!f.exists()) {
				f.mkdir();
			}
			//진짜 저장할 파일명
			String realFileName = "";
			// 중복 방지를 위해 시간 넣어줌
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String time = sdf.format(d);

			//저장할 파일명 = 시간 + 파일명 + 확장자

			realFileName = filename + time + "." + fileExt;
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(realFileName);

			int numRead;
			//요청 객체의 헤더에서 파이르이 사이즈를 알아온다
			//사이즈를 숫자형으로 바꾼다
			// 크기에 맞은 byte[] 배열을 선언한다.
			byte[] b = new byte[Integer.parseInt(request.getHeader("file-size"))];

			while ((numRead = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, numRead);
			}
			os.flush();
			if (is != null)
				is.close();
			if (os != null)
				os.close();

			out.println(request.getRealPath("/upload") + realFileName);
		}
	%>
</body>
</html>