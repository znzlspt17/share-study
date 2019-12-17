<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#dan").on("change", movePage);
	});
	
	
	function movePage() {
		console.log("movePage( 빵상또롱또로롱 깨랑까랑)");
		document.frm.action="printGuGuDan.jsp";
		document.frm.method="get";
		document.frm.submit();
	}
	
</script>


</head>
<body>
	<form action="" name="frm">
		<select name="d1" id="dan">
			<option value="--">선택</option>
			<option value="2">2단</option>
			<option value="3">3단</option>
			<option value="4">4단</option>
			<option value="5">5단</option>
			<option value="6">6단</option>
			<option value="7">7단</option>
			<option value="8">8단</option>
			<option value="9">9단</option>
		</select>

	</form>
</body>
</html>