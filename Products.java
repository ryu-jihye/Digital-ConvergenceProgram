package com.conan.vo;

public class Products {
	
	private String proId;
	private String proName;
	private Integer unitPrice;
	private String description;
	private String manufacturer;
	private String category;
	private Integer noOfStock;
	
	public Products(String proId, String proName, int unitPrice, String description, String manufacturer,
	         String category, int noOfStock) {
	      super();
	      this.proId = proId; //상품 아이디
	      this.proName = proName; //상품명
	      this.unitPrice = unitPrice; //상품가격
 	      this.description = description; //설명
	      this.manufacturer = manufacturer; //제조사
	      this.category = category; //분류
	      this.noOfStock = noOfStock; //재고여부
	   }
	
	public Products() {}
	
	public String getProId() {
		return proId;
	}

	public void setProId(String proId) {
		this.proId = proId;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Integer getNoOfStock() {
		return noOfStock;
	}

	public void setNoOfStock(Integer noOfStock) {
		this.noOfStock = noOfStock;
	}

	
}
