package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DAO.ApplicationDAO;

@SuppressWarnings("serial")
@WebServlet("/UpdateApplicationController")
public class UpdateApplicationController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int applicationId = Integer.parseInt(request.getParameter("applicationId"));

		String status = request.getParameter("status");

		ApplicationDAO ad = new ApplicationDAO();
		boolean result = ad.updateApplicationStatus(applicationId, status);

		if (result) {
			response.sendRedirect("RecruiterApplicationsController");
		} else {
			response.sendRedirect("RecruiterApplicationsController?error=true");
		}
	}
}
