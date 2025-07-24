package com.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/submit")
public class Register extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String fname = req.getParameter("fullname");
		String email = req.getParameter("email");
		String pass = req.getParameter("password");
		String gender = req.getParameter("gender");

		resp.setContentType("text/html");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/WanderNest", "root", "Payal@123");
			PreparedStatement ps = c
					.prepareStatement("INSERT INTO travel(fullname, email, password, gender) VALUES(? ,?, ?, ?)");
			ps.setString(1, fname);
			ps.setString(2, email);
			ps.setString(3, pass);
			ps.setString(4, gender);
			int ok = ps.executeUpdate();
			if (ok > 0) {
				req.setAttribute("message", "✅ Registration Successful!");
				RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
			} else {
				PrintWriter out = resp.getWriter();
				out.print("<h3 style='color: red; font-weight: bold;'>❌ Registration Failed!</h3>");
				RequestDispatcher rd = req.getRequestDispatcher("register.html");
				rd.include(req, resp);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
