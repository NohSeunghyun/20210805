<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리 ver 1.0</title>
</head>
<script type="text/javascript">
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
		f.pro.value = "update";
		f.sumbit();
	}
	
	function dlt() {
		if (f.custno.value == "") {
			alert("회원 번호가 입력되지 않았습니다.");
			return f.custno.focus();
		}
		if (confirm("정말 삭제 하시겠습니까?") == true) {
			f.pro.value = "delete";
			f.submit();
	    } else {
	        return ;
	    }
	}
</script>
<body>
<%@ include file = "header.jsp" %> <!-- header부분에 header.jsp파일 가져온다 (db연결 구문(dbconn.jsp)이 포함되어있다.) -->

<% // 회원 번호 select->update 자동 입력 sql문
	String custno = request.getParameter("custno"); // select.jsp에 저장되어 클릭한 custno를 받아 참조변수에 참조.
	String joindate = request.getParameter("joindate");
	
	sql += "select custno, custname, phone, address,";
	sql += "to_char(joindate, 'yyyy-mm-dd') as joindate,";
	sql += "grade, city";
	sql += " from member_tbl_02";
	sql += " where custno = '"+custno+"'"; // 참조변수를 사용해 검색조건에 custno를 클릭한 custno으로 자동입력
	
	rs = stmt.executeQuery(sql);
	rs.next();
%>
<script>

</script>
	<section>
		<div>
			<h2>홈쇼핑 회원 정보 수정</h2>
		</div>
	<form action = "updatedeletePro.jsp" name = "f" method = "post">
	<!-- 수정과 삭제를 함께 처리하기위해 아래코드 삽입 -->
	<input type = "hidden" name = "pro" value = "">
		<table border = "1" width = "600px" style = "margin : 0 auto;">
			<tr>
				<th width = "45%">회원 번호</th>
				<td width = "55%">
					<input type = "text" value = "<%=custno%>" name = "custno" size = "10" maxlength = "6" readonly>
				</td>
			</tr>
			<tr>
				<th>회원 성명</th>
				<td>
					<input type = "text" value = "<%=rs.getString("custname") %>" name = "custname" size = "10" maxlength = "20">
				</td>
			</tr>
			<tr>
				<th>회원 전화번호</th>
				<td>
					<input type = "text" value = "<%=rs.getString("phone") %>" name = "phone" size = "20" maxlength = "13">
				</td>
			</tr>
			<tr>
				<th>회원 주소</th>
				<td>
					<input type = "text" value = "<%=rs.getString("address") %>" name = "address" size = "30" maxlength = "60">
				</td>
			</tr>
			<tr>
				<th>가입 일자</th>
				<td>
					<input type = "text" value = "<%=joindate%>" name = "joindate" size = "10" readonly>
				</td>
			</tr>
			<tr>
				<th>고객 등급(A:VIP, B:일반, C:직원)</th>
				<td>
					<input type = "text" value = "<%=rs.getString("grade") %>" name = "grade" size = "10" maxlength = "1">
				</td>
			</tr>
			<tr>
				<th>도시 코드</th>
				<td>
					<input type = "text" value = "<%=rs.getString("city") %>" name = "city" size = "10" maxlength = "2">
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type = "submit" value = "수정" onclick = "check(); return false">
					<input type = "submit" value = "삭제" onclick = "dlt(); return false">
					<input type = "button" value = "조회" onclick = "location = 'select.jsp'">
					<input type = "reset" value = "다시쓰기">
				</th>
			</tr>
		</table>
	</form>
	</section>
<%@ include file = "footer.jsp" %> <!-- footer부분에 footer.jsp파일 가져온다 (db연결 해제 구문이 포함되어있다.) -->
</body>
</html>