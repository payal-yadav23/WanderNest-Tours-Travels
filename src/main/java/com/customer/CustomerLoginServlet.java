package com.customer;

import java.io.IOException;

import com.dao.CustomerDAO;
import com.model.Customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginCustomer")
public class CustomerLoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		CustomerDAO dao = new CustomerDAO();
		try {
			Customer c = dao.login(email, password);
			if (c != null) {
				HttpSession session = req.getSession();
				session.setAttribute("customer", c);
				resp.sendRedirect("customerdashboard"); 
			} else {
				resp.sendRedirect("customer-login.jsp?error=invalid");
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}
