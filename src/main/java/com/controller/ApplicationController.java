package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.DAO.ApplicationDAO;
import com.model.ApplicationModel;

@MultipartConfig
@SuppressWarnings("serial")
@WebServlet("/ApplicationController")
public class ApplicationController extends HttpServlet {
//	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("jobId"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		Part resumePart = request.getPart("resume");

		String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

		File uploadDir = new File(uploadPath);

		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}

		String fileName = resumePart.getSubmittedFileName();

		String filePath = uploadPath + File.separator + fileName;

		resumePart.write(filePath);

		String resume = "uploads/" + fileName;
		String username = (String) request.getSession().getAttribute("username");

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
		} else {

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

}
