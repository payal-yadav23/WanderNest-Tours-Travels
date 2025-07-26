package com.agent;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/agentLogin")
public class AgentLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		String pass = req.getParameter("password");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/wandernest", "root", "Payal@123");

			PreparedStatement ps = c.prepareStatement("SELECT * FROM agent WHERE email = ? AND password = ?");
			ps.setString(1, email);
			ps.setString(2, pass);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				// ✅ Agent authenticated
				HttpSession session = req.getSession();
				session.setAttribute("agentEmail", email); // store session info
				session.setAttribute("message", "Login successful!");
				resp.sendRedirect("agentdashboard");
			} else {
				req.setAttribute("error", "Invalid email or password!");
				req.getRequestDispatcher("agent-login.jsp").forward(req, resp);
			}

			c.close();

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Server error during login!");
			req.getRequestDispatcher("agent-login.jsp").forward(req, resp);
		}
	}
}
