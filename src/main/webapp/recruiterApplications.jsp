<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.model.ApplicationModel"%>

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

<title>Applications</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	margin: 0;
	background: #f5f7fb;
	font-family: Arial, sans-serif;
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
	margin-bottom: 40px;
}

.application-card {
	background: #ffffff;
	border: none;
	border-radius: 15px;
	padding: 25px;
	height: 100%;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
}

.application-card h5 {
	color: #4f46e5;
	font-weight: 700;
	margin-bottom: 20px;
}

.application-info {
	color: #495057;
	font-size: 14px;
	margin-bottom: 10px;
	overflow-wrap: anywhere;
}

.application-info strong {
	color: #212529;
}

.status-badge {
	display: inline-block;
	background: #eef2ff;
	color: #4f46e5;
	padding: 6px 12px;
	border-radius: 20px;
	font-size: 13px;
	font-weight: 600;
}

.resume-link {
	color: #4f46e5;
	text-decoration: none;
	font-weight: 500;
}

.resume-link:hover {
	color: #4338ca;
}

.back-home {
	margin-top: 40px;
}
</style>

</head>

<body>

	<div class="container page-section">

		<div class="text-center">
			<h1 class="page-title">Applications</h1>

			<p class="page-description">View applications received for your
				job postings.</p>
		</div>

		<div class="row g-4">

			<%
			@SuppressWarnings("unchecked")
			List<ApplicationModel> list = (List<ApplicationModel>) request.getAttribute("list");

			if (list != null && !list.isEmpty()) {

				for (ApplicationModel a : list) {
			%>

			<div class="col-lg-6 col-md-6">

				<div class="application-card">

					<h5>Applicant Details</h5>

					<p class="application-info">
						<strong>Name:</strong>
						<%=a.getName()%>
					</p>

					<p class="application-info">
						<strong>Email:</strong>
						<%=a.getEmail()%>
					</p>

					<p class="application-info">
						<strong>Phone:</strong>
						<%=a.getPhone()%>
					</p>

					<p class="application-info">
						<strong>Job ID:</strong>
						<%=a.getJobId()%>
					</p>

					<p class="application-info">
						<strong>Status:</strong> <span class="status-badge"> <%=a.getStatus()%>
						</span>
					</p>

					<%
					if (a.getResume() != null && !a.getResume().isEmpty()) {
					%>

					<p class="application-info">
						<strong>Resume:</strong> <a href="<%=a.getResume()%>"
							class="resume-link" target="_blank" rel="noopener noreferrer">
							View Resume </a>
					</p>

					<%
					}
					%>

					<div class="mt-4">

						<form action="UpdateApplicationController" method="post"
							class="d-inline">

							<input type="hidden" name="applicationId"
								value="<%=a.getApplicationId()%>"> <input
								type="hidden" name="status" value="Accepted">

							<button type="submit" class="btn btn-success">Accept</button>

						</form>

						<form action="UpdateApplicationController" method="post"
							class="d-inline ms-2">

							<input type="hidden" name="applicationId"
								value="<%=a.getApplicationId()%>"> <input
								type="hidden" name="status" value="Rejected">

							<button type="submit" class="btn btn-danger">Reject</button>

						</form>

					</div>

				</div>

			</div>

			<%
			}

			} else {
			%>

			<div class="col-12 text-center">
				<p class="text-muted">No applications found for your job
					postings.</p>
			</div>

			<%
			}
			%>

		</div>

		<div class="text-center back-home">
			<a href="RecruiterHomeController" class="btn btn-outline-primary px-4 py-2">
				&larr; Back to Home </a>
		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
		
	</script>

</body>
</html>