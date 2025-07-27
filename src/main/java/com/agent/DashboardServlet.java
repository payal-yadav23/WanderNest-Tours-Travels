package com.agent;

import java.io.IOException;
import java.util.List;

import com.dao.TourDao;
import com.model.Tour;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/agentdashboard")
public class DashboardServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			List<Tour> tourList = TourDao.fetchAllTours();
			req.setAttribute("tourList", tourList);

			HttpSession session = req.getSession();
			String msg = (String) session.getAttribute("message");
			if (msg != null) {
				req.setAttribute("message", msg);
				session.removeAttribute("message");
			}

			req.getRequestDispatcher("agent-dashboard.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("message", "Error loading dashboard.");
			req.getRequestDispatcher("agent-dashboard.jsp").forward(req, resp);
		}
	}
}
