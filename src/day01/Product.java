package day01;

public class Product {
	private String pcode;
	private String category;
	private String pname;
	private int price;
	
	public Product(String pcode, String category, String pname, int price) {
		this.pcode=pcode;
		this.category=category;
		this.pname=pname;
		this.price=price;
	}

	public Product() {
		
	}
	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return String.format("%10s", pcode)+":"
				+String.format("%5s", category)+","
				+String.format("%10s", pname)+", "
				+String.format("%10d", price);
	}
	
	
	
	
	
	
	
	
	
	
	
}
