package in.achyuta.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import in.achyuta.bean.CustomerBean;
import in.achyuta.db.DBConnection;

@SuppressWarnings("serial")
public class CustomerDAO implements Serializable {

	Connection con = DBConnection.getConnection();

	public CustomerBean login(String email, String password) {
		CustomerBean cb = null;
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM CUSTOMER WHERE EMAIL=? AND PASSWORD=? ");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				cb = new CustomerBean();
				cb.setFirstName(rs.getString(1));
				cb.setLastName(rs.getString(2));
				cb.setEmail(email);
				cb.setMob(rs.getString(4));
				cb.setPassword(password);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cb;
	}

	public boolean findByEmail(String email) {
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM CUSTOMER WHERE EMAIL=?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public int register(CustomerBean bean) {
		int k = 0;
		try {
			PreparedStatement ps = con.prepareStatement("INSERT INTO CUSTOMER VALUES(?,?,?,?,?)");
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

}
