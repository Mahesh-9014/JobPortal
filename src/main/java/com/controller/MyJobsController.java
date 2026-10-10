package com.controller;

import java.io.IOException;
import java.util.List;

import com.DAO.JobDAO;
import com.model.JobModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/MyJobsController")
public class MyJobsController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = (String) request.getSession().getAttribute("username");

        JobDAO jd = new JobDAO();
        List<JobModel> list = jd.getJobsByUsername(username);

        request.setAttribute("list", list);

        RequestDispatcher rd = request.getRequestDispatcher("myJobs.jsp");
        rd.forward(request, response);
    }
}