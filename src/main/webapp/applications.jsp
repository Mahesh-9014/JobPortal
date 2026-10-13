<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.model.ApplicationModel"%>

<%
String username = (String) session.getAttribute("username");
String role = (String) session.getAttribute("role");

if (username == null || !"JOB SEEKER".equals(role)) {
	response.sendRedirect("login.jsp");
	return;
}

@SuppressWarnings("unchecked")
List<ApplicationModel> list = (List<ApplicationModel>) request.getAttribute("list");

if (list == null) {
	response.sendRedirect("ApplicationsController");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Applications</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f5f7fb;
	font-family: Arial, sans-serif;
}

.page-title {
	font-weight: bold;
	color: #333;
	margin-bottom: 30px;
}

.application-card {
	background: white;
	border: none;
	border-radius: 12px;
	padding: 25px;
	margin-bottom: 20px;
	box-shadow: 0 3px 15px rgba(0, 0, 0, 0.08);
}

.application-card h4 {
	color: #4b49c6;
	font-weight: bold;
}

.label {
	font-weight: bold;
	color: #555;
}
</style>
</head>

<body>

	<nav class="navbar navbar-expand-lg">
		<div class="container"></div>
	</nav>

	<div class="container py-5">

		<h2 class="page-title text-center">My Applications</h2>

		<%
		if (list.isEmpty()) {
		%>

		<div class="text-center">
			<h5>No applications found.</h5>

			<p class="text-muted">You have not applied for any jobs yet.</p>

			<a href="JobsController" class="btn btn-primary"> Find Jobs </a>
		</div>

		<%
		} else {
		for (ApplicationModel am : list) {
		%>

		<div class="application-card">

			<h4>
				Application #<%=am.getApplicationId()%>
			</h4>

			<p>
				<span class="label">Job ID:</span>
				<%=am.getJobId()%>
			</p>

			<p>
				<span class="label">Name:</span>
				<%=am.getName()%>
			</p>

			<p>
				<span class="label">Email:</span>
				<%=am.getEmail()%>
			</p>

			<p>
				<span class="label">Phone:</span>
				<%=am.getPhone()%>
			</p>

			<p>
				<span class="label">Resume:</span>
				<%=am.getResume()%>
			</p>

			<p>
				<span class="label">Status:</span>
				<%=am.getStatus()%>
			</p>

		</div>

		<%
		}
		}
		%>

	</div>

</body>
</html>