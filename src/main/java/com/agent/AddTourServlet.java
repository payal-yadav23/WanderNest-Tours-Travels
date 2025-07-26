package com.agent;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Tour;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addtour")
public class AddTourServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String pName = req.getParameter("packageName");
		String pType = req.getParameter("packageType");
		String location = req.getParameter("packageLocation");
		String price = req.getParameter("packagePrice");
		int cost = Integer.parseInt(price);
		String time = req.getParameter("duration");
		int duration = Integer.parseInt(time);
		String seat = req.getParameter("seats");
		int seat1 = Integer.parseInt(seat);
		String status = req.getParameter("packagestatus");
		String feature = req.getParameter("features");
		String detail = req.getParameter("details");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/wandernest", "root", "Payal@123");
			PreparedStatement ps = c.prepareStatement(
					"INSERT INTO tour_packages(package_name, package_type, package_location, package_price, duration, seats, package_status, features, details) VALUES(?, ?, ?, ?, ?, ?, ?, ?,?)");

			ps.setString(1, pName);
			ps.setString(2, pType);
			ps.setString(3, location);
			ps.setInt(4, cost);
			ps.setInt(5, duration);
			ps.setInt(6, seat1);
			ps.setString(7, status);
			ps.setString(8, feature);
			ps.setString(9, detail);

			ps.executeUpdate();

			HttpSession session = req.getSession();
			session.setAttribute("message", "Tour package added successfully!");
			resp.sendRedirect("agentdashboard");

			c.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
