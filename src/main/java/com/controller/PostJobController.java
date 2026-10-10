package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DAO.JobDAO;
import com.model.JobModel;

@SuppressWarnings("serial")
@WebServlet("/PostJobController")
public class PostJobController extends HttpServlet {
//	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String title = request.getParameter("title");
		String company = request.getParameter("company");
		String location = request.getParameter("location");
		String description = request.getParameter("description");
		String skills = request.getParameter("skills");
		double salary = Double.parseDouble(request.getParameter("salary"));
		String jobType = request.getParameter("jobType");
		String username = (String) request.getSession().getAttribute("username");

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
			System.out.println("Inserted failed!!");
		}

	}

}
