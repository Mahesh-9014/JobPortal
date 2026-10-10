<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.model.JobModel"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Jobs</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f5f7fb;
}

.job-card {
	background: #ffffff;
	border: none;
	border-radius: 12px;
	padding: 25px;
	margin-bottom: 20px;
	box-shadow: 0 3px 12px rgba(0, 0, 0, 0.08);
}

.job-title {
	color: #4f46e5;
	font-weight: 700;
}

.job-label {
	font-weight: 600;
	color: #343a40;
}

.job-value {
	color: #6c757d;
}
</style>

</head>

<body>

	<%
	String username = (String) session.getAttribute("username");
	String role = (String) session.getAttribute("role");

	if (username == null || !"RECRUITER".equals(role)) {
		response.sendRedirect("login.jsp");
		return;
	}

	@SuppressWarnings("unchecked")
	List<JobModel> list = (List<JobModel>) request.getAttribute("list");
	%>

	<div class="container mt-5">

		<h2 class="mb-4 text-center">My Jobs</h2>

		<%
		if (list != null && !list.isEmpty()) {

			for (JobModel j : list) {
		%>

		<div class="job-card">

			<h4 class="job-title">
				<%=j.getTitle()%>
			</h4>

			<p>
				<span class="job-label">Company:</span> <span class="job-value"><%=j.getCompany()%></span>
			</p>

			<p>
				<span class="job-label">Location:</span> <span class="job-value"><%=j.getLocation()%></span>
			</p>

			<p>
				<span class="job-label">Salary:</span> <span class="job-value"><%=j.getSalary()%>
					LPA</span>
			</p>

			<p>
				<span class="job-label">Job Type:</span> <span class="job-value"><%=j.getJobType()%></span>
			</p>

			<p>
				<span class="job-label">Description:</span> <span class="job-value"><%=j.getDescription()%></span>
			</p>

			<p>
				<span class="job-label">Skills:</span> <span class="job-value"><%=j.getSkills()%></span>
			</p>

		</div>

		<%
		}

		} else {
		%>

		<div class="alert alert-info">You have not posted any jobs yet.
		</div>

		<%
		}
		%>

	</div>

</body>
</html>