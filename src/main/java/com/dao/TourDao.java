package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Tour;

public class TourDao {

	public static List<Tour> fetchAllTours() throws Exception {
		List<Tour> list = new ArrayList<>();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/wandernest", "root", "Payal@123");
		Statement st = c.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM tour_packages");

		while (rs.next()) {
			Tour t = new Tour();
			t.setName(rs.getString("package_name"));
			t.setType(rs.getString("package_type"));
			t.setLocation(rs.getString("package_location"));
			t.setPrice(rs.getInt("package_price"));
			t.setDuration(rs.getInt("duration"));
			t.setSeats(rs.getInt("seats"));
			t.setStatus(rs.getString("package_status"));
			t.setFeatures(rs.getString("features"));
			t.setDetails(rs.getString("details"));
			list.add(t);
		}

		c.close();
		return list;
	}

	// ✅ New method: fetch single tour by name
	public static Tour getTourByName(String name) throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/wandernest", "root", "Payal@123");

		String sql = "SELECT * FROM tour_packages WHERE package_name = ?";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setString(1, name);
		ResultSet rs = ps.executeQuery();

		Tour t = null;
		if (rs.next()) {
			t = new Tour();
			t.setName(rs.getString("package_name"));
			t.setType(rs.getString("package_type"));
			t.setLocation(rs.getString("package_location"));
			t.setPrice(rs.getInt("package_price"));
			t.setDuration(rs.getInt("duration"));
			t.setSeats(rs.getInt("seats"));
			t.setStatus(rs.getString("package_status"));
			t.setFeatures(rs.getString("features"));
			t.setDetails(rs.getString("details"));
		}
		c.close();
		return t;
	}

}
