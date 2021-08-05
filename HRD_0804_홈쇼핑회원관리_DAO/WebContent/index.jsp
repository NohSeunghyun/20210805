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
			<h2>쇼핑몰 회원관리 프로그램</h2>
		</div>
		쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.
		프로그램 작성 순서 <!-- 아래 내용은 순서가 메겨져 있으므로 ol-li로 작성한다. -->
		<ol>
			<li>회원정보 테이블을 생성한다.</li>
			<li>매출정보 테이블을 생성한다.</li>
			<li>회원정보, 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.</li>
			<li>회원정보 입력 화면 프로그램을 작성한다.</li>
			<li>회원정보 조회 프로그램을 작성한다.</li>
			<li>회원매출정보 조회 프로그램을 작성한다.</li>
		</ol>
	</section>
	<%@ include file = "footer.jsp" %> <!-- footer부분에 footer.jsp파일 가져온다 (db연결 해제 구문이 포함되어있다.) -->
</body>
</html>