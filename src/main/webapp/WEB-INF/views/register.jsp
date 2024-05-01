<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var="registerUrl" value="/register"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng kí</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #e0f2f1; /* Light blue background */
        }
        .card {
            border: none;
            border-radius: 15px; /* Softer rounded corners */
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); /* Subtle shadow for depth */
        }
        .form-control {
            border-radius: 5px; /* Consistent rounded corners for inputs */
            border: 1px solid #ccc;
            padding: 10px 15px; /* Add some padding for better spacing */
        }
        .text-primary {
            color: #388e3c !important; /* Use primary color for text accents */
        }
        .text-decoration-none {
            text-decoration: none !important;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow">
                <div class="card-body">
                    <h2 class="card-title text-center mb-4">Đăng kí</h2>
                    <form:form action="${registerUrl}" id="formRegister" method="get" modelAttribute="userRegister">
                        <div class="mb-3">
                            <label for="userName" class="form-label">Tên người dùng<span class="text-danger">*</span></label>
                            <form:input path="userName" type="text" class="form-control" id="userName" name="userName" placeholder="Tên người dùng" required="required" />
                        </div>
                        <div class="mb-3">
                            <label for="fullName" class="form-label">Họ và tên <span class="text-danger">*</span></label>
                            <form:input path="fullName" type="text" class="form-control" id="fullName" name="fullName" placeholder="Nhập họ và tên của bạn" required="required" />
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email <span class="text-danger">*</span></label>
                            <form:input path="email" type="email"  class="form-control" id="email" name="email" placeholder="Nhập địa chỉ email của bạn" required="required" />
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Mật khẩu <span class="text-danger">*</span></label>
                            <form:input path="password" type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu của bạn" required="required" />
                        </div>
<%--                        <div class="mb-3">--%>
<%--                            <label for="confirmPassword" class="form-label">Xác nhận mật khẩu <span class="text-danger">*</span></label>--%>
<%--                            <form:input path="confirmPassword" type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Nhập lại mật khẩu của bạn" required="required" />--%>
<%--                        </div>--%>
                        <form:hidden path="status"/>
                        <form:hidden path="roleCode"/>
<%--                        <form:hidden path="roleDTOs"/>--%>
                        <div class="text-center mb-3">
                            <button type="submit" class="btn btn-success" id="btnAddUser">Đăng ký</button>
                        </div>
                    </form:form>

                    <div class="text-center">
                        <p class="small mb-0">Đã có tài khoản? <a href="<c:url value="/login"/>" class="text-primary text-decoration-none">Đăng nhập</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $("#btnAddUser").click(function (e) {
        var data = {};
        var formData = $("#formRegister").serializeArray();
        $.each(formData, function (i, v) {
            data[v.name] = v.value;
        });
        console.log("OK");
        if (data['email'] === "" || data['userName'] === "" || data['fullName'] === "" || data['password'] === ""){
            alert("Vui lòng điền đầy đủ thông tin!")
        }
        else{
            AddUser(data)
            alert("Đăng ký thành công!")
            window.location.href = "<c:url value="/login"/>"
        }

        e.preventDefault();
    });

    function AddUser(data) {
        $.ajax({
            type: "POST",
            url: "/api/user",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (response) {
            },
            error: function (response) {
                console.log("Fail!");
            },
        });
    }
</script>
</body>
</html>
