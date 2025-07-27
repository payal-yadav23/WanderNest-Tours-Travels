package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
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
}
