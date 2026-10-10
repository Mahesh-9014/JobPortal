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
@WebServlet("/SearchJobController")
public class SearchJobController extends HttpServlet {
//	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String title = request.getParameter("title");
		String location = request.getParameter("location");

		JobDAO jd = new JobDAO();
		List<JobModel> list = jd.searchJobs(title, location);
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("jobs.jsp");
		rd.forward(request, response);

	}

}
