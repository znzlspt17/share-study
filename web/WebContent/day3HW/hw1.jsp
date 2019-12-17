<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!String str;%>
	<%
		int val = (int) (Math.random() * 9);

		switch (val) {
		case 0:
			str = "일어나라 노예 되기 싫은 자들아";
			break;
		case 1:
			str = "정답이다 연금술사";
			break;
		case 2:
			str = "3층 화장실 3003*";
			break;
		case 3:
			str = "//로그인에 성공했다면 화면에 OK";
			break;
		case 4:
			str = "3층 화장실 3003*";
			break;
		case 5:
			str = "- boolean nextBoolean() : 균일한 분포의 boolean 형 난수 발생";
			break;
		case 6:
			str = "- int nextInt() : 균일한 분포의 int 형 난수 발생(int 전 범위에서 난수가 발생합니다.)";
			break;
		case 7:
			str = "저자병자";
			break;
		case 8:
			str = "브 ㅋㅋ 브브브 브브 브브브브브 즐거운 브~";
			break;
		case 9:
			str = "과제가 6개나아아아";
			break;
		}
	%>

	<h1>
		<%=str%></h1>
	<form action="">
		<input type="submit" value="바꿔줘" />
	</form>

</body>
</html>