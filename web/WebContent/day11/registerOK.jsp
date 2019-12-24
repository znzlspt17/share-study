<%-- <%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
//버튼누르면 메인가게 할 수도 있자너 근데 귀찮아서 안함 ㅅㄱ
	window.addEventListener("DOMContentLoaded", function(){
		document.querySelector("input[value='돌아가기']").addEventListener("click", function(){
			console.log("야아잉야야잉야아");
			window.location.href = './login.jsp';
		});
	});
</script>
<body>
<h1>가입을 축하합니다. 돌아가려면 돌아가기 버튼을 눌러주세요</h1>
<input type="button" value="돌아가기" />
<%
	String id3 = request.getParameter("id");
	String pw3 = request.getParameter("password");
	String name3 = request.getParameter("name");
	System.out.println(id3+"+"+ pw3+"|"+ name3);
	
	if(id3 != null && pw3 != null && name3 != null){
		MemberDAO dao = new MemberDAO();

		boolean dupIdFlag = dao.registerNewUser(id3, name3, pw3);
		dao.elemClose();
		
		if(!dupIdFlag){
			//response.sendRedirect("login.jsp");	
			System.out.println("ㅇㅋ by registerOk.jsp");
		}else{
			//중복임
			System.out.println("중복임 by registerOk.jsp");
		}
		dao.elemClose();
	}else{		//필수입력에서 몬가 빠짐
	}
%>

</body>
</html> --%>