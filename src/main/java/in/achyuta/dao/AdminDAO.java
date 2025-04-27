package in.achyuta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import in.achyuta.bean.AdminBean;
import in.achyuta.db.DBConnection;

public class AdminDAO {
	
	Connection con=DBConnection.getConnection();
	
	public int register(AdminBean bean) {
		int k=0;
		try {
			PreparedStatement ps = con.prepareStatement("INSERT INTO ADMIN VALUES(?,?,?,?,?)");
			ps.setString(1, bean.getFirstName());
			ps.setString(2, bean.getLastName());
			ps.setString(3, bean.getEmail());
			ps.setString(4, bean.getMob());
			ps.setString(5, bean.getPassword());
		    k = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
           return k;
	}
	public boolean findByEmail(String email) {
		boolean flag=false;
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM ADMIN WHERE EMAIL=?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				flag=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	public AdminBean login(String email, String password) {
		AdminBean bean=new AdminBean();
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM ADMIN WHERE EMAIL=? AND PASSWORD=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				bean.setFirstName(rs.getString(1));
				bean.setLastName(rs.getString(2));
				bean.setEmail(email);
				bean.setPassword(password);
				bean.setMob(rs.getString(4));
			}else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

}
