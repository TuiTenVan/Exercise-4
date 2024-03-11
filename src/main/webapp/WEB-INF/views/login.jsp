<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>
</head>
<body>
	<div class="container">
		<!-- <h1 class="form-heading">login Form</h1> -->
		<div class="login-form">
			<div class="main-div" >
				<c:if test="${param.incorrectAccount != null}">
					<div class="alert alert-danger" style="margin-top: 0px">
							Username or password incorrect
					</div>
				</c:if>
				<c:if test="${param.accessDenied != null}">
					<div class="alert alert-danger" style="margin-top: 0px">
							You Not authorize
					</div>
				</c:if>
				<c:if test="${param.sessionTimeout != null}">
					<div class="alert alert-danger" style="margin-top: 0px">
							Session Timeout
					</div>
				</c:if>

				<div class="container">
					<div class="row justify-content-center">
						<div class="col-md-5">
							<div class="card shadow-lg" style="background-color: #f8f9fa; border-radius: 25px; border: 1px solid #ccc;">
								<div class="card-body">
									<h2 class="card-title text-center mb-4" style="color: #000; font-weight: 700;">Login</h2>
									<form action="j_spring_security_check" id="formLogin" method="post">
										<div class="mb-3">
											<label for="userName" class="form-label" style="color: #000; font-weight: 500;">Email</label>
											<input type="text" class="form-control" id="userName" name="j_username" placeholder="Enter your email" style="border-radius: 25px; border: 2px solid #ccc; padding: 10px; background-color: #fff;">
										</div>
										<div class="mb-3">
											<label for="password" class="form-label" style="color: #000; font-weight: 500;">Password</label>
											<input type="password" class="form-control" id="password" name="j_password" placeholder="Enter your password" style="border-radius: 25px; border: 2px solid #ccc; padding: 10px; background-color: #fff;">
										</div>
										<div class="mb-3 form-check">
											<input type="checkbox" class="form-check-input" id="rememberMe">
											<label class="form-check-label" for="rememberMe" style="color: #000; font-weight: 500;">Remember Password</label>
										</div>
										<div class="text-center mb-3">
											<button type="submit" class="btn btn-primary" style="color: #fff; font-weight: 700; border-radius: 25px; padding: 10px 25px; background-color: #007bff; border: none;">Login</button>
										</div>
									</form>
									<div class="text-center">
										<p class="small mb-2"><a href="#!" class="text-decoration-none" style=" font-weight: 500; font-size: 16px;">Forgot password?</a></p>
										<p class="small mb-0" style="color: #000; font-weight: 500; font-size: 16px;">Don't have an account? <a href="#!" class="text-decoration-none" style="font-size: 16px;font-weight: 500;">Sign Up</a></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>