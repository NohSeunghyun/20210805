<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 시작점에 DB와 연결 해야함 -->
<%-- <%@ include file = "dbconn.jsp"%> 자바파일로 DB연결하기위해 파일삭제 ->주석처리 --%>
<%@ page import = "member.*" %>

<%request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id = "beans" class = "member.MemberBeans"></jsp:useBean>
<jsp:setProperty property = "*" name = "beans"/> 

<%
	ShoppingDAO dao = new ShoppingDAO();

	dao.updateMember(beans);
%>
<script>
	//성공알림창
	alert("회원 수정이 완료 되었습니다!");
	location.href = "select_1.jsp";
</script>
