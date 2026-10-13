package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DAO.UserDAO;
import com.model.UserModel;

@SuppressWarnings("serial")
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
//	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		String confirmPassword = request.getParameter("confirmPassword");

		if (username == null || username.trim().length() < 3) {
			request.setAttribute("error", "Username must contain at least 3 characters.");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		}

		if (password == null || password.length() < 8) {
			request.setAttribute("error", "Password must contain at least 8 characters.");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		}

		if (confirmPassword == null || !password.equals(confirmPassword)) {
			request.setAttribute("error", "Passwords do not match.");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		}

		if (role == null || (!role.equals("JOB SEEKER") && !role.equals("RECRUITER"))) {
			request.setAttribute("error", "Please select a valid role.");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		}

		UserModel um = new UserModel();
		um.setUsername(username);
		um.setPassword(password);
		um.setRole(role);

		UserDAO ud = new UserDAO();
		boolean status = ud.registerUser(um);

		if (status) {
			request.setAttribute("success", "Registration successful! Please login");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("error", "Registration failed. Username may already exist.");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
	}

}
