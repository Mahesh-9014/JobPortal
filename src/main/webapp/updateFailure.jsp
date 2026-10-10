<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Profile Update Failed</title>

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

.failure-container {
	max-width: 550px;
	margin: 100px auto;
}

.failure-card {
	background: white;
	border-radius: 15px;
	padding: 45px 35px;
	text-align: center;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

.failure-icon {
	width: 70px;
	height: 70px;
	margin: 0 auto 20px;
	border-radius: 50%;
	background: #f8d7da;
	color: #dc3545;
	font-size: 40px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.failure-title {
	color: #dc3545;
	font-weight: bold;
	margin-bottom: 15px;
}

.failure-text {
	color: #666;
	margin-bottom: 30px;
}
</style>

</head>

<body>

	<div class="container failure-container">

		<div class="failure-card">

			<div class="failure-icon">✕</div>

			<h2 class="failure-title">Profile Update Failed</h2>

			<p class="failure-text">We could not update your password. Please
				try again.</p>

			<a href="editProfile.jsp" class="btn btn-primary px-4"> Try Again
			</a> <a href="ProfileController" class="btn btn-secondary px-4 ms-2">
				Back to Profile </a>

		</div>

	</div>

</body>
</html>
