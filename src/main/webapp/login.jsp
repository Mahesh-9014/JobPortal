<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Login</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	background: linear-gradient(135deg, #e0f2fe, #ede9fe);
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

.login-section {
	flex: 1;
	padding: 60px 15px;
}

.login-card {
	max-width: 450px;
	margin: auto;
	background: white;
	border-radius: 15px;
	padding: 35px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
}

.login-title {
	color: #4f46e5;
	font-weight: 600;
}

.btn-login {
	background: #4f46e5;
	color: white;
	border: none;
}

.btn-login:hover {
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

			<a class="navbar-brand" href="index.jsp"> JOB PORTAL </a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNav">

				<ul class="navbar-nav ms-auto">

					<li class="nav-item"><a class="nav-link active"
						href="login.jsp">Login</a></li>

					<li class="nav-item"><a class="nav-link" href="index.jsp">Register</a>
					</li>

				</ul>

			</div>
		</div>
	</nav>

	<section class="login-section">

		<div class="login-card">

			<h2 class="text-center login-title mb-4">Login</h2>

			<%
			String error = (String) request.getAttribute("error");
			if (error != null) {
			%>

			<p class="text-danger text-center"><%=error%></p>

			<%
			}
			%>

			<form action="LoginController" method="post">

				<div class="mb-3">
					<label for="username" class="form-label"> Username </label> <input
						type="text" class="form-control" id="username" name="username"
						placeholder="Enter your username" required>
				</div>

				<div class="mb-3">
					<label for="password" class="form-label"> Password </label> <input
						type="password" class="form-control" id="password" name="password"
						placeholder="Enter your password" required>
				</div>

				<div class="d-grid">
					<button type="submit" class="btn btn-login">Login</button>
				</div>

			</form>

			<p class="text-center mt-3 mb-0">
				Don't have an account? <a href="index.jsp">Register here</a>
			</p>

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

						<li><a href="login.jsp">Home</a></li>

						<li><a href="login.jsp">Find Jobs</a></li>

						<li><a href="login.jsp">Login</a></li>

						<li><a href="index.jsp">Register</a></li>

					</ul>

				</div>


				<div class="col-lg-2 col-md-6">

					<h5 class="footer-title">Job Seekers</h5>

					<ul class="footer-links">

						<li><a href="login.jsp">Browse Jobs</a></li>

						<li><a href="login.jsp">My Applications</a></li>

						<li><a href="login.jsp">My Profile</a></li>

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
