package com.controller;

import java.io.IOException;

import com.DAO.JobDAO;
import com.model.JobModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/PostJobController")
public class PostJobController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("username") == null
				|| !"RECRUITER".equals(session.getAttribute("role"))) {

			response.sendRedirect("login.jsp");
			return;
		}

		String title = request.getParameter("title");
		String company = request.getParameter("company");
		String location = request.getParameter("location");
		String description = request.getParameter("description");
		String skills = request.getParameter("skills");
		String jobType = request.getParameter("jobType");
		String username = (String) session.getAttribute("username");

		double salary;

		try {
			salary = Double.parseDouble(request.getParameter("salary"));

			if (!Double.isFinite(salary) || salary < 0) {
				response.sendRedirect("postJob.jsp");
				return;
			}
		} catch (NumberFormatException | NullPointerException e) {
			response.sendRedirect("postJob.jsp");
			return;
		}

		JobModel jm = new JobModel();
		jm.setTitle(title);
		jm.setCompany(company);
		jm.setLocation(location);
		jm.setDescription(description);
		jm.setSkills(skills);
		jm.setSalary(salary);
		jm.setJobType(jobType);
		jm.setUsername(username);

		JobDAO jd = new JobDAO();
		boolean status = jd.insertJob(jm);

		if (status) {
			response.sendRedirect("recruiterHome.jsp");
		} else {
			response.sendRedirect("postJob.jsp");
		}
	}
}