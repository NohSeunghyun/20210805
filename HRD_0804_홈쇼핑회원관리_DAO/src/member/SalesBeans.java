package member;

public class SalesBeans { // money_tbl_02 테이블 // 전체 조회
	// 1. 멤버변수-private. 반드시 DB안의 테이블에 들어있는 컬럼명과 동일한 이름으로 생성해야함.
	private String custno; // 회원번호
	private String custname; // 회원성명
	private String grade; // 고객등급
	private String totalprice; // 매출액

	// 2. 매개변수(=인수=인자=argument)가 없는 생성자 필요 - 기본생성자 생략 가능
	
	// 3. 메서드 : 반드시 public이어야함.
	
	// 4. getter&setter

	public String getCustno() {
		return custno;
	}
	public void setCustno(String custno) {
		this.custno = custno;
	}
	public String getCustname() {
		return custname;
	}
	public void setCustname(String custname) {
		this.custname = custname;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}
	
} // 클래스문