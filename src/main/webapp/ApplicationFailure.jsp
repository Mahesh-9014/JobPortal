<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Application Status</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body class="bg-light">

	<div class="container">

		<div class="row justify-content-center mt-5">

			<div class="col-md-7 col-lg-6">

				<div class="card shadow border-0 text-center">

					<div class="card-body p-5">

						<div class="mb-4">
							<h1 class="text-danger">✕</h1>
						</div>

						<h2 class="fw-bold text-danger mb-3">
							<%=request.getAttribute("message")%>
						</h2>

						<p class="text-muted mb-4">Sorry, we could not process your
							application. Please try again later.</p>

						<a href="HomeController" class="btn btn-primary px-4 me-2">
							Back to Home </a> <a href="JobController"
							class="btn btn-outline-primary px-4"> View Jobs </a>

					</div>

				</div>

			</div>

		</div>

	</div>

</body>
</html>
