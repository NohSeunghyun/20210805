<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리 ver 1.0</title>
</head>
<body>
	<footer><!-- 저작권 관련정보 삽입 -->
		HRDKOREA copyrightⓒ2016 All rights reserved Human Resources Development Service of Korea.
	</footer>
</body>
</html>
<!-- footer부분 맨아래 DB연결 해제코드 작성해야함 --> <!-- 나중에 index에 header.jsp와 footer.jsp 하나로 합치기때문에 오류는 무시 -->
<%
	/* try {
		if (conn != null) conn.close();
		if (stmt != null) stmt.close();
		if (ps != null) ps.close();
		if (rs != null) rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	} */ // 자바파일로 DB연결 해제하기위해 주석처리
%>