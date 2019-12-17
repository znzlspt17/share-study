<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String p = request.getParameter("pno");
	if (p != null) {
		// 숫자로 형변환
		int pno = Integer.parseInt(p);
		// dao 객체
		ProductDAO dao = new ProductDAO();
		// dao method 1건 데이터 가져오기
		ProductVO vo = dao.selectOne(pno);
		dao.close();
		// html 구성
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#container {
	width: 1000px;
	margin: auto;
}

#pic {
	width: 500px;
	float: left;
}

table {
	border-top: 3px solid gray;
	border-bottom: 3px solid gray;
}

#info {
	width: 500px;
	float: left;
}

#desc {
	clear: both;
}

#pic>img {
	width: 100%;
	height: 50%;
}

#test {
	display: none;
}
</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript">
	$(function() {
		$("#cart").on("click", function() {
			document.frm.action = "cart.jsp";
			document.frm.method = "get";
			document.frm.submit();
		});
	});
</script>
</head>
<body>


	<form name="frm">
		<input type="hidden" name="no" id="no" value="<%=vo.getPno()%>" />
	</form>
	<div id="container">
		<div id="pic">
			<img src="<%=vo.getBigfile()%>" alt="<%=vo.getPname()%>" />
		</div>

		<div id="info">
			<table>
				<tr>
					<td colspan="2"><%=vo.getPname()%></td>
				</tr>
				<tr>
					<td>판매가격</td>
					<td><%=vo.getPrice()%>원
					</td>
				</tr>
				<tr>
					<td>할인가격</td>
					<td><%=Math.round((int) (vo.getPrice() * (1 - (vo.getDcratio() * 0.01))) * 0.01) * 100%>원
					</td>
				</tr>
				<tr>
					<td>
						<img src="../images/btn_buy.jpg" alt=""> <img src="../images/btn_cart.jpg" alt=""
							id="cart"
						/> <a href="viewCart.jsp"> <img src="../images/btn_wish.jpg" alt="" />
						</a>
					</td>
				</tr>
			</table>

			<div id="desc">
				<p>
					<%=vo.getProdesc()%></p>
			</div>
		</div>

	</div>

	<%
		} else {
	%>
	<script type="text/javascript">
		function back() {
			history.back();
			/* history.forward();  앞으로 가는것.*/
			/* 	history.go(-1);   비슷함.*/
		}
	</script>
	<div>
		<a href="javascript:back()">뒤로가기</a>
	</div>
	<%
		}
	%>
</body>
</html>