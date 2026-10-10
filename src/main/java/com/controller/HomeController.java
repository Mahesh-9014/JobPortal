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
@WebServlet("/HomeController")
public class HomeController extends HttpServlet {
//	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		System.out.println("HomeController Session Username : "
//		        + request.getSession().getAttribute("username"));

		JobDAO jd = new JobDAO();
		List<JobModel> list = jd.getJobDetails();
//		System.out.println("Job List Size : " + list.size());

		request.setAttribute("list", list);

		RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
		rd.forward(request, response);

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		JobDAO jd = new JobDAO();
		List<JobModel> list = jd.getJobDetails();

		request.setAttribute("list", list);

		RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
		rd.forward(request, response);
	}

}
