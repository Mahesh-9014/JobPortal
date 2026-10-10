<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String username = (String) session.getAttribute("username");
String role = (String) session.getAttribute("role");

if (username == null || !"RECRUITER".equals(role)) {
	response.sendRedirect("login.jsp");
	return;
}
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Recruiter Home</title>

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

.welcome-section {
	padding: 70px 20px 50px;
	text-align: center;
}

.welcome-section h1 {
	color: #212529;
	font-size: 38px;
	font-weight: 700;
	margin-bottom: 12px;
}

.welcome-section h1 span {
	color: #4f46e5;
}

.welcome-section p {
	color: #6c757d;
	font-size: 17px;
	margin-bottom: 0;
}

.dashboard-section {
	padding: 10px 15px 60px;
}

.dashboard-card {
	background: #ffffff;
	border: none;
	border-radius: 15px;
	padding: 30px;
	height: 100%;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.dashboard-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 28px rgba(0, 0, 0, 0.12);
}

.dashboard-icon {
	width: 60px;
	height: 60px;
	border-radius: 12px;
	background: #eef2ff;
	color: #4f46e5;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 27px;
	margin-bottom: 20px;
}

.dashboard-card h4 {
	color: #212529;
	font-size: 20px;
	font-weight: 700;
	margin-bottom: 10px;
}

.dashboard-card p {
	color: #6c757d;
	font-size: 14px;
	line-height: 1.6;
	margin-bottom: 22px;
}

.btn-primary-custom {
	background: #4f46e5;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 8px;
	font-weight: 500;
	text-decoration: none;
	display: inline-block;
}

.btn-primary-custom:hover {
	background: #4338ca;
	color: white;
}

.btn-outline-custom {
	background: white;
	color: #4f46e5;
	border: 1px solid #4f46e5;
	padding: 10px 20px;
	border-radius: 8px;
	font-weight: 500;
	text-decoration: none;
	display: inline-block;
}

.btn-outline-custom:hover {
	background: #4f46e5;
	color: white;
}

footer {
	background: #ffffff;
	color: #495057;
	padding-top: 45px;
	margin-top: 20px;
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

			<a class="navbar-brand" href="recruiterHome.jsp"> JOB PORTAL </a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarMenu"
				aria-controls="navbarMenu" aria-expanded="false"
				aria-label="Toggle navigation">

				<span class="navbar-toggler-icon"></span>

			</button>

			<div class="collapse navbar-collapse" id="navbarMenu">

				<ul class="navbar-nav ms-auto">

					<li class="nav-item"><a class="nav-link active"
						href="recruiterHome.jsp"> Home </a></li>

					<li class="nav-item"><a class="nav-link" href="postJob.jsp">
							Post Job </a></li>

					<li class="nav-item"><a class="nav-link"
						href="MyJobsController"> My Jobs </a></li>

					<li class="nav-item"><a class="nav-link"
						href="RecruiterApplicationsController"> Applications </a></li>

					<li class="nav-item"><a class="nav-link"
						href="ProfileController"> Profile </a></li>

					<li class="nav-item"><a class="nav-link"
						href="LogoutController"> Logout </a></li>

				</ul>

			</div>

		</div>

	</nav>


	<section class="welcome-section">
	
		<div class="container">

			<h1>
				Welcome, <span><%=username%></span>
			</h1>

			<p>Manage your job postings and connect with talented candidates.
			</p>

		</div>

	</section>


	<section class="dashboard-section">

		<div class="container">

			<div class="row g-4">


				<div class="col-md-6 col-lg-4">

					<div class="dashboard-card">

						<div class="dashboard-icon">+</div>

						<h4>Post a Job</h4>

						<p>Create and publish new job opportunities for qualified
							candidates.</p>

						<a href="postJob.jsp" class="btn-primary-custom"> Post Job </a>

					</div>

				</div>


				<div class="col-md-6 col-lg-4">

					<div class="dashboard-card">

						<div class="dashboard-icon">💼</div>

						<h4>My Jobs</h4>

						<p>View and manage the job openings you have posted on the
							portal.</p>

						<a href="MyJobsController" class="btn-outline-custom"> View
							Jobs </a>

					</div>

				</div>


				<div class="col-md-6 col-lg-4">

					<div class="dashboard-card">

						<div class="dashboard-icon">📄</div>

						<h4>Applications</h4>

						<p>Review applications submitted by candidates for your job
							postings.</p>

						<a href="RecruiterApplicationsController"
							class="btn-outline-custom"> View Applications </a>

					</div>

				</div>


				<div class="col-md-6 col-lg-4">

					<div class="dashboard-card">

						<div class="dashboard-icon">👤</div>

						<h4>My Profile</h4>

						<p>View and manage your recruiter profile information.</p>

						<a href="ProfileController" class="btn-outline-custom"> View
							Profile </a>

					</div>

				</div>

			</div>

		</div>

	</section>


	<footer>

		<div class="container">

			<div class="row g-4">

				<div class="col-lg-5 col-md-6">

					<div class="footer-brand">JOB PORTAL</div>

					<p class="footer-description">Find the right opportunities,
						connect with employers, and build meaningful careers with our
						online job portal.</p>

				</div>


				<div class="col-lg-2 col-md-6">

					<h5 class="footer-title">Recruiter</h5>

					<ul class="footer-links">

						<li><a href="recruiterHome.jsp"> Home </a></li>

						<li><a href="postJob.jsp"> Post Job </a></li>

						<li><a href="MyJobsController"> My Jobs </a></li>

						<li><a href="RecruiterApplicationsController">
								Applications </a></li>

					</ul>

				</div>


				<div class="col-lg-2 col-md-6">

					<h5 class="footer-title">Account</h5>

					<ul class="footer-links">

						<li><a href="ProfileController"> Profile </a></li>

						<li><a href="LogoutController"> Logout </a></li>

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
