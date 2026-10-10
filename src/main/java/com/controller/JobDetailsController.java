package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DAO.JobDAO;
import com.model.JobModel;

@SuppressWarnings("serial")
@WebServlet("/JobDetailsController")
public class JobDetailsController extends HttpServlet {
//	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int jobId = Integer.parseInt(request.getParameter("jobId"));

		JobDAO jd = new JobDAO();
		JobModel jm = jd.getJobById(jobId);

		request.setAttribute("job", jm);

		RequestDispatcher rd = request.getRequestDispatcher("jobDetails.jsp");
		rd.forward(request, response);
	}

}
