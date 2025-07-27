package com.customer;

import java.io.IOException;

import com.dao.CustomerDAO;
import com.model.Customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/registerCustomer")
public class CustomerRegisterServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("fullName");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String gender = req.getParameter("gender");

		Customer c = new Customer();
		c.setFullName(name);
		c.setEmail(email);
		c.setPassword(password);
		c.setGender(gender);

		CustomerDAO dao = new CustomerDAO();
		try {
			if (dao.registerCustomer(c)) {
				resp.sendRedirect("customer-login.jsp?msg=registered");
			} else {
				resp.sendRedirect("customer-register.jsp?msg=error");
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}
