<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <title>Trang chủ</title> -->
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#" style="color: #000;">Trang chủ</a>
                </li>
            </ul><!-- /.breadcrumb -->
        </div>
<%--        <div class="page-content">--%>
<%--            <div class="row" >--%>
<%--                <div class="col-xs-12">--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
        <section id="intro">
            <h2>Chào mừng đến với dự án quản lý tòa nhà!</h2>
            <p>Dự án này giúp quản lý thông tin về các tòa nhà, bao gồm thông tin về tên, địa chỉ, diện tích, giá thuê và nhiều hơn nữa.</p>
        </section>
        <section id="buildings">
            <h2>Danh sách tòa nhà</h2>
            <div class="building">
                <h3>Tòa nhà A</h3>
                <p>Địa chỉ: 123 Đường ABC, Quận XYZ</p>
                <p>Diện tích: 1000m<sup>2</sup></p>
                <p>Giá thuê: $2000/tháng</p>
            </div>
            <div class="building">
                <h3>Tòa nhà B</h3>
                <p>Địa chỉ: 456 Đường DEF, Quận UVW</p>
                <p>Diện tích: 1500m<sup>2</sup></p>
                <p>Giá thuê: $2500/tháng</p>
            </div>
            <!-- Add more buildings as needed -->
        </section>
    </div>
</div><!-- /.main-content -->
<style>

    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex; /* Sửa đổi */
        flex-direction: column; /* Sửa đổi */
        min-height: 100vh; /* Sửa đổi */
    }
    header {
        background-color: #333;
        color: #fff;
        padding: 20px;
    }

    header h1 {
        margin: 0;
    }

    nav ul {
        list-style-type: none;
        padding: 0;
    }

    nav ul li {
        display: inline;
        margin-right: 20px;
    }

    nav ul li a {
        color: #fff;
        text-decoration: none;
    }

    #intro {
        padding: 20px;
    }

    #buildings {
        padding: 20px;
    }

    .building {
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
        margin-bottom: 10px;
    }

    .building h3 {
        margin-top: 0;
    }
    footer {
        background-color: #333;
        color: #fff;
        text-align: center;
        padding: 10px;
        position: fixed;
        width: 100%;
        bottom: 0;
    }

</style>
</body>
</html>