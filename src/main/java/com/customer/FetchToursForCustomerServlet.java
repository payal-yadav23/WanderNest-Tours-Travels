package com.customer;

import java.io.IOException;
import java.util.List;

import com.dao.TourDao;
import com.model.Tour;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/customerdashboard")
public class FetchToursForCustomerServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			List<Tour> tours = TourDao.fetchAllTours(); // ✅ fix method call

			req.setAttribute("bookingList", tours); // or rename to "toursList"
			RequestDispatcher rd = req.getRequestDispatcher("customer-dashboard.jsp");
			rd.forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect("error.jsp");
		}

	}
}
