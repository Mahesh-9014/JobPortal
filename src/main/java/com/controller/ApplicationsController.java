package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.DAO.ApplicationDAO;
import com.model.ApplicationModel;

@SuppressWarnings("serial")
@WebServlet("/ApplicationsController")
public class ApplicationsController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("username") == null
				|| !"JOB SEEKER".equals(session.getAttribute("role"))) {

			response.sendRedirect("login.jsp");
			return;
		}

		String username = (String) session.getAttribute("username");

		ApplicationDAO ad = new ApplicationDAO();

		List<ApplicationModel> list = ad.getApplicationsByUsername(username);

		request.setAttribute("list", list);

		RequestDispatcher rd = request.getRequestDispatcher("applications.jsp");

		rd.forward(request, response);
	}
}