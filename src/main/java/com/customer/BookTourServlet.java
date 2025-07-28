package com.customer;

import java.io.IOException;

import com.dao.TourDao;
import com.model.Customer;
import com.model.Tour;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/booktour")
public class BookTourServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String tourName = req.getParameter("tourName");

			Tour tour = TourDao.getTourByName(tourName); // You must have this method in TourDao

			HttpSession session = req.getSession(false);
			if (session == null || session.getAttribute("customer") == null) {
				resp.sendRedirect("customer-login.jsp");
				return;
			}

			Customer customer = (Customer) session.getAttribute("customer");

			// Optional: You can store booking in DB here.

			// Set attributes to show in JSP
			req.setAttribute("tour", tour);
			req.setAttribute("customer", customer);

			RequestDispatcher rd = req.getRequestDispatcher("booking-confirmation.jsp");
			rd.forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect("error.jsp");
		}
	}
}
