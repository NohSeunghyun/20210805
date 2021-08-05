<%-- 책(jsp) - 249p 참조 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 시작점에 DB와 연결 해야함 -->
<%-- <%@ include file = "dbconn.jsp"%> 자바파일로 DB연결하기위해 파일삭제 ->주석처리 --%>

<%@ page import = "member.*" %>

<%-- ★★ 순서 중요 1. UTF-8로 인코딩 -> 2. 속성에 값 저장 : 순서 바뀔시 한글이 깨져서 나옴 --%>
<%-- 1. 먼저 인코딩 적용 --%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%-- member.MemberBeans 클래스를 id = "beans"라는 간단한 이름으로 변경하여 사용하겠다
     => MamberBeans beans = new MemberBeans();기본값으로 채워진 객체 --%>
<jsp:useBean id = "beans" class = "member.MemberBeans" scope = "page"></jsp:useBean> <!-- scope(=사용범위), page(=기본값) 생략가능 -->

<!-- 2. insert.jsp로부터 전달된 매개변수 이름과 MemberBeans객체에서 같은 이름의 속성(멤버변수)에 전달된 값 저장. -->
<!-- insert.jsp로부터 전달받은 값으로 채워진 객체로 변경됨 -->
<jsp:setProperty property = "*" name = "beans"/> <!-- name은 Bean의 id(=생성한 MemberBeans의 id) -->
<!-- property = "*" 사용시 MemberBeans(MemberBeans.java의 생성자로 만든 객체)의 멤버변수와 
member_tbl_02테이블의 컬럼명이 같으면MemberBeans.java의 set메서드를 통해 알아서 같은 이름에 값을 저장시켜줌 -->

<%
	ShoppingDAO dao = new ShoppingDAO();
	dao.insertMember(beans);
%>

<script>
	alert("회원 등록이 완료되었습니다!")
	location.href="select_1.jsp"
</script>








