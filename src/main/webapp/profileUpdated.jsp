<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Updated</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f4f6ff;
	min-height: 100vh;
}

.navbar {
	background: linear-gradient(90deg, #4e54c8, #8f94fb);
}

.navbar-brand, .nav-link {
	color: white !important;
}

.success-container {
	max-width: 550px;
	margin: 100px auto;
}

.success-card {
	background: white;
	border-radius: 15px;
	padding: 45px 35px;
	text-align: center;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

.success-icon {
	width: 70px;
	height: 70px;
	margin: 0 auto 20px;
	border-radius: 50%;
	background: #d1e7dd;
	color: #198754;
	font-size: 40px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.success-title {
	color: #198754;
	font-weight: bold;
	margin-bottom: 15px;
}

.success-text {
	color: #666;
	margin-bottom: 30px;
}
</style>

</head>

<body>

	<%
	String role = (String) session.getAttribute("role");

	String homePage;

	if ("RECRUITER".equals(role)) {
		homePage = "recruiterHome.jsp";
	} else {
		homePage = "HomeController";
	}
	%>

	<div class="container success-container">

		<div class="success-card">

			<div class="success-icon">✓</div>

			<h2 class="success-title">Profile Updated Successfully</h2>

			<p class="success-text">Your password has been changed
				successfully.</p>

			<a href="ProfileController" class="btn btn-primary px-4"> Back to
				Profile </a>

		</div>

	</div>

</body>

</html>
