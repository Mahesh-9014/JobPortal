<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Already Applied</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>

<body class="bg-light">

	<div class="container d-flex justify-content-center align-items-center"
		style="min-height: 100vh;">

		<div class="card shadow p-5 text-center" style="max-width: 500px;">

			<div class="text-warning mb-3">
				<h1>⚠</h1>
			</div>

			<h2 class="mb-3">You have already applied for this job.</h2>

			<p class="text-muted">You cannot apply for the same job more than
				once.</p>

			<div class="mt-4">
				<a href="HomeController" class="btn btn-primary me-2"> Home </a> <a
					href="ApplicationsController" class="btn btn-outline-primary">
					My Applications </a>
			</div>

		</div>

	</div>

</body>
</html>
