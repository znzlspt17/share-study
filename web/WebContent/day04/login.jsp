<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	window.onload = function() {
		var btn1 = document.getElementById("btn1");
		var btn2 = document.getElementById("btn2");

		btn1.onclick = function() {
			var frm = document.frm;
			frm.action = "loginOk.jsp";
			frm.method = "get";
			frm.submit();
		}
		btn2.onclick = function() {
			var frm = document.frm;
			frm.action = "register.jsp";
			frm.method = "get";
			frm.submit();
		}
	}
</script>
</head>
<body>
	<%
		Object obj = session.getAttribute("vo");
		if (obj != null) {
			MemberVO vo = (MemberVO) obj;
			out.println("<h1> <a href='logOut.jsp'>" + vo.getName() + "</a> 왔냐 </h1>");
		} else {
	%>
	<form action="loginOk.jsp" name="frm">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" id="id" /></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="text" name="pw" id="pw" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" id="btn1" value="login"
					onclick="" /> <input type="button" id="btn2" value="join us" /></td>
			</tr>
		</table>
	</form>
	<%
		}
	%>
</body>
</html>