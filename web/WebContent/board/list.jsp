<%@page import="vo.MemberVO"%>
<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	width: 900px;
	margin: auto;
	border-bottom: 1px solid black;
}

table, th, td {
	border-top: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}

#col1 {
	width: 13%
}

#col2 {
	width: 20%
}

#col3 {
	width: 30%
}

#col4 {
	width: 7%
}

#col5 {
	width: 30;
}
</style>
<script type="text/javascript">
	window.onload = function() {
		var c = document.getElementById("check");
		var v = document.getElementsByClassName("ck");
		toggle(c, v);
		console.dir(v);
	}
	function toggle(c, v) {
		if (c.checked == true) {
		} else {
		}
	}
</script>
</head>
<body>
	<%
		String id = "";
		Object obj = session.getAttribute("vo");
		if (obj != null) {
			MemberVO m = (MemberVO) obj;
			id = m.getId();
			out.println("<h3> " + id + "</h3>");
		}
	%>
	<form action="deleteList.jsp">
		<table>
			<tr>
				<%
					if (id.equals("admin")) {
						out.println("<th id='check'>");
						out.println("<input type='checkbox' />");
						out.println("</th>");
					}
				%>
				<th id="col1">게시물 번호</th>
				<th id="col2">제목</th>
				<th id="col3">작성자</th>
				<th id="col5">내 용</th>
				<th id="col4">조회수</th>
			</tr>
			<%
				BoardDAO dao = new BoardDAO();
				ArrayList<BoardVO> voList = dao.selectAll();
				for (BoardVO vo : voList) {
			%>

			<tr>
				<%
					if (id.equals("admin")) {
							out.println("<td id='check'>");
							out.println("<input type='checkbox' name='ck' value='" + vo.getBno() + "'/>");
							out.println("</td>");

						}
				%>
				<td>
					<%=vo.getBno()%></td>
				<td>
					<a href="detail.jsp?bno=<%=vo.getBno()%>"><%=vo.getTitle()%></a>
				</td>
				<td><%=vo.getWriter()%></td>
				<td><%=vo.getContents()%></td>
				<td><%=vo.getHits()%></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td colspan="4">
					<a href="write.jsp"><input type="button" value="글쓰기" /></a>
					<%
						if (id.equals("admin")) {
							out.println("<input type='submit' value='삭제'/>");
						}
					%>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>