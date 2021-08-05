/*
 * DAO : Data Access Object
 * 데이터베이스에 접속해서 데이터 추가, 삭제, 수정 등의 작업을 하는 클래스
 */
package member;

// 밑에 하나하나씩 import하기 귀찮을때
//import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ShoppingDAO {
	/*
	 * 1. 필드 = 멤버변수
	 */
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	String sql = "";
	
	/*
	 * 2. 생성자 : 기본생성자 - 필드에 기본값(수 : 0, 클래스타입 : null, boolean : false)을 주어 객체 생성
	 */
	
	/*
	 * 3. 메서드
	 */
	
	public static Connection getConnection() throws Exception { // getConnection()을 호출한 쪽에서 예외처리하도록
		// static을 사용해 바로 메모리에 로딩, public를 사용해 어디서든 사용가능하게
		
		/********************첫번째 방법********************/
		// 1. 오라클 드라이버 로딩
		Class.forName("oracle.jdbc.OracleDriver"); // "오라클안에 jdbc안에 오라클드라이버" 로 외우기 // 예외발생.
		
		// 2. Connection 객체 생성
		String url = "jdbc:oracle:thin:@localhost:1521:xe"; // 미리 경로를 변수에 참조시켜놓음
		Connection con = DriverManager.getConnection(url, "system", "1234"); // 지역변수 : 반드시 초기화 
													// 경로, 사용자, 패스워드
		
		return con;
	}
	
	// 1. 회원 번호로 조회('회원등록'폼에서) - 다음 번호 조회(단건조회) + 시스템으로부터 날짜
	public MemberBeans getMaxCustnoJoindate() {
		MemberBeans beans = new MemberBeans(); // 기본값으로 채워진 객체 생성
		
		try {
			// 1). DB 연결 - con : 멤버변수
			// => getConnection의 리턴값인 지역변수 con을 받아 멤버변수인 con에 넣는다. => DB연결됨
			con = getConnection(); // static 메서드이므로 바로 호출 가능 (같은클래스 안에 있으므로 클래스명.getConnection에서 클래스명 생략)
			
			// 2). sql문 작성
			sql += "select NVL(max(custno),0)+1 as custno,";
			sql += " to_char(sysdate, 'yyyymmdd') as joindate";
			sql += " from member_tbl_02";
			
			// 3). 쿼리실행
			ps = con.prepareStatement(sql); // sql문을 넣어 ps객체 생성
			rs = ps.executeQuery(); // select 실행 // 매개변수 빈것으로해야함 이유?미리 sql문을넣어 ps에 참조시켰기때문에 따로 안적어도됨 컴파일속도가 빨라짐
			
			// 4). 결과처리 -> 최대회원번호 + 1, 오늘날짜로 셋팅된 객체로 변경
			if (rs.next()) { // 결과가 1개 나오지만 만약 나오지 않는다면 처리하기위해
				beans.setCustno(rs.getString("custno")); // rs.getString(1)으로 사용가능 = 첫번째 컬럼(=회원번호) 값
				beans.setJoindate(rs.getString("joindate")); // rs.getString(2)으로 사용가능 = 두번째 컬럼(=날짜) 값
			}
		} catch (Exception e) {
			// TODO 예외처리 부모로 처리 자식예외클래스는 지움
			e.printStackTrace();
		} finally {
			// 5). DB 연결 해제
			try {
				if (con != null) con.close();
				if (ps != null) ps.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return beans;
	}
	
	// 2. 회원등록
	public void insertMember(MemberBeans beans) {
		
		try {
			// 1). DB 연결 - con : 멤버변수
			// => getConnection의 리턴값인 지역변수 con을 받아 멤버변수인 con에 넣는다. => DB연결됨
			con = getConnection(); // static 메서드이므로 바로 호출 가능 (같은클래스 안에 있으므로 클래스명.getConnection에서 클래스명 생략)
			
			// 2). sql문 작성
			//sql = "insert into member_tbl_02(custno, custname, phone, address, joindate, grade, city) values (?, ?, ?, ?, ?, ?, ?)"; // 컬럼명을 나열해서 사용해도됨 
			//sql = "insert into member_tbl_02(custno, custname, phone) values (?, ?, ?)"; // 넣고싶은 컬럼만 적어 넣을 값만 넣어 insert할 수 있으나 문제의 유효성체크항목에 걸리기때문에 지금 사용하면안됨.이렇게도 사용가능하다 
			//sql = "insert into member_tbl_02 values (?, ?, ?, ?, to_char(?,'yyyy-mm-dd'), ?, ?)"; // joindate형식을 yyyy-mm-dd로 하고싶을 경우 여기서 바로 넣어 사용해도됨 
			sql = "insert into member_tbl_02 values (?, ?, ?, ?, ?, ?, ?)"; // 제일 심플함
			
			// 3). 쿼리실행
			ps = con.prepareStatement(sql); // sql문을 넣어 ps객체 생성
			
			ps.setString(1, beans.getCustno());
			ps.setString(2, beans.getCustname());
			ps.setString(3, beans.getPhone());
			ps.setString(4, beans.getAddress());
			ps.setString(5, beans.getJoindate());
			ps.setString(6, beans.getGrade());
			ps.setString(7, beans.getCity());
			
			ps.executeUpdate(); // insert 실행 
			
		} catch (Exception e) {
			// TODO 예외처리 부모로 처리 자식예외클래스는 지움
			e.printStackTrace();
		} finally {
			// 4). DB 연결 해제
			try {
				if (con != null) con.close();
				if (ps != null) ps.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	// 3. 회원 전체 조회
	public ArrayList<MemberBeans> getMembers() {
		ArrayList<MemberBeans> list = new ArrayList<MemberBeans>();
		
		try {
			// 1). DB 연결 - con : 멤버변수
			// => getConnection의 리턴값인 지역변수 con을 받아 멤버변수인 con에 넣는다. => DB연결됨
			con = getConnection(); // static 메서드이므로 바로 호출 가능 (같은클래스 안에 있으므로 클래스명.getConnection에서 클래스명 생략)
			
			// 2). sql문 작성
			sql += "select custno, custname, phone, address, ";
			sql += " to_char(joindate, 'yyyy-mm-dd'),";
			sql += " decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원'),";
			sql += " city";
			sql += " from member_tbl_02";
			sql += " order by custno";
			
			// 3). 쿼리실행
			ps = con.prepareStatement(sql); // sql문을 넣어 ps객체 생성
			rs = ps.executeQuery(); // select 실행 // 매개변수 빈것으로해야함 이유?미리 sql문을넣어 ps에 참조시켰기때문에 따로 안적어도됨 컴파일속도가 빨라짐
			
			// 4). 결과처리 
			while (rs.next()) {
				MemberBeans beans = new MemberBeans(); // 기본값으로 채워진 객체
				
				// 필드에 기본값이 아닌 결과셋의 레코드의 값을 저장
				beans.setCustno(rs.getString(1));
				beans.setCustname(rs.getString(2));
				beans.setPhone(rs.getString(3));
				beans.setAddress(rs.getString(4));
				beans.setJoindate(rs.getString(5));
				beans.setGrade(rs.getString(6));
				beans.setCity(rs.getString(7));
				
				list.add(beans);
			}
		} catch (Exception e) {
			// TODO 예외처리 부모로 처리 자식예외클래스는 지움
			e.printStackTrace();
		} finally {
			// 5). DB 연결 해제
			try {
				if (con != null) con.close();
				if (ps != null) ps.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// 4. 회원 조회 - '회원 번호를 매개값으로 받아 조회한 회원객체를 리턴'
	public MemberBeans getMember(String custno) {
		MemberBeans beans = new MemberBeans();
		
		try {
			// 1). DB 연결 - con : 멤버변수
			// => getConnection의 리턴값인 지역변수 con을 받아 멤버변수인 con에 넣는다. => DB연결됨
			con = getConnection(); // static 메서드이므로 바로 호출 가능 (같은클래스 안에 있으므로 클래스명.getConnection에서 클래스명 생략)
			
			// 2). sql문 작성
			sql += "select custno, custname, phone, address, ";
			sql += " to_char(joindate, 'yyyy-mm-dd') as joindate,";
			sql += " grade, city";
			sql += " from member_tbl_02";
			sql += " where custno = ?";
		
			// 3). 쿼리실행
			ps = con.prepareStatement(sql); // sql문을 넣어 ps객체 생성
			ps.setString(1, custno);
			
			rs = ps.executeQuery(); // select 실행 // 매개변수 빈것으로해야함 이유?미리 sql문을넣어 ps에 참조시켰기때문에 따로 안적어도됨 컴파일속도가 빨라짐
			
			// 4). 결과처리 : 기본값이 아닌 결과셋에서 얻어온 값으로 변경 
			if (rs.next()) { // 결과가 1개
				beans.setCustno(rs.getString("custno"));
				beans.setCustname(rs.getString("custname"));
				beans.setPhone(rs.getString("phone"));
				beans.setAddress(rs.getString("address"));
				beans.setJoindate(rs.getString("joindate"));
				beans.setGrade(rs.getString("grade"));
				beans.setCity(rs.getString("city"));
			}
		} catch (Exception e) {
			// TODO 예외처리 부모로 처리 자식예외클래스는 지움
			e.printStackTrace();
		} finally {
			// 5). DB 연결 해제
			try {
				if (con != null) con.close();
				if (ps != null) ps.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return beans;
	}
	
	// 5. 회원 수정
	public void updateMember(MemberBeans beans) {
		
		
		try {
			// 1). DB 연결 - con : 멤버변수
			// => getConnection의 리턴값인 지역변수 con을 받아 멤버변수인 con에 넣는다. => DB연결됨
			con = getConnection(); // static 메서드이므로 바로 호출 가능 (같은클래스 안에 있으므로 클래스명.getConnection에서 클래스명 생략)
			
			// 2). sql문 작성 
			sql = "update member_tbl_02 set custname = ?, phone = ?, address = ?, grade = ?, city = ? where custno = ?";
			
			// 3). 쿼리실행
			ps = con.prepareStatement(sql); // sql문을 넣어 ps객체 생성
			
			ps.setString(1, beans.getCustname());
			ps.setString(2, beans.getPhone());
			ps.setString(3, beans.getAddress());
			ps.setString(4, beans.getGrade());
			ps.setString(5, beans.getCity());
			ps.setString(6, beans.getCustno());
			
			ps.executeUpdate(); // update 실행 
			
		} catch (Exception e) {
			// TODO 예외처리 부모로 처리 자식예외클래스는 지움
			e.printStackTrace();
		} finally {
			// 4). DB 연결 해제
			try {
				if (con != null) con.close();
				if (ps != null) ps.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	// 6. 회원 삭제
	public void deleteMember(MemberBeans beans) {
		
		try {
			// 1). DB 연결 - con : 멤버변수
			// => getConnection의 리턴값인 지역변수 con을 받아 멤버변수인 con에 넣는다. => DB연결됨
			con = getConnection(); // static 메서드이므로 바로 호출 가능 (같은클래스 안에 있으므로 클래스명.getConnection에서 클래스명 생략)
			
			// 2). sql문 작성 
			sql = "delete from member_tbl_02 where custno = ?";
			
			// 3). 쿼리실행
			ps = con.prepareStatement(sql); // sql문을 넣어 ps객체 생성
			
			ps.setString(1, beans.getCustno());
			
			ps.executeUpdate(); // delete 실행 
			
		} catch (Exception e) {
			// TODO 예외처리 부모로 처리 자식예외클래스는 지움
			e.printStackTrace();
		} finally {
			// 4). DB 연결 해제
			try {
				if (con != null) con.close();
				if (ps != null) ps.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	// 7. 매출 조회
	public ArrayList<SalesBeans> getSalesMembers() {
		ArrayList<SalesBeans> list = new ArrayList<SalesBeans>();
		try {
			// 1). DB 연결 - con : 멤버변수
			// => getConnection의 리턴값인 지역변수 con을 받아 멤버변수인 con에 넣는다. => DB연결됨
			con = getConnection(); // static 메서드이므로 바로 호출 가능 (같은클래스 안에 있으므로 클래스명.getConnection에서 클래스명 생략)
			
			// 2). sql문 작성
			sql += "select custno, custname,";
			sql += " decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원'),";
			sql += " sum(pcost*amount) as totalprice";
			sql += " from member_tbl_02 natural join money_tbl_02";
			sql += " group by custno, custname, decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원')";
			sql += " order by totalprice desc";
			
			// 3). 쿼리실행
			ps = con.prepareStatement(sql); // sql문을 넣어 ps객체 생성
			rs = ps.executeQuery(); // select 실행 // 매개변수 빈것으로해야함 이유?미리 sql문을넣어 ps에 참조시켰기때문에 따로 안적어도됨 컴파일속도가 빨라짐
			
			// 4). 결과처리 
			while (rs.next()) {
				SalesBeans beans = new SalesBeans(); // 기본값으로 채워진 객체
				
				// 필드에 기본값이 아닌 결과셋의 레코드의 값을 저장
				beans.setCustno(rs.getString(1));
				beans.setCustname(rs.getString(2));
				beans.setGrade(rs.getString(3));
				beans.setTotalprice(rs.getString(4));
				
				list.add(beans);
			}
		} catch (Exception e) {
			// TODO 예외처리 부모로 처리 자식예외클래스는 지움
			e.printStackTrace();
		} finally {
			// 5). DB 연결 해제
			try {
				if (con != null) con.close();
				if (ps != null) ps.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
} // 클래스문