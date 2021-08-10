<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %> <!-- Java.sql의 모든 클래스를 가져온다. -->

<%
request.setCharacterEncoding("UTF-8"); // 한글 깨짐 방지
Class.forName("oracle.jdbc.OracleDriver"); // 오라클 DB연결 클래스파일 불러오기
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234"); // DB 주소연결																										//꼭 url, user, password로 구성된 실행문 사용

Statement stmt = conn.createStatement(); // Select문 사용할 쿼리실행문
PreparedStatement ps = null; // update, insert, delete문 사용할 쿼리실행문

ResultSet rs = null; // 결과를 담을 객체
String sql = ""; // sql문 담을 객체
%>