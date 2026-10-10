package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DAO.UserDAO;

@SuppressWarnings("serial")
@WebServlet("/EditController")
public class EditController extends HttpServlet {
//	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = (String) request.getSession().getAttribute("username");
		System.out.println(username);
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");

		if (!password.equals(confirmPassword)) {
			request.setAttribute("error", "Passwords do not match");

			RequestDispatcher rd = request.getRequestDispatcher("editProfile.jsp");
			rd.forward(request, response);
			return;
		}

		UserDAO ud = new UserDAO();
		boolean status = ud.updatePassword(username, password);

		if (status) {

			String role = (String) request.getSession().getAttribute("role");

			if ("RECRUITER".equals(role)) {
				response.sendRedirect("recruiterHome.jsp");
			} else {
				response.sendRedirect("HomeController");
			}

		} else {
			RequestDispatcher rd = request.getRequestDispatcher("updateFailure.jsp");
			rd.forward(request, response);
		}
	}

}
