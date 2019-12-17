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
			console.log("ddd");

			var frm = document.frm;
			frm.action = "loginOk.jsp";
			frm.method = "get";
			frm.submit();
		}
		btn2.onclick = function() {
			console.log("lll");
		}
	}
</script>
</head>
<body>
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
</body>
</html>