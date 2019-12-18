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
<%
	String id = "";
	Object obj = session.getAttribute("vo");
	if (obj != null) {
		MemberVO m = (MemberVO) obj;
		id = m.getId();
		out.println("<h3> " + id + "</h3>");
	}
%>
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

<%
	if (id.equals("admin")) {
%>
<script type="text/javascript">
	window.onload = function() {
		var tglCk = document.getElementById("tglCk");
		tglCk.onclick = function() {
			var ck = document.getElementsByName("ck");
			for (var i = 0; i < ck.length; i++) {
				var box = ck[i];
				box.checked = tglCk.checked;
			}
		}
	}
</script>
<%
	}
%>
</head>
<body>
	<form action="deleteList.jsp">
		<table>
			<tr>
				<%
					if (id.equals("admin")) {
						out.println("<th>");
						out.println("<input type='checkbox' id='tglCk'/>");
						out.println("</th>");
					}
				%>
				<th id="col1">게시물 번호</th>
				<th id="col2">제목</th>
				<th id="col3">작성자</th>
				<!-- <th id="col5">내 용</th> -->
				<th id="col4">조회수</th>
			</tr>
			<%
				BoardDAO dao = new BoardDAO();
				int totalCount = dao.getTotalCount();
				int recordPerPage = 20;
				int totalPage = (totalCount % recordPerPage == 0) ? (totalCount / recordPerPage)
						: (totalCount / recordPerPage) + 1;

				String cp = request.getParameter("cp");
				int currentPage = 0;
				if (cp != null) {
					currentPage = Integer.parseInt(cp);
				} else {
					currentPage = 1;
				}

				int startNo = (currentPage - 1) * recordPerPage + 1;
				int endNo = currentPage * recordPerPage;
				int startPage = 1;
				int endPage = totalPage;

				if (currentPage <= 5) {
					startPage = 1;
				} else if (currentPage > 6) {
					startPage = currentPage - 4;
				}

				if (totalPage - currentPage <= 5) {
					endPage = totalPage;
				} else if (totalPage - currentPage > 5) {
					if (currentPage <= 5) {
						if (totalPage > 10) {
							endPage = 10;
						} else {
							endPage = totalPage;
						}
					} else {
						endPage = currentPage + 4;
					}
				}

				out.println("총 게시물 수 : " + totalCount);
				out.println("한페이지당 게시물 건 수 : " + recordPerPage);
				out.println("총 페이지 수 : " + totalPage);
				out.println("현재 페이지 : " + currentPage);
				out.println("게시물의 시작번호 : " + startNo);
				out.println("게시물의 엔드번호 : " + endNo);
				out.println("시작페이지의 번호 : " + startPage);
				out.println("엔드페이지의 번호 : " + endPage);

				ArrayList<BoardVO> voList = dao.selectAll(startNo, endNo);
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
				<%-- <td><%=vo.getContents()%></td> --%>
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
			<tr>
				<td colspan="4">
					<%
						for (int i = startPage; i <= endPage; i++) {
					%>
					<a href="list.jsp?cp=<%=i%>"><%=i%></a>
					<%
						}
					%>
				</td>

			</tr>
		</table>
	</form>
</body>
</html>