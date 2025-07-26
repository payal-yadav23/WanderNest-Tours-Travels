package com.agent;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deletetour")
public class DeleteTour extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String packageName = request.getParameter("packageName");

		if (packageName != null && !packageName.isEmpty()) {
			try {
				// DB Connection
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wandernest", "root", "Payal@123");

				String sql = "DELETE FROM tour_packages WHERE package_name = ?";
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, packageName);

				int rows = stmt.executeUpdate();

				stmt.close();
				conn.close();

				if (rows > 0) {
					request.setAttribute("message", "Tour deleted successfully.");
				} else {
					request.setAttribute("message", "Tour not found.");
				}

			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("message", "Error deleting tour.");
			}
		} else {
			request.setAttribute("message", "Invalid package name.");
		}

		request.getRequestDispatcher("agentdashboard").forward(request, response);
	}
}
