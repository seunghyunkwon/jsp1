package koreait.vo;

public class HrdSaleSum {
	private int custNo;
	private String custName;
	private String grade;
	private int sum;
	
	
	@Override
	public String toString() {
		return "SaleSum [custNo=" + custNo + ", custName=" + custName + 
				", grade=" + grade + ", sum=" + sum + "]";
	}

	//생성자
	public HrdSaleSum() {
		// TODO Auto-generated constructor stub
	}

	public HrdSaleSum(int custNo, String custName, String grade, int sum) {
		super();
		this.custNo = custNo;
		this.custName = custName;
		this.grade = grade;
		this.sum = sum;
	}

	public int getCustNo() {
		return custNo;
	}

	public void setCustNo(int custNo) {
		this.custNo = custNo;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}
	
	
	
	
}
