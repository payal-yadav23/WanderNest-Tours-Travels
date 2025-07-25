package com.agent;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/agent-register")
public class AgentRegisterFormServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int nextId = 1;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wandernest", "root", "Payal@123");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT MAX(agent_id) FROM agent");
			if (rs.next()) {
				nextId = rs.getInt(1) + 1;
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		req.setAttribute("nextAgentId", nextId);
		req.getRequestDispatcher("agent-register.jsp").forward(req, resp);
	}

}
