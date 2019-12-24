<%-- <%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<style>
* {
	font-family: D2Coding;
	color: cornflowerblue;
}

body {
	/* background-image:
	 	url(https://media.giphy.com/media/tN638m30ZEz0A/giphy.gif)
	*/
	
}
</style>
<script>
	// 심심해서 써놓는 주석
	// 윈도우에 리스너를 추가해서 구조가 로딩되면 다음 함수가 실행되게 합니다.
	// document에서 input태그중에 type이 submit인 element를 찾아서 얘한테 리스너를 추가해서
	// 클릭되면 다음이 실행되게 합니다.
	// requestdispatcher객체를 만들어서 request의 requestdispatch하여 forward
	// 여기서 RequestDispatcher는 클라이언트로부터 들어온 요청을 JSP/Servlet내에
	// 원하는 자원으로 요청을 보내는 역할? 

	window.addEventListener("DOMContentLoaded", function() {
		document.querySelector("input[type='submit']").addEventListener(
				"click", function() {
					//response.sendRedirect("registerOK.jsp");
					RequestDispatcher
					rd = request.getRequestDispatcher("registerOK.jsp");
					rd.forward(request, response);
				});
	});
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../js/httpRequest.js"></script>
<script>
	//중복확인 버튼을 누르면 콘솔에 메세지 출력
	$(document).ready(function useless() {
		//    		$("input[value='중복확인']").on("click", checkup);
		$("#id").on("keyup", checkup);

	});
	function checkup() {
		console.log($("#id").val());
		var txt = $("#id").val().trim();
		var params = "id=" + txt;
		sendRequest("idCheckup.jsp", params, callback, "GET");
	}
	function callback() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var msg = xhr.responseText.trim();
			if (msg == "true") {
				$("#msg").html("<h3> 아이디가 존재합니다 </h3>");
				console.log("트루");
			} else {
				$("#msg").html("<h3> 사용가능합니다 </h3>");
				console.log("거짓");
			}
		}
	}
</script>
</head>

<body>
	<%
		//session.setAttribute("vo", vo);
	%>
	<form action="registerOK.jsp" method="get">
		<h1>가입신청서</h1>
		<table style="width: 600px;">
			<tr>
				<td>이름(필수):</td>
				<td>
					<input type="text" name="name" id="name">
				</td>
			</tr>
			<tr>
				<td>아이디(필수):</td>
				<td>
					<input type="text" name="id" id="id"> <input type="button" value="중복확인" />
				</td>
				<td>
					<div id="msg"></div>
				</td>
			</tr>
			<tr>
				<td>주민등록번호:</td>
				<td>
					<input type="text" name="sn1"> - <input type="text" name="sn2">
				</td>
			</tr>
			<tr>
				<td>비밀번호(필수):</td>
				<td>
					<input type="text" name="password" id="password">
				</td>
			</tr>
			<tr>
				<td>전화번호:</td>
				<td>
					<input type="text" name="pn1"> - <input type="text" name="pn2">
				</td>
			</tr>
			<tr>
				<td>주소:</td>
				<td>
					<input type="text" name="addr">
				</td>
			</tr>
			<tr>
				<td>이메일:</td>
				<td>
					<input type="text" name="email1"> @ <input type="text" name="email2">
				</td>
			</tr>
			<tr>
				<td>성별:</td>
				<td>
					<input type="radio" name="gen1">남<input type="radio" name="gen2">녀
				</td>
			</tr>
			<tr>
				<td>취미:</td>
				<td>
					<input type="checkbox" name="h1">잠자기<input type="checkbox" name="h2">피리불기<input
						type="checkbox" name="h3"
					>전광석화
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input type="submit" value="가입합니다"> <input type="reset" value="취소합니다">
				</td>
			</tr>
		</table>
		<!--        (-110 * + 1 )*n-->

		<!--       <var>y</var> = <var>200</var> + <var>100</var>-->
		<!--
       <script>
           for(int i = 0 ; i < 10; i ++)
               var height_margin = (-110+1)*i; 
        </script>
-->
		<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
		<br /> <br /> <br /> <br />
		<div
			style="color: deeppink; font-size: 70px; font-weight: 900; height: 100px; position: relative;"
		>안녕~ 안녕~ 안녕~</div>
		<div
			style="color: lightpink; font-size: 70px; font-weight: 910; height: 110px; position: relative; left: 0px; top: -100px;"
		>안녕~ 안녕~ 안녕~</div>

		<div
			style="color: pink; font-size: 70px; font-weight: 910; height: 110px; position: relative; left: 1px; top: -209px;"
		>안녕~ 안녕~ 안녕~</div>
		<div
			style="color: lightpink; font-size: 70px; font-weight: 910; height: 110px; position: relative; left: 2px; top: -319px;"
		>안녕~ 안녕~ 안녕~</div>
		<div
			style="color: lightpink; font-size: 70px; font-weight: 910; height: 110px; position: relative; left: 3px; top: -429px;"
		>안녕~ 안녕~ 안녕~</div>
		<div
			style="color: lightpink; font-size: 70px; font-weight: 910; height: 110px; position: relative; left: 4px; top: -539px;"
		>안녕~ 안녕~ 안녕~</div>
		<div
			style="color: lightpink; font-size: 70px; font-weight: 910; height: 110px; position: relative; left: 5px; top: -649px;"
		>안녕~ 안녕~ 안녕~</div>
		<div
			style="color: lightpink; font-size: 70px; font-weight: 910; height: 110px; position: relative; left: 6px; top: -759px;"
		>안녕~ 안녕~ 안녕~</div>
		<div
			style="color: lightpink; font-size: 70px; font-weight: 910; height: 110px; position: relative; left: 7px; top: -869px;"
		>안녕~ 안녕~ 안녕~</div>
		<div
			style="color: lightpink; font-size: 70px; font-weight: 910; height: 110px; position: relative; left: 8px; top: -979px;"
		>안녕~ 안녕~ 안녕~</div>
		<div
			style="color: lightpink; font-size: 70px; font-weight: 910; height: 110px; position: relative; left: 9px; top: -1089px;"
		>안녕~ 안녕~ 안녕~</div>
		<div
			style="color: lightpink; font-size: 70px; font-weight: 910; height: 110px; position: relative; left: 10px; top: -1199px;"
		>안녕~ 안녕~ 안녕~</div>
		<div
			style="color: lightpink; font-size: 70px; font-weight: 910; height: 110px; position: relative; left: 11px; top: -1309px;"
		>안녕~ 안녕~ 안녕~</div>
		<div
			style="color: lightpink; font-size: 70px; font-weight: 910; height: 110px; position: relative; left: 12px; top: -1419px;"
		>안녕~ 안녕~ 안녕~</div>
		<div
			style="color: lightpink; font-size: 70px; font-weight: 910; height: 110px; position: relative; left: 13px; top: -1529px;"
		>안녕~ 안녕~ 안녕~</div>
		<div
			style="color: white; font-size: 70px; font-weight: 910; height: 110px; position: relative; left: 14px; top: -1639px;"
		>안녕~ 안녕~ 안녕~</div>

		<img
			src="http://file3.instiz.net/data/file3/2018/08/16/9/5/9/9596a55d5ca5e18c34170d36ea96ec81.gif"
			style="position: relative; left: 0px; top: -1659px;"
		> <img
			src="http://file3.instiz.net/data/file3/2018/08/16/9/5/9/9596a55d5ca5e18c34170d36ea96ec81.gif"
			style="position: relative; left: -430px; top: -2059px;"
		>
	</form>
</body>
</html> --%>