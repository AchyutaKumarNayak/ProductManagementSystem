package in.achyuta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import in.achyuta.bean.ProductBean;
import in.achyuta.db.DBConnection;

public class ProductDAO {
	Connection con=DBConnection.getConnection();
	
	public int addProduct(ProductBean pbean) {
		int k=0;
		try {
			PreparedStatement ps = con.prepareStatement("INSERT INTO PRODUCTBEAN VALUES(?,?,?,?,?)");
			ps.setString(1, pbean.getProductCode());
			ps.setString(2, pbean.getProductName());
			ps.setDouble(3, pbean.getProductPrice());
			ps.setInt(4, pbean.getProductQty());
			ps.setString(5, pbean.getProductCategory());
			
			k = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return k;
	}
	
	public boolean findByProductCode(String pcode) {
		boolean flag=false;
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM PRODUCTBEAN WHERE PCODE=?");
			ps.setString(1, pcode);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				flag=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	public List<ProductBean> viewAll(){
		List<ProductBean> products= new ArrayList<ProductBean>();
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM PRODUCTBEAN");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductBean bean= new ProductBean();
				bean.setProductCode(rs.getString(1));
				bean.setProductName(rs.getString(2));
				bean.setProductPrice(rs.getDouble(3));
				bean.setProductQty(rs.getInt(4));
				bean.setProductCategory(rs.getString(5));
				products.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}

	public int update(String pcode,String pprice,String pqty) {
		int k=0;
		try {
			PreparedStatement ps = con.prepareStatement("UPDATE PRODUCTBEAN SET PPRICE=?,PQTY=? WHERE PCODE=?");
			ps.setDouble(1, Double.parseDouble(pprice));
			ps.setInt(2, Integer.parseInt(pqty));
			ps.setString(3, pcode);
			k = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return k;
	}

	public int delete(String pcode) {
		int k=0;
		try {
			PreparedStatement ps = con.prepareStatement("DELETE FROM PRODUCTBEAN WHERE PCODE=?");
			ps.setString(1, pcode);
			k = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return k;
	}

	public int buy(String pcode,int qty) {
	   int k=0; 
	   try {
			PreparedStatement ps = con.prepareStatement("UPDATE PRODUCTBEAN SET PQTY=PQTY-? WHERE PCODE=?");
			ps.setInt(1, qty);
			ps.setString(2, pcode);
			k = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return k;
	}

	
}
