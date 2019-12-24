<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>


<style>
table {
	padding: 30px;
	border: 1px solid gray;
	width: 500px;
}

#bordTd {
	height: 20px;
}

#boldTd {
	font-weight: bold;
}

input {
	border-radius: 4px;
	width: 500px;
	height: 35px;
}

#submit {
	background-color: orange
}

* {
	width: 500px;
}
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	window.onload = function() {
		var btn = document.getElementById("btn");
		btn.onclick = openKaKaoPostcode
	}

	function openKaKaoPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				console.dir(data);
				document.getElementById("post").value = data.zonecode;
				document.getElementById("addr").value = data.address;
			}
		}).open();
	}
</script>
</head>

<body>
	<%
		if (request.getAttribute("status") != null)
			if ((request.getAttribute("status").toString()).equals("fail")) {
				out.println("<h1> 가입에 실패하였읍니다 </h1>");
			}
	%>
	<img src="https://www.amazon.com/ref=ap_frn_logo">
	<form action="registerOk.jsp" method="POST">
		<table>
			<tr>
				<td>
					<h1>Create account</h1>
				</td>
			</tr>
			<tr>
				<td id="boldTd">your name</td>
			</tr>
			<tr>
				<td id="bordTd">
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<td id="boldTd">Email</td>
			</tr>
			<tr>
				<td id="bordTd">
					<input type="email" name="email">
				</td>
			</tr>
			<tr>
				<td id="boldTd">Password</td>
			</tr>
			<tr>
				<td id="bordTd">
					<input type="password" placeholder="At least 6 characters" name="pwd">
				</td>
			</tr>
			<tr>
				<td height="30" align="left">passwords must be at least 6 characters</td>
			</tr>
			<tr>
				<td>Re-enter password</td>
			</tr>
			<tr>

				<td id="bordTd">
					<input type="password">
				</td>

			</tr>
			<tr>
				<td align="center">
					<input type="submit" id="submit" value="Create your Amazon account">
				</td>
			</tr>
			<tr>
				<td>By creating an account, you agree to Amazon's</td>
			</tr>
			<tr>
				<td>
					<a
						href="https://www.amazon.com/gp/help/customer/display.html/ref=ap_register_notification_condition_of_use?ie=UTF8&nodeId=508088"
					>Conditions of Ues</a> and <a
						href="https://www.amazon.com/gp/help/customer/display.html/ref=ap_register_notification_privacy_notice?ie=UTF8&nodeId=468496"
					>Privacy Notice.</a>
				</td>
			</tr>
			<tr height="30px">
			</tr>
			<tr>
				<td>
					Already have an Account? <a
						href="https://www.amazon.com/ap/signin?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.com%2F%3Fref_%3Dnav_custrec_signin&prevRID=RMPRS8KPNSY4HDW4Z260&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=usflex&openid.mode=checkid_setup&openid.ns.pape=http%3A%2F%2Fspecs.openid.net%2Fextensions%2Fpape%2F1.0&failedSignInCount=0&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&pageId=usflex&ignoreAuthState=1&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0"
					>Sigh-in ▶</a>
				</td>
			</tr>

			<tr>
				<td>
					<input type="text" name="post" id="post" /> <input type="button" id="btn" value="우편번호찾기" />
					<br /> <input type="text" id="addr" />
				</td>
			</tr>

		</table>
		<table>
			<tr>
				<td>condituons of Use</td>
				<td>Privacy Notice</td>
				<td>help</td>

			</tr>
			<tr>
				<td colspan="3">© 1996-2020, Amazon.com, Inc. or its affiliates</td>
			</tr>
		</table>
	</form>

</body>
</html>