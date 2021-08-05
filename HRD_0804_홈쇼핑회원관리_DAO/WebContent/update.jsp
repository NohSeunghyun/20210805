<%@page import="java.beans.Beans"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리 ver 1.0</title>
</head>
<script type="text/javascript"> // 자바 실행문을 사용하기위한 스크립트 생성
	function check() { // 유효성 체크 메서드
		if (f.custno.value == "") {
			alert("회원 번호가 입력되지 않았습니다.");
			return f.custno.focus();
		}
		if (f.custname.value == "") {
			alert("회원 성명이 입력되지 않았습니다.");
			return f.custname.focus();
		}
		if (f.phone.value == "") {
			alert("회원 전화번호가 입력되지 않았습니다.");
			return f.phone.focus();
		}
		if (f.address.value == "") {
			alert("회원 주소가 입력되지 않았습니다.");
			return f.address.focus();
		}
		if (f.joindate.value == "") {
			alert("가입 일자가 입력되지 않았습니다.");
			return f.joindate.focus();
		}
		if (f.grade.value == "") {
			alert("고객 등급이 입력되지 않았습니다.")
			return f.grade.focus();
		} else if (f.grade.value != "A" &&
				   f.grade.value != "B" &&
				   f.grade.value != "C") {
						alert("고객 등급이 잘못 입력 되었습니다.\n 'A','B','C'중 입력하세요.\n (A=VIP,B=일반,C=직원)");
						return f.grade.select();
					}
		if (f.city.value == "") {
			alert("도시 코드가 입력되지 않았습니다.");
			return f.city.focus();
		}
		f.action = "updatePro.jsp";
		f.sumbit();
	}
	
	function dlt() {
		if (f.custno.value == "") {
			alert("회원 번호가 입력되지 않았습니다.");
			return f.custno.focus();
		}
		if (confirm("정말 삭제 하시겠습니까?") == true) {
	        f.action = "deletePro.jsp";
			f.submit();
	    } else {
	        return ;
	    }
	}
	
</script>
<body>
<%@ include file = "header.jsp" %> <!-- header부분에 header.jsp파일 가져온다 (db연결 구문(dbconn.jsp)이 포함되어있다.) -->
<%@ page import = "member.*" %>
<% // 회원 번호 select -> update sql문에 넣기위해 자동으로 값가져오기
	String custno = request.getParameter("custno"); // select_1.jsp에 저장되어 클릭한 custno를 받아 참조변수에 참조.
	
	ShoppingDAO dao = new ShoppingDAO();
	MemberBeans beans = dao.getMember(custno);
%>
	<section>
		<div>
			<h2>홈쇼핑 회원 정보 수정</h2>
		</div>
	<form name = "f" method = "post">
		<table border = "1" width = "600px" style = "margin : 0 auto;">
			<tr>
				<th width = "45%">회원 번호</th>
				<td width = "55%">
					<input type = "text" value = "<%=beans.getCustno()%>" name = "custno" size = "10" maxlength = "6" readonly>
				</td>
			</tr>
			<tr>
				<th>회원 성명</th>
				<td>
					<input type = "text" value = "<%=beans.getCustname() %>" name = "custname" size = "10" maxlength = "20">
				</td>
			</tr>
			<tr>
				<th>회원 전화번호</th>
				<td>
					<input type = "text" value = "<%=beans.getPhone() %>" name = "phone" size = "20" maxlength = "13">
				</td>
			</tr>
			<tr>
				<th>회원 주소</th>
				<td>
					<input type = "text" value = "<%=beans.getAddress() %>" name = "address" size = "30" maxlength = "60">
				</td>
			</tr>
			<tr>
				<th>가입 일자</th>
				<td>
					<input type = "text" value = "<%=beans.getJoindate()%>" name = "joindate" size = "10" readonly>
				</td>
			</tr>
			<tr>
				<th>고객 등급(A:VIP, B:일반, C:직원)</th>
				<td>
					<input type = "text" value = "<%=beans.getGrade() %>" name = "grade" size = "10" maxlength = "1">
				</td>
			</tr>
			<tr>
				<th>도시 코드</th>
				<td>
					<input type = "text" value = "<%=beans.getCity() %>" name = "city" size = "10" maxlength = "2">
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type = "submit" value = "수정" onclick = "check(); return false">
					<input type = "submit" value = "삭제" onclick = "dlt(); return false">
					<input type = "button" value = "조회" onclick = "location = 'select_1.jsp'">
					<input type = "reset" value = "다시쓰기">
				</th>
			</tr>
		</table>
	</form>
	</section>
<%@ include file = "footer.jsp" %> <!-- footer부분에 footer.jsp파일 가져온다 (db연결 해제 구문이 포함되어있다.) -->
</body>
</html>