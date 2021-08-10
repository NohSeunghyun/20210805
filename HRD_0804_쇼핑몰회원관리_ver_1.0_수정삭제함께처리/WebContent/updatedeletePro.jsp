<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 시작점에 DB와 연결 해야함 -->
<%@ include file = "dbconn.jsp"%>

<%
switch (request.getParameter("pro")) {
	case "update" : 
		try {
			//update 이므로 PrepareStatement 구문객체 사용
			sql = "update member_tbl_02 set custname = ?, phone = ?, address = ?, grade = ?, city = ? where custno = ?";
			
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, request.getParameter("custname"));
			ps.setString(2, request.getParameter("phone"));
			ps.setString(3, request.getParameter("address"));
			ps.setString(4, request.getParameter("grade"));
			ps.setString(5, request.getParameter("city"));
			ps.setString(6, request.getParameter("custno"));
			
			ps.executeUpdate();
%>
<script>
			alert("회원 수정이 완료 되었습니다!");
			location = "select.jsp";
</script>
<%
		} catch (Exception e) {
%>
<script>
			alert("회원 수정이 실패 하였습니다!");
			history.back();
</script>
<%
		}
	break;
		
	case "delete" : 
		try {
			//delete 이므로 PrepareStatement 구문객체 사용
			sql = "delete from member_tbl_02 where custno = ?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, request.getParameter("custno"));
			
			ps.executeUpdate();
%>
<script>
				alert("회원 삭제 완료 되었습니다!");
				location = "select.jsp";
</script>
<%
			} catch (Exception e) {
%>
<script>
				alert("회원 삭제 실패 하였습니다!");
				history.back();
</script>
<%
			}
		break;
	} // switch의 끝
try {
	if (conn != null) conn.close();
	if (stmt != null) stmt.close();
	if (ps != null) ps.close();
	if (rs != null) rs.close();
} catch (Exception e) {
	e.printStackTrace();
}	
%>