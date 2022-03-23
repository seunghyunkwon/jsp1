package day02.vo;

public class SaleSum {
	private int custNo;
	private String custName;
	private String grade;
	private int sum;
	
	
	
	
	
	
	
	@Override
	public String toString() {
		return "SaleSum [custNo=" + custNo + ", custName=" + custName + ", grade=" + grade + ", sum=" + sum + "]";
	}

	public SaleSum() {
		
	}

		//생성자
	public SaleSum(int custNo, String custName, String grade, int sum) {
		super();
		this.custNo = custNo;
		this.custName = custName;
		this.grade = grade;
		this.sum = sum;
	}

		//getter setter
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
