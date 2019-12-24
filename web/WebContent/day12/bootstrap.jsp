<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous"
>

<title>Hello, world!</title>
</head>
<body>

	<div class="container">
		<h3>표 만들기</h3>
		<table class="table table-bordered">
			<caption>CATALOG</caption>
			<tr>
				<th>NO</th>
				<th>제품명</th>
				<th>가격</th>
			</tr>
			<tr>
				<td>1</td>
				<td>아이뻐</td>
				<td>사천만</td>
			</tr>
			<tr>
				<td>2</td>
				<td>갤락티카</td>
				<td>오천만</td>
			</tr>
			<tr>
				<td>3</td>
				<td>하으아아앙</td>
				<td>이천만</td>
			</tr>
			<tr>
				<td>4</td>
				<td>엘...하안숨</td>
				<td>천원</td>
			</tr>
		</table>

		<button type="button">버튼</button>
		<button type="button" class="btn btn-primary">primary</button>
		<button type="button" class="btn btn-success">success</button>
		<button type="button" class="btn btn-secondary">secondary</button>
		<button type="button" class="btn btn-danger">danger</button>
		<button type="button" class="btn btn-warning">warning</button>
		<button type="button" class="btn btn-info">info</button>
		<button type="button" class="btn btn-dark">dark</button>
		<button type="button" class="btn btn-light">light</button>
		<button type="button" class="btn btn-link">link</button>


		<button type="button" class="btn btn-primary">
			Notifications <span class="badge badge-light">4</span>
		</button>

	</div>


	<h1>Hello, world!</h1>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->

	<div class="container">
		<!--  
		기본 격자 시스템 
 		행.. ==> row, 열 span
 		-->


		<div class="row">
			<div class="col">1</div>
			<div class="col">2</div>
			<div class="col">3</div>
		</div>
		<div class="row">
			<div class="col">4</div>
			<div class="col">5</div>
			<div class="col">6</div>
			<div class="col">7</div>
		</div>
		<div class="row">
			<div class="col">8</div>
			<div class="col">9</div>
			<div class="col">10</div>
			<div class="col">11</div>
			<div class="col">12</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"
	></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"
	></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"
	></script>
</body>
</html>