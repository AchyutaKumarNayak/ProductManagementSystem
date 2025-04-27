package in.achyuta.bean;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ProductBean implements Serializable{
	
	private String productCode;
	private String productName;
	private Double productPrice;
	private Integer productQty;
	private String productCategory;
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Double getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Double productPrice) {
		this.productPrice = productPrice;
	}
	public Integer getProductQty() {
		return productQty;
	}
	public void setProductQty(Integer productQty) {
		this.productQty = productQty;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	
	public ProductBean() {}
	@Override
	public String toString() {
		return "ProductBean [productCode=" + productCode + ", productName=" + productName + ", productPrice="
				+ productPrice + ", productQty=" + productQty + ", productCategory=" + productCategory + "]";
	}
	
	

}
