<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width: 1200px;
	margin: auto;
}

table, th, td {
	border: 1px solid black;
}
</style>

<%
	Object obj = session.getAttribute("vo");
	if (obj == null) {
		response.sendRedirect("../board/login.jsp");
	} else {
		MemberVO vo = (MemberVO) obj;
		String writer = vo.getName();
%>
<script type="text/javascript" src="../se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript"></script>
</head>
<body>
	<form action="writeOk.jsp">
		<table>
			<tr>
				<!-- <th>작성자</th> -->
				<td>
					<input type="hidden" name="writer" id="" readonly="readonly" value="<%=writer%>" />
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" id="" />
				</td>
			</tr>

			<tr>
				<th>내용</th>
				<td>
					<textarea name="contents" id="ir1" cols="200" rows="10"
						style="width: 100%; height: 412px; display: none"
					></textarea>
				</td>
			</tr>

			<!-- <tr>
				<th>첨부파일</th>
				<td>
					<input type="file" name="filename" id="" />
				</td>
			</tr> -->
			<tr>
				<td colspan=2>
					<input type="button" value="목록" id=""> <input type="submit" value="전송"
						onclick="submitContents(this)"
					/> <input type="reset" value="다시쓰기" id="" />
				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		var oEditors = [];

		// 추가 글꼴 목록
		//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ir1",
			sSkinURI : "../se/SmartEditor2Skin.html",
			htParams : {
				bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
				fOnBeforeUnload : function() {
					//alert("완료!");
				}
			}, //boolean
			fOnAppLoad : function() {
				//예제 코드
				//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
			},
			fCreator : "createSEditor2"
		});

		function pasteHTML() {
			var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
			oEditors.getById["ir1"].exec("PASTE_HTML", [ sHTML ]);
		}

		function showHTML() {
			var sHTML = oEditors.getById["ir1"].getIR();
			alert(sHTML);
		}

		function submitContents(elClickedObj) {
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

			try {
				elClickedObj.form.submit();
			} catch (e) {
			}
		}

		function setDefaultFont() {
			var sDefaultFont = '궁서';
			var nFontSize = 24;
			oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
		}
	</script>
	<%
		}
	%>
</body>
</html>