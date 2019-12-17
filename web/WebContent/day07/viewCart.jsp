<%@page import="vo.ProductVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	border-top: 5px solid black;
	border-bottom: 5px solid black;
	margin: 0 auto;
	width: 800px;
}

img {
	width: 100px;
	height: 100p
}
</style>
</head>
<body>
	<%
		// 세션에 cart라는 이름의 속성객체 얻어오기
			Object obj = session.getAttribute("cart");
			if (obj != null) {
		ArrayList<Integer> list = (ArrayList<Integer>) obj;
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
			ProductDAO dao = null;
			for (int x : list) {
				if (map.containsKey(x)) {
					map.put(x, map.get(x) + 1);
				} else {
					map.put(x, 1);
				}
			}
			ProductVO vo = null;
			int key = 0;
			dao = new ProductDAO();
			Set<Integer> keySet = map.keySet();
			Iterator<Integer> it = keySet.iterator();
	%>
	<table>
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>이미지</th>
			<th>수량</th>
			<th>가격</th>
			<%
				while (it.hasNext()) {
						key = it.next();
						vo = dao.selectOne(key);

						out.println("<tr>");
						out.println("<td><h4>" + vo.getPno() + "</h4></td><td><h4>" + vo.getPname()
								+ "</h4></td><td><h4><img src='" + vo.getImgfile() + "'/></h4></td><td><h4>" + map.get(key)
								+ "</h4></td><td><h4>"
								+ Math.round((int) (vo.getPrice() * (1 - (vo.getDcratio() * 0.01))) * 0.01) * 100
								+ "</h4></td>");
						out.println("</tr>");
					}
					dao.close();
			%>
		
	</table>
	<p>
		<input type="button" value="즉시구매" /> <input type="button" value="장바구니" />
	</p>
	<%
		}
	%>
</body>
</html>