<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 시작점에 DB와 연결 해야함 -->
<%@ include file = "dbconn.jsp"%>

<%
try{
	//insert 이므로 PrepareStatement 구문객체 사용
	sql = "insert into member_tbl_02 values (?, ?, ?, ?, ?, ?, ?)";
	
	ps = conn.prepareStatement(sql);
	ps.setString(1, request.getParameter("custno"));
	ps.setString(2, request.getParameter("custname"));
	ps.setString(3, request.getParameter("phone"));
	ps.setString(4, request.getParameter("address"));
	ps.setString(5, request.getParameter("joindate"));
	ps.setString(6, request.getParameter("grade"));
	ps.setString(7, request.getParameter("city"));
	
	ps.executeUpdate();
%>
<script>
	alert("회원 등록이 완료 되었습니다!");
	location = "insert.jsp";
</script>
<%
} catch (Exception e) {
%>
<script>
	alert("회원 등록이 실패 하였습니다!");
	history.back();
</script>
<%
} finally { // 예외객체 생성 여부에 관계없이 DB 연결 해제
	try {
		if (conn != null) conn.close();
		if (stmt != null) stmt.close();
		if (ps != null) ps.close();
		if (rs != null) rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
%>