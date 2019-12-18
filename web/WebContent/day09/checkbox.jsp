<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		var v = document.getElementById("tglCk");
		v.onclick = function() {
			var c = document.getElementsByName("ck");
			for (var i = 0; i < c.length; i++) {
				var box = c[i];
				box.checked = v.checked;
			}
		}
	}
</script>
</head>
<body>
	<input type="checkbox" name="ck" id="" class="box" />1
	<input type="checkbox" name="ck" id="" class="box" />2
	<input type="checkbox" name="ck" id="" class="box" />3
	<input type="checkbox" name="ck" id="" class="box" />4
	<input type="checkbox" name="ck" id="" class="box" />5
	<input type="checkbox" name="ck" id="" class="box" />6
	<br />
	<input type="checkbox" name="ck" id="tglCk" class="box" onclick="check" />선택
</body>
</html>