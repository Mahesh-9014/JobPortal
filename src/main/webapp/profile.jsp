<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>My Profile</title>

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
	background: linear-gradient(90deg, #4b49c6, #6c63d9);
}

.navbar-brand, .nav-link {
	color: white !important;
}

.nav-link {
	margin-left: 10px;
}

.profile-container {
	min-height: 75vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.profile-card {
	width: 450px;
	background: white;
	border: none;
	border-radius: 15px;
	padding: 35px;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.10);
}

.profile-icon {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	background: linear-gradient(135deg, #4b49c6, #7b68ee);
	color: white;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 35px;
	margin: 0 auto 20px;
}

.profile-title {
	text-align: center;
	font-weight: bold;
	margin-bottom: 30px;
}

.profile-info {
	background: #f5f7fb;
	border-radius: 10px;
	padding: 15px;
	margin-bottom: 15px;
}

.profile-label {
	color: #666;
	font-size: 14px;
	margin-bottom: 5px;
}

.profile-value {
	font-size: 17px;
	font-weight: bold;
	color: #333;
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

	<div class="profile-container">

		<div class="profile-card">

			<div class="profile-icon">👤</div>

			<h2 class="profile-title">My Profile</h2>

			<div class="profile-info">

				<div class="profile-label">Username</div>

				<div class="profile-value">
					<%=request.getAttribute("username")%>
				</div>

			</div>

			<a href="editProfile.jsp" class="btn btn-primary"> Edit Profile </a>

			<a href="<%=homePage%>" class="btn btn-outline-primary px-4">
				Back to Home </a>

		</div>

	</div>

</body>

</html>
