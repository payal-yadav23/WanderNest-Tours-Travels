package com.dao;

import java.sql.*;
import com.model.Customer;

public class CustomerDAO {

	private Connection getConnection() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/wandernest", "root", "Payal@123");
	}

	public boolean registerCustomer(Customer c) throws Exception {
		String sql = "INSERT INTO customers (full_name, email, password, gender) VALUES (?, ?, ?, ?)";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, c.getFullName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPassword());
			ps.setString(4, c.getGender());
			return ps.executeUpdate() > 0;
		}
	}

	public Customer login(String email, String password) throws Exception {
		String sql = "SELECT * FROM customers WHERE email=? AND password=?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				Customer c = new Customer();
				c.setId(rs.getInt("id"));
				c.setFullName(rs.getString("full_name"));
				c.setEmail(rs.getString("email"));
				c.setGender(rs.getString("gender"));
				return c;
			}
		}
		return null;
	}
}
