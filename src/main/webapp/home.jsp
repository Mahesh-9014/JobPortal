<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.model.JobModel"%>

<%
String username = (String) session.getAttribute("username");

if (username == null) {
	RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
	rd.forward(request, response);
	return;
}
@SuppressWarnings("unchecked")
List<JobModel> list = (List<JobModel>) request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Home</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	margin: 0;
	background: #f5f7fb;
	font-family: Arial, sans-serif;
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

.hero {
	background: linear-gradient(135deg, #4b49c6, #7b68ee);
	color: white;
	padding: 80px 20px;
}

.hero h1 {
	font-size: 45px;
	font-weight: bold;
}

.hero p {
	font-size: 18px;
}

.search-box {
	background: white;
	padding: 20px;
	border-radius: 12px;
	margin-top: 30px;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
}

.section-title {
	font-weight: bold;
	margin-bottom: 30px;
}

.feature-card {
	border: none;
	border-radius: 12px;
	padding: 25px;
	height: 100%;
	box-shadow: 0 3px 15px rgba(0, 0, 0, 0.08);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	cursor: pointer;
}

.feature-card:hover {
	transform: scale(1.05);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

.job-card {
	border: none;
	border-radius: 12px;
	padding: 20px;
	height: 100%;
	box-shadow: 0 3px 15px rgba(0, 0, 0, 0.08);
	background: white;
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
				data-bs-toggle="collapse" data-bs-target="#navbarMenu">

				<span class="navbar-toggler-icon"></span>

			</button>

			<div class="collapse navbar-collapse" id="navbarMenu">

				<ul class="navbar-nav ms-auto">

					<li class="nav-item"><a class="nav-link active"
						href="HomeController"> Home </a></li>

					<li class="nav-item"><a class="nav-link" href="JobsController">
							Find Jobs </a></li>

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

	<section class="hero text-center">

		<div class="container">

			<h1>Find Your Dream Job</h1>

			<p class="mt-3">Discover the right opportunities and build your
				career with our Online Job Portal.</p>

			<form action="SearchJobController" method="get">

				<div class="search-box">

					<div class="row g-3">

						<div class="col-md-5">

							<input type="text" class="form-control" name="title"
								placeholder="Job title or keyword">

						</div>

						<div class="col-md-4">

							<input type="text" class="form-control" name="location"
								placeholder="Location">

						</div>

						<div class="col-md-3">

							<button type="submit" class="btn btn-primary w-100">
								Search Jobs</button>

						</div>

					</div>

				</div>

			</form>

		</div>

	</section>

	<section class="container mt-5">

		<h2 class="section-title">

			Welcome,
			<%=username%>
			👋

		</h2>

		<p>Explore job opportunities, apply for suitable positions, and
			track your applications from one place.</p>

	</section>

	<section class="container mt-5">

		<h2 class="section-title text-center">Why Use Our Job Portal?</h2>

		<div class="row g-4">

			<div class="col-md-4">

				<div class="feature-card text-center" data-bs-toggle="modal"
					data-bs-target="#findJobsModal">

					<h4>Find Jobs</h4>

					<p class="mt-3">Search and explore job opportunities based on
						your skills and interests.</p>

				</div>

			</div>


			<div class="col-md-4">

				<div class="feature-card text-center" data-bs-toggle="modal"
					data-bs-target="#easyApplicationModal">

					<h4>Easy Application</h4>

					<p class="mt-3">Apply for jobs quickly and easily with your
						details.</p>

				</div>

			</div>


			<div class="col-md-4">

				<div class="feature-card text-center">

					<h4>Track Applications</h4>

					<p class="mt-3">Keep track of your job applications and their
						current status.</p>

				</div>

			</div>

		</div>

	</section>

	<section class="container mt-5">

		<h2 class="section-title text-center">Latest Job Opportunities</h2>

		<div class="row g-4">

			<%
			if (list != null && !list.isEmpty()) {

				for (JobModel j : list) {
			%>

			<div class="col-md-4">

				<div class="job-card">

					<h4>
						<%=j.getTitle()%>
					</h4>

					<p class="text-muted">

						<strong>Company:</strong>
						<%=j.getCompany()%>

					</p>

					<p>

						<strong>Location:</strong>
						<%=j.getLocation()%>

					</p>

					<p>

						<strong>Skills:</strong>
						<%=j.getSkills()%>

					</p>

					<p>

						<strong>Salary:</strong> ₹<%=j.getSalary()%>

					</p>

					<p>

						<strong>Job Type:</strong>
						<%=j.getJobType()%>

					</p>

					<a href="JobDetailsController?jobId=<%=j.getJobId()%>"
						class="btn btn-outline-primary"> View Job </a>

				</div>

			</div>

			<%
			}

			} else {
			%>

			<div class="col-12 text-center">

				<p class="text-muted">No jobs available at the moment.</p>

			</div>

			<%
			}
			%>

		</div>

	</section>

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

						<li><a href="HomeController"> Home </a></li>

						<li><a href="JobController"> Find Jobs </a></li>

						<li><a href="ApplicationsController"> Applications </a></li>

						<li><a href="ProfileController"> Profile </a></li>

					</ul>

				</div>

				<div class="col-lg-2 col-md-6">

					<h5 class="footer-title">Job Seekers</h5>

					<ul class="footer-links">

						<li><a href="JobController"> Browse Jobs </a></li>

						<li><a href="ApplicationsController"> My Applications </a></li>

						<li><a href="ProfileController"> My Profile </a></li>

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