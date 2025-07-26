package com.homepage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
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

@WebServlet("/agentdashboard")
public class HomeServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		List<Tour> tourList = new ArrayList<>();

		try {
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
				tourList.add(t);
			}

			// Set data in request scope and forward to welcome.jsp
			req.setAttribute("tourList", tourList);
			req.getRequestDispatcher("welcome.jsp").forward(req, resp);

			c.close();
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Unable to load tour data.");
			req.getRequestDispatcher("welcome.jsp").forward(req, resp);
		}
	}
}
