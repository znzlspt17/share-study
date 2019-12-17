<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  a.jsp 불러오기 -->
	<!--  1. 인클루드 -->
	<!-- 인클루드는 a.jsp의 변수를 같이 가져움 -->
	<%-- 
	<%@ include file="a.jsp"%>
	<%
		out.println(a);
	%>
	 --%>
	<!--  a.jsp 불러오기 -->
	<!--  2. 액션 태그 -->
	<!-- 액션태그는 a.jsp의 변수를 같이 가져오지 않음 -->
	<jsp:include page="a.jsp"></jsp:include>
	<!--  <시작태그 속성="값"> 콘텐츠 </종료태그> -->
	<!--  <시작태그 속성="값"></종료태그> -->
	<!--  <시작태그 속성="값"/> -->
	<!--  태그는 총 세가지 형태로 사용 -->

</body>
</html>