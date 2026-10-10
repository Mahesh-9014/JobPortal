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
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Post Job</title>

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

.page-section {
	padding: 60px 15px;
}

.page-title {
	color: #212529;
	font-size: 32px;
	font-weight: 700;
	margin-bottom: 8px;
}

.page-description {
	color: #6c757d;
	font-size: 15px;
	margin-bottom: 35px;
}

.form-card {
	background: #ffffff;
	border: none;
	border-radius: 15px;
	padding: 35px;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
}

.form-label {
	color: #212529;
	font-weight: 600;
	font-size: 14px;
	margin-bottom: 8px;
}

.form-control, .form-select {
	border: 1px solid #dee2e6;
	border-radius: 8px;
	padding: 11px 13px;
	font-size: 14px;
}

.form-control:focus, .form-select:focus {
	border-color: #4f46e5;
	box-shadow: 0 0 0 0.2rem rgba(79, 70, 229, 0.15);
}

textarea.form-control {
	min-height: 120px;
	resize: vertical;
}

.btn-primary-custom {
	background: #4f46e5;
	color: #ffffff;
	border: none;
	padding: 11px 25px;
	border-radius: 8px;
	font-weight: 500;
}

.btn-primary-custom:hover {
	background: #4338ca;
	color: #ffffff;
}

.btn-outline-custom {
	background: #ffffff;
	color: #4f46e5;
	border: 1px solid #4f46e5;
	padding: 11px 25px;
	border-radius: 8px;
	font-weight: 500;
}

.btn-outline-custom:hover {
	background: #4f46e5;
	color: #ffffff;
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

					<li class="nav-item"><a class="nav-link"
						href="recruiterHome.jsp"> Home </a></li>

					<li class="nav-item"><a class="nav-link active"
						href="postJob.jsp"> Post Job </a></li>

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

	<section class="page-section">

		<div class="container">

			<div class="text-center">

				<h1 class="page-title">Post a Job</h1>

				<p class="page-description">Create a new job posting and connect
					with talented candidates.</p>

			</div>


			<div class="row justify-content-center">

				<div class="col-lg-8 col-md-10">

					<div class="form-card">

						<form action="PostJobController" method="post">

							<div class="mb-4">

								<label for="title" class="form-label"> Job Title </label> <input
									type="text" class="form-control" id="title" name="title"
									placeholder="Enter job title" required>

							</div>

							<div class="mb-4">

								<label for="company" class="form-label"> Company </label> <input
									type="text" class="form-control" id="company" name="company"
									placeholder="Enter company name" required>

							</div>

							<div class="mb-4">

								<label for="location" class="form-label"> Location </label> <input
									type="text" class="form-control" id="location" name="location"
									placeholder="Example: Hyderabad" required>

							</div>

							<div class="mb-4">

								<label for="description" class="form-label"> Job
									Description </label>

								<textarea class="form-control" id="description"
									name="description"
									placeholder="Describe the job responsibilities and requirements"
									required></textarea>

							</div>

							<div class="mb-4">

								<label for="skills" class="form-label"> Required Skills
								</label> <input type="text" class="form-control" id="skills"
									name="skills"
									placeholder="Example: Java, JDBC, MySQL, Servlets" required>

							</div>

							<div class="mb-4">

								<label for="salary" class="form-label"> Salary </label> <input
									type="number" class="form-control" id="salary" name="salary"
									placeholder="Enter salary" min="0" step="0.01" required>

							</div>

							<div class="mb-4">

								<label for="jobType" class="form-label"> Job Type </label> <select
									class="form-select" id="jobType" name="jobType" required>

									<option value="" selected disabled>Select Job Type</option>

									<option value="Full-Time">Full-Time</option>

									<option value="Part-Time">Part-Time</option>

									<option value="Contract">Contract</option>

									<option value="Internship">Internship</option>

								</select>

							</div>

							<div class="text-center mt-4">

								<button type="submit" class="btn btn-primary-custom me-2">
									Post Job</button>

								<a href="recruiterHome.jsp" class="btn btn-outline-custom">
									Cancel </a>

							</div>


						</form>

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

					<p class="footer-description">Connect with talented candidates,
						post job opportunities, and build your team with our online job
						portal.</p>

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
