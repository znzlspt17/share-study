<%@page import="java.util.List"%>
<%@page import="vo.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
* {
	margin: 0;
	padding: 0;
}

#container {
	width: 1000px;
	margin: auto;
}

img {
	width: 150px;
	height: 150px;
}

p {
	text-align: center;
}

.wrap {
	min-height: 350px;
	width: 150px;
	float: left;
	border: 1px solid red;
	padding: 20px;
	margin: 2px;
}

.del {
	text-decoration: line-through;
}
</style>
</head>
<body>
	<div id="container">
		<%
			ProductDAO dao = new ProductDAO();
			ArrayList<ProductVO> voList = dao.selectAll();
			dao.close();
			for (ProductVO vo : voList) {
		%>
		<div class="wrap">
			<%=vo.getPno()%>
			<a href="productDetail.jsp?pno=<%=vo.getPno()%>"> <img src="<%=vo.getImgfile()%>"
				alt="<%=vo.getPname()%>"
			/></a>
			<p>
				<%
					int length = vo.getPname().length();
						if (length < 10) {
				%>
				<%=vo.getPname()%>
				<%
					} else {
				%>
				<%=vo.getPname().substring(0, 7) + "..."%>
				<%
					}
				%>
			
			<p class="del">
				<%=vo.getPrice()%>
			</p>
			<p class="red">마감임박</p>
			<p>
				<%=vo.getDcratio()%>
				%할인
			</p>
			<p>
				<%=Math.round((vo.getPrice() * (1 - vo.getDcratio() * 0.01)) / 100) * 100%>
			</p>
			<p>
				<input type="button" value="즉시구매" /> <input type="button" value="장바구니" />
			</p>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>