package com.controller;

import java.io.IOException;
import java.util.List;

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
@WebServlet("/JobsController")
public class JobsController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("username") == null
				|| !"JOB SEEKER".equals(session.getAttribute("role"))) {

			response.sendRedirect("login.jsp");
			return;
		}

		JobDAO jd = new JobDAO();
		List<JobModel> list = jd.getJobDetails();

		request.setAttribute("list", list);

		RequestDispatcher rd = request.getRequestDispatcher("jobs.jsp");
		rd.forward(request, response);
	}
}