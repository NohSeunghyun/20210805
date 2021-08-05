<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ★★DOCTYPE 위에 꼭 DB연결 구문을 넣어야함★★ -->
<%-- <%@ include file = "dbconn.jsp" %> 자바파일로 DB연결하기위해 파일삭제 ->주석처리 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리 ver 1.0</title>
<link rel = "stylesheet" type = "text/css" href = "style.css"> <!-- css파일 삽입 -->
</head>
<body>
	<header>
		<h2>쇼핑몰 회원관리 ver 1.0</h2>
	</header>
	<nav>
		<a href = "insert.jsp">회원등록</a>
		<a href = "select_1.jsp">회원목록조회/수정(따로)</a>
		<a href = "select_2.jsp">회원목록조회/수정(같이)</a>
		<a href = "select2.jsp">회원매출조회</a>
		<a href = "index.jsp">홈으로</a>
	</nav>
</body>
</html>