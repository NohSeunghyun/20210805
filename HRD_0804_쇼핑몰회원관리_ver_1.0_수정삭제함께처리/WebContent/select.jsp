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
			<tbody style = "display: block; max-height: 300px; overflow-y: scroll;">
			<%
				sql += "select custno, custname, phone, address,";
				sql += "to_char(joindate, 'yyyy-mm-dd') as joindate,";
				sql += "decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원'),";
				sql += "city";
				sql += " from member_tbl_02";
				sql += " order by custno";
				rs = stmt.executeQuery(sql);
				while (rs.next()){
			%>
				<tr align = "center" style = "display: table; width: 100%; box-sizing: border-box;">
					<td width = "11%">
					<a href="updatedelete.jsp?custno=<%=rs.getString(1)%>&&joindate=<%=rs.getString(5)%>" style = "text-decoration: none; color: white;">
					<%=rs.getString(1) %>
					</a>
					</td>
					<td width = "10%"><%=rs.getString(2) %></td>
					<td width = "14%"><%=rs.getString(3) %></td>
					<td width = "25%"><%=rs.getString(4) %></td>
					<td width = "13.3333%"><%=rs.getString(5) %></td>
					<td width = "13.3333%"><%=rs.getString(6) %></td>
					<td width = "13.3333%"><%=rs.getString(7) %></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</section>
<%@ include file = "footer.jsp" %> <!-- footer부분에 footer.jsp파일 가져온다 (db연결 해제 구문이 포함되어있다.) -->
</body>
</html>