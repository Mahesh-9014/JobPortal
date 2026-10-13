package com.controller;

import java.io.IOException;

import com.DAO.JobDAO;
import com.model.JobModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/JobDetailsController")
public class JobDetailsController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("username") == null
				|| !"JOB SEEKER".equals(session.getAttribute("role"))) {

			response.sendRedirect("login.jsp");
			return;
		}

		int jobId;

		try {
			jobId = Integer.parseInt(request.getParameter("jobId"));
		} catch (NumberFormatException | NullPointerException e) {
			response.sendRedirect("HomeController");
			return;
		}

		JobDAO jd = new JobDAO();
		JobModel jm = jd.getJobById(jobId);

		if (jm == null) {
			response.sendRedirect("HomeController");
			return;
		}

		request.setAttribute("job", jm);

		RequestDispatcher rd = request.getRequestDispatcher("jobDetails.jsp");
		rd.forward(request, response);
	}
}