package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.DAO.ApplicationDAO;
import com.model.ApplicationModel;

@MultipartConfig
@SuppressWarnings("serial")
@WebServlet("/ApplicationController")
public class ApplicationController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("username") == null
				|| !"JOB SEEKER".equals(session.getAttribute("role"))) {

			response.sendRedirect("login.jsp");
			return;
		}

		String username = (String) session.getAttribute("username");

		int id;

		try {
			id = Integer.parseInt(request.getParameter("jobId"));
		} catch (NumberFormatException | NullPointerException e) {
			response.sendRedirect("JobsController");
			return;
		}

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		Part resumePart = request.getPart("resume");

		if (resumePart == null || resumePart.getSize() == 0 || resumePart.getSubmittedFileName() == null
				|| resumePart.getSubmittedFileName().trim().isEmpty()) {

			request.setAttribute("message", "Please select a resume file.");

			RequestDispatcher rd = request.getRequestDispatcher("ApplicationFailure.jsp");
			rd.forward(request, response);
			return;
		}

		String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

		File uploadDir = new File(uploadPath);

		if (!uploadDir.exists() && !uploadDir.mkdirs()) {
			throw new ServletException("Could not create uploads directory.");
		}

		String fileName = new File(resumePart.getSubmittedFileName()).getName();

		String filePath = uploadPath + File.separator + fileName;

		resumePart.write(filePath);

		String resume = "uploads/" + fileName;

		ApplicationModel am = new ApplicationModel();

		am.setJobId(id);
		am.setName(name);
		am.setEmail(email);
		am.setPhone(phone);
		am.setResume(resume);
		am.setUsername(username);

		ApplicationDAO ad = new ApplicationDAO();

		boolean alreadyApplied = ad.checkApplication(id, username);

		if (alreadyApplied) {
			request.setAttribute("message", "You have already applied for this job.");

			RequestDispatcher rd = request.getRequestDispatcher("alreadyApplied.jsp");
			rd.forward(request, response);

			return;
		}

		boolean status = ad.applyJob(am);

		if (status) {
			request.setAttribute("message", "Applied Successfully.");

			RequestDispatcher rd = request.getRequestDispatcher("ApplicationSuccess.jsp");
			rd.forward(request, response);

		} else {
			request.setAttribute("message", "Application Failed.");

			RequestDispatcher rd = request.getRequestDispatcher("ApplicationFailure.jsp");
			rd.forward(request, response);
		}
	}
}