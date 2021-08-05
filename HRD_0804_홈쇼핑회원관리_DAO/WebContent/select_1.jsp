<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리 ver 1.0</title>
</head>
<body>
<%@ include file = "header.jsp" %> <!-- header부분에 header.jsp파일 가져온다 (db연결 구문(dbconn.jsp)이 포함되어있다.) -->
	<section>
		<div>
			<h2>회원목록조회/수정</h2>
		</div>
		<table border = "1" width = "90%" style = "margin : 0 auto;">
			<thead style = "display: table; width: calc(100% - 17px);">
				<tr>
					<th width = "11%">회원번호</th>
					<th width = "10%">회원성명</th>
					<th width = "14%">전화번호</th>
					<th width = "25%">주소</th>
					<th width = "13.3333%">가입일자</th>
					<th width = "13.3333%">고객등급</th>
					<th width = "13.3333%">거주지역</th>
				</tr>
			</thead>
			<tbody style = "display: block; max-height: 250px; overflow-y: scroll;">
			<%@ page import = "java.util.*" %>
			<%@ page import = "member.*" %>
			<%
				ShoppingDAO dao = new ShoppingDAO();
			
				// List = 부모 인터페이스
				List<MemberBeans> list = dao.getMembers();
				
				for (int i = 0 ; i < list.size() ; i++) {// size() : 저장된 객체수 = Member수
						MemberBeans beans = list.get(i);
			%>
				<tr align = "center" style = "display: table; width: 100%; box-sizing: border-box;">
					<td width = "11%">
					<!-- a href = ""안에 있는 부분 띄어쓰기 없어야 함(파란글씨) -->
					<a href="update.jsp?custno=<%=beans.getCustno()%>&&joindate=<%=beans.getJoindate()%>" style = "text-decoration: none; color: white;">
					<%=beans.getCustno() %>
					</a>
					</td>
					<td width = "10%"><%=beans.getCustname() %></td>
					<td width = "14%"><%=beans.getPhone() %></td>
					<td width = "25%"><%=beans.getAddress() %></td>
					<td width = "13.3333%"><%=beans.getJoindate() %></td>
					<td width = "13.3333%"><%=beans.getGrade() %></td>
					<td width = "13.3333%"><%=beans.getCity() %></td>
				</tr>
				<%
				}
				%>
				</tbody>
			<tr>
				<th>
					<input type = "button" value = "조회-2(같이)" onclick = "location = 'select_2.jsp'">
				</th>
			</tr>
		</table>
	</section>
<%@ include file = "footer.jsp" %> <!-- footer부분에 footer.jsp파일 가져온다 (db연결 해제 구문이 포함되어있다.) -->
</body>
</html>