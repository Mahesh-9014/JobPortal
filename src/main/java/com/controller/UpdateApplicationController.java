package com.controller;

import java.io.IOException;

import com.DAO.ApplicationDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/UpdateApplicationController")
public class UpdateApplicationController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("username") == null
				|| !"RECRUITER".equals(session.getAttribute("role"))) {

			response.sendRedirect("login.jsp");
			return;
		}

		String applicationIdParam = request.getParameter("applicationId");
		String status = request.getParameter("status");

		int applicationId;

		try {
			applicationId = Integer.parseInt(applicationIdParam);
		} catch (NumberFormatException | NullPointerException e) {
			response.sendRedirect("RecruiterApplicationsController");
			return;
		}

		if (!"Accepted".equals(status) && !"Rejected".equals(status)) {
			response.sendRedirect("RecruiterApplicationsController");
			return;
		}

		ApplicationDAO ad = new ApplicationDAO();
		boolean result = ad.updateApplicationStatus(applicationId, status);

		if (result) {
			response.sendRedirect("RecruiterApplicationsController");
		} else {
			response.sendRedirect("RecruiterApplicationsController?error=true");
		}
	}
}