package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DAO.UserDAO;

@SuppressWarnings("serial")
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
//	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		if (username == null || username.trim().isEmpty()) {
			request.setAttribute("error", "Username is required.");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}

		if (password == null || password.isEmpty()) {
			request.setAttribute("error", "Password is required.");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}

		UserDAO ud = new UserDAO();
		boolean status = ud.loginUser(username, password);

		if (status) {

			String role = ud.getUserRole(username);

			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("role", role);

			if (role.equals("RECRUITER")) {
				response.sendRedirect("recruiterHome.jsp");
			} else {
				response.sendRedirect("HomeController");
			}
		} else {
			request.setAttribute("error", "Invalid credentials");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
	}

}
