<%@page import="java.util.List"%>
<%@page import="member.SalesBeans"%>
<%@page import="member.ShoppingDAO"%>
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
			<h2>회원매출조회</h2>
		</div>
		<table border = "1" width = "80%" style = "margin: 0 auto;">
			<thead style = "display: table; width: calc(100% - 17px);">
				<tr>
					<th width = "20%">회원번호</th>
					<th width = "20%">회원성명</th>
					<th width = "30%">고객등급</th>
					<th width = "30%">매출</th>
				</tr>
			</thead>
			<tbody style = "display: block; max-height: 300px; overflow-y: scroll;">
			<%
				ShoppingDAO dao = new ShoppingDAO();
				List<SalesBeans> list = dao.getSalesMembers();
				for (int i = 0 ; i < list.size() ; i++) {
					SalesBeans beans = list.get(i);
			%>
				<tr align = "center" style = "display: table; width: 100%; box-sizing: border-box;">
					<td width = "20%"><%=beans.getCustno() %></td>
					<td width = "20%"><%=beans.getCustname() %></td>
					<td width = "30%"><%=beans.getGrade() %></td>
					<td width = "30%"><%=beans.getTotalprice() %></td>
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