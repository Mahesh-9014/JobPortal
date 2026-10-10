<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.model.JobModel"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Job Details</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>

<body class="bg-light">

	<%
	JobModel jm = (JobModel) request.getAttribute("job");
	%>

	<div class="container mt-5 mb-5">

		<div class="card shadow border-0">

			<div class="card-body p-5">

				<h1 class="mb-3"><%=jm.getTitle()%></h1>

				<div class="mb-4">
					<p class="mb-2">
						<strong>Company:</strong>
						<%=jm.getCompany()%>
					</p>

					<p class="mb-2">
						<strong>Location:</strong>
						<%=jm.getLocation()%>
					</p>

					<p class="mb-2">
						<strong>Salary:</strong> ₹<%=jm.getSalary()%>
					</p>

					<p class="mb-2">
						<strong>Job Type:</strong>
						<%=jm.getJobType()%>
					</p>
				</div>

				<hr>

				<h4 class="mt-4">Job Description</h4>

				<p>
					<%=jm.getDescription()%>
				</p>

				<h4 class="mt-4">Required Skills</h4>

				<p>
					<%=jm.getSkills()%>
				</p>

				<hr class="mt-4">

				<h3 class="mt-4 mb-4">Apply for this Job</h3>

				<form action="ApplicationController" method="post" enctype="multipart/form-data">

					<input type="hidden" name="jobId" value="<%=jm.getJobId()%>">

					<div class="mb-3">

						<label class="form-label">Full Name</label> <input type="text"
							name="name" class="form-control" required>

					</div>

					<div class="mb-3">

						<label class="form-label">Email</label> <input type="email"
							name="email" class="form-control" required>

					</div>

					<div class="mb-3">

						<label class="form-label">Phone</label> <input type="text"
							name="phone" class="form-control" required>

					</div>

					<div class="mb-3">

						<label class="form-label">Resume</label> <input type="file"
							name="resume" class="form-control" required>

					</div>

					<button type="submit" class="btn btn-primary px-4">Apply
						Now</button>

				</form>

			</div>

		</div>

	</div>

</body>

</html>
