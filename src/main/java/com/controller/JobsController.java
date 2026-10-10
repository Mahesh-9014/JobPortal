package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.DAO.JobDAO;
import com.model.JobModel;

@SuppressWarnings("serial")
@WebServlet("/JobsController")
public class JobsController extends HttpServlet {
//	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Job Controller!!!");

		JobDAO jd = new JobDAO();
		List<JobModel> list = jd.getJobDetails();
		request.setAttribute("list", list);

		RequestDispatcher rd = request.getRequestDispatcher("jobs.jsp");
		rd.forward(request, response);
	}

}
