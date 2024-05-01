<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Đăng nhập</title>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	<style>
		body {
			background-color: #5DCB90;
		}
		.card {
			border: none;
			border-radius: 25px;
		}
		.form-control {
			border-radius: 25px;
			border: 1px solid #ccc;
			padding: 10px 15px; /* Consistent padding */
		}
		.btn-success {
			color: #fff;
			font-weight: 700;
			border-radius: 5px;
			padding: 10px 20px;
			background-color: #28a745; /* Green primary button */
			border: none;
		}
		.btn-success:hover {
			background-color: #1e7c38; /* Darken on hover */
		}
		.invalid-feedback {
			display: none; /* Initially hide validation messages */
			color: #dc3545;
			margin-top: 5px;
		}
		.invalid-feedback.show { /* Display validation messages when triggered */
			display: block;
		}
	</style>
</head>
<body>
<div class="container mt-5">
	<div class="row justify-content-center" style="margin-top: 100px">
		<div class="col-md-5">
			<div class="card shadow">
				<div class="card-body">
					<h2 class="card-title text-center mb-4">Đăng nhập</h2>
					<form action="j_spring_security_check" id="formLogin" method="post">
						<div class="mb-3">
							<label for="userName" class="form-label">Tên người dùng <span class="text-danger">*</span></label>
							<input type="text" class="form-control" id="userName" name="j_username" placeholder="Nhập tên người dùng" required>
							<div class="invalid-feedback" id="usernameError">Username is required.</div>
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Mật khẩu <span class="text-danger">*</span></label>
							<input type="password" class="form-control" id="password" name="j_password" placeholder="Nhập mật khẩu của bạn" required>
							<div class="invalid-feedback" id="passwordError">Password is required.</div>
						</div>
						<div class="mb-3 form-check">
							<input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
							<label class="form-check-label" for="rememberMe">Nhớ đăng nhập</label>
						</div>
						<div class="text-center mb-3">
							<button type="submit" class="btn btn-success">Đăng nhập</button>
						</div>
					</form>
					<div class="text-center">
						<p class="small mb-0">Bạn chưa có tài khoản? <a href="<c:url value="/register"/>" class="text-primary text-decoration-none">Đăng kí</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
