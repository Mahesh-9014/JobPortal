<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.model.JobModel"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Available Jobs</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f5f7fb;
}

.navbar {
	background: #ffffff;
	padding: 14px 0;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
}

.navbar-brand {
	color: #4f46e5 !important;
	font-size: 23px;
	font-weight: 800;
	letter-spacing: 0.5px;
}

.navbar-brand:hover {
	color: #4338ca !important;
}

.navbar .nav-link {
	color: #212529 !important;
	font-weight: 500;
	padding: 8px 14px !important;
	margin: 0 3px;
}

.navbar .nav-link:hover {
	color: #4f46e5 !important;
}

.navbar .nav-link.active {
	color: #4f46e5 !important;
	font-weight: 700;
}

.navbar-toggler {
	border: 1px solid #dee2e6;
}

.navbar-toggler:focus {
	box-shadow: none;
}

.page-title {
	color: #343a40;
	font-weight: 700;
}

.job-card {
	border: none;
	border-radius: 15px;
	transition: 0.3s;
}

.job-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.12);
}

.job-title {
	color: #4f46e5;
	font-weight: 700;
}

.company {
	font-weight: 600;
	color: #343a40;
}

.job-info {
	color: #555;
}

.skill-badge {
	background: #eef2ff;
	color: #4f46e5;
	padding: 6px 10px;
	border-radius: 20px;
	display: inline-block;
	margin: 3px;
	font-size: 13px;
}

.salary {
	font-weight: 700;
	color: #198754;
}

.apply-btn {
	background: #4f46e5;
	color: white;
	border: none;
}

.apply-btn:hover {
	background: #4338ca;
	color: white;
}

footer {
	background: #ffffff;
	color: #495057;
	padding-top: 45px;
	margin-top: 60px;
	border-top: 1px solid #e9ecef;
}

.footer-brand {
	color: #4f46e5;
	font-size: 22px;
	font-weight: 800;
	margin-bottom: 12px;
}

.footer-description {
	color: #6c757d;
	font-size: 14px;
	line-height: 1.7;
	max-width: 350px;
}

.footer-title {
	color: #212529;
	font-size: 16px;
	font-weight: 700;
	margin-bottom: 16px;
}

.footer-links {
	list-style: none;
	padding: 0;
	margin: 0;
}

.footer-links li {
	margin-bottom: 10px;
}

.footer-links a {
	color: #6c757d;
	text-decoration: none;
	font-size: 14px;
}

.footer-links a:hover {
	color: #4f46e5;
}

.footer-contact {
	color: #6c757d;
	font-size: 14px;
	margin-bottom: 10px;
}

.footer-bottom {
	border-top: 1px solid #e9ecef;
	margin-top: 35px;
	padding: 18px 0;
	color: #6c757d;
	font-size: 13px;
}
</style>

</head>

<body>

	<nav class="navbar navbar-expand-lg">

		<div class="container-fluid px-4">

			<a class="navbar-brand" href="HomeController"> JOB PORTAL </a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarMenu"
				aria-controls="navbarMenu" aria-expanded="false"
				aria-label="Toggle navigation">

				<span class="navbar-toggler-icon"></span>

			</button>


			<div class="collapse navbar-collapse" id="navbarMenu">

				<ul class="navbar-nav ms-auto">

					<li class="nav-item"><a class="nav-link" href="HomeController">
							Home </a></li>

					<li class="nav-item"><a class="nav-link active"
						href="JobController"> Find Jobs </a></li>

					<li class="nav-item"><a class="nav-link"
						href="ApplicationsController"> Applications </a></li>

					<li class="nav-item"><a class="nav-link"
						href="ProfileController"> Profile </a></li>

					<li class="nav-item"><a class="nav-link"
						href="LogoutController"> Logout </a></li>

				</ul>

			</div>

		</div>

	</nav>

	<div class="container">

		<div class="text-center my-5">

			<h1 class="page-title">Available Jobs</h1>

			<p class="text-muted">Find the right opportunity for your career
			</p>

		</div>

		<div class="row g-4">

			<%
			@SuppressWarnings("unchecked")
			List<JobModel> list = (List<JobModel>) request.getAttribute("list");

			if (list != null && !list.isEmpty()) {

				for (JobModel j : list) {
			%>
			<div class="col-lg-6 col-md-6">

				<div class="card job-card h-100 shadow-sm">

					<div class="card-body p-4">

						<h4 class="job-title">
							<%=j.getTitle()%>
						</h4>

						<p class="company mb-2">

							🏢
							<%=j.getCompany()%>

						</p>

						<p class="job-info mb-2">

							📍
							<%=j.getLocation()%>

						</p>

						<span class="badge text-bg-primary mb-3"> <%=j.getJobType()%>

						</span>

						<p class="job-info">

							<strong>Description:</strong><br>

							<%=j.getDescription()%>

						</p>

						<p class="mb-2">

							<strong>Skills:</strong>

						</p>

						<div class="mb-3">

							<%
							String[] skills = j.getSkills().split(",");

							for (String skill : skills) {
							%>

							<span class="skill-badge"> <%=skill.trim()%>
							</span>

							<%
							}
							%>

						</div>

						<p class="salary">

							💰 Salary: ₹<%=j.getSalary()%>

						</p>

						<div class="d-grid">
							<a href="JobDetailsController?jobId=<%=j.getJobId()%>"
								class="btn apply-btn"> Apply Now </a>
						</div>


					</div>

				</div>

			</div>


			<%
			}

			} else {
			%>

			<div class="col-12">

				<div class="alert alert-warning text-center">No jobs are
					currently available.</div>

			</div>


			<%
			}
			%>

		</div>

	</div>

	<footer>

		<div class="container">

			<div class="row g-4">

				<div class="col-lg-5 col-md-6">

					<div class="footer-brand">JOB PORTAL</div>

					<p class="footer-description">Find the right opportunities,
						connect with employers, and take the next step in your career with
						our online job portal.</p>

				</div>


				<div class="col-lg-2 col-md-6">

					<h5 class="footer-title">Quick Links</h5>

					<ul class="footer-links">

						<li><a href="HomeController">Home</a></li>

						<li><a href="JobController">Find Jobs</a></li>

						<li><a href="ApplicationsController">Applications</a></li>

						<li><a href="ProfileController">Profile</a></li>

					</ul>

				</div>


				<div class="col-lg-2 col-md-6">

					<h5 class="footer-title">Job Seekers</h5>

					<ul class="footer-links">

						<li><a href="JobController">Browse Jobs</a></li>

						<li><a href="ApplicationsController">My Applications</a></li>

						<li><a href="ProfileController">My Profile</a></li>

					</ul>

				</div>


				<div class="col-lg-3 col-md-6">

					<h5 class="footer-title">Contact Us</h5>

					<p class="footer-contact">support@jobportal.com</p>

					<p class="footer-contact">+91 98765 43210</p>

					<p class="footer-contact">Hyderabad, India</p>

				</div>

			</div>


			<div class="footer-bottom text-center">© 2026 JOB PORTAL. All
				rights reserved.</div>

		</div>

	</footer>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
		
	</script>

</body>

</html>