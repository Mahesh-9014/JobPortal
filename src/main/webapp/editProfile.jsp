<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String username = (String) session.getAttribute("username");

if (username == null) {
	response.sendRedirect("login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>

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

.profile-container {
	max-width: 550px;
	margin: 70px auto;
}

.profile-card {
	background: white;
	border-radius: 15px;
	padding: 35px;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

.profile-title {
	color: #4e54c8;
	font-weight: bold;
	text-align: center;
	margin-bottom: 30px;
}

.form-label {
	font-weight: 600;
}

.button-container {
	display: flex;
	justify-content: space-between;
	margin-top: 25px;
}
</style>

</head>

<body>

	<div class="container profile-container">

		<div class="profile-card">

			<h2 class="profile-title">Edit Profile</h2>

			<%
			String error = (String) request.getAttribute("error");

			if (error != null) {
			%>

			<p style="color: red;"><%=error%></p>

			<%
			}
			%>

			<form action="EditController" method="post">

				<div class="mb-3">
					<label class="form-label">Username</label> <input type="text"
						class="form-control" value="<%=username%>" readonly>
				</div>


				<div class="mb-3">
					<label class="form-label">New Password</label> <input
						type="password" name="password" class="form-control"
						placeholder="Enter new password" required>
				</div>


				<div class="mb-3">
					<label class="form-label">Confirm Password</label> <input
						type="password" name="confirmPassword" class="form-control"
						placeholder="Confirm new password" required>
				</div>


				<div class="button-container">

					<a href="ProfileController" class="btn btn-secondary"> Cancel </a>

					<button type="submit" class="btn btn-primary">Update
						Profile</button>

				</div>

			</form>

		</div>

	</div>

</body>
</html>
