package com.agent;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/agentRegister")
public class AgentRegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String fName = req.getParameter("fullname");
		String aName = req.getParameter("agencyName");
		String user = req.getParameter("username");
		String mobNo = req.getParameter("mobNo");
		String email = req.getParameter("email");
		String pass = req.getParameter("password");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/wandernest", "root", "Payal@123");
			PreparedStatement ps = c.prepareStatement(
					"INSERT INTO agent(fullname, agency_name, username, contact_no, email, password) VALUES(?, ?, ?, ?, ?, ?)");
			ps.setString(1, fName);
			ps.setString(2, aName);
			ps.setString(3, user);
			ps.setString(4, mobNo);
			ps.setString(5, email);
			ps.setString(6, pass);

			int check = ps.executeUpdate();
			c.close();

			if (check > 0) {
				req.setAttribute("successMsg", "Agent registered successfully!");
				RequestDispatcher rd = req.getRequestDispatcher("agent-login.jsp");
				rd.include(req, resp);

			} else {
				req.setAttribute("errorMsg", "Failed to register agent.");
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

}
