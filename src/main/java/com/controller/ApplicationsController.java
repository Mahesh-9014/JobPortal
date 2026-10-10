package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.DAO.ApplicationDAO;
import com.model.ApplicationModel;

@SuppressWarnings("serial")
@WebServlet("/ApplicationsController")
public class ApplicationsController extends HttpServlet {
//	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = (String) request.getSession().getAttribute("username");

		ApplicationDAO ad = new ApplicationDAO();
		List<ApplicationModel> list = ad.getApplicationsByUsername(username);
		request.setAttribute("list", list);

		RequestDispatcher rd = request.getRequestDispatcher("applications.jsp");
		rd.forward(request, response);
	}

}
