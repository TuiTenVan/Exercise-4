<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<%@include file="/common/taglib.jsp"%>--%>
<%--<%@ page import="com.javaweb.security.utils.SecurityUtils" %>--%>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>

<%--<div id="navbar" class="navbar navbar-default">--%>
<%--    <div class="navbar-container" id="navbar-container">--%>
<%--        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">--%>
<%--            <span class="sr-only">Toggle sidebar</span>--%>

<%--            <span class="icon-bar"></span>--%>

<%--            <span class="icon-bar"></span>--%>

<%--            <span class="icon-bar"></span>--%>
<%--        </button>--%>

<%--        <div class="navbar-header pull-left" id="header" style="padding: 12px; font-weight: 700">--%>
<%--            <a href="/admin/building-list" class="navbar-brand">--%>
<%--                <small style="font-size: 26px">--%>
<%--                    <i class="fa-solid fa-list-check"></i>--%>
<%--                    <span> Trang quản trị</span>--%>
<%--                </small>--%>
<%--            </a>--%>
<%--        </div>--%>
<%--        <div class="pull-right" >--%>
<%--            <a href="/trang-chu">--%>
<%--                <button style="margin-right: 10px;">--%>
<%--                    <i class="fa-solid fa-house-user"></i>--%>
<%--                    <span> Trang chủ</span>--%>
<%--                </button>--%>
<%--            </a>--%>

<%--            <button>--%>
<%--                <a data-toggle="dropdown" href="#" class="dropdown-toggle" style="color: #000; text-decoration: none;" onmouseover="this.style.color='#fff'" onmouseout="this.style.color='#000'">--%>
<%--                    <i class="fa-solid fa-gauge-high"></i>--%>
<%--                    <span >Xin chào, Admin </span>--%>
<%--                    <i class="ace-icon fa fa-caret-down"></i>--%>
<%--                </a>--%>
<%--                <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">--%>
<%--                    <li>--%>
<%--                        <a href="/admin/user-edit">--%>
<%--                            <i class="ace-icon fa fa-user"></i>--%>
<%--                            <!-- &lt;%&ndash;<spring:message code="label.account.information"/>&ndash;%&gt; -->--%>
<%--                            Thông tin tài khoản--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <a href="/admin/profile-password">--%>
<%--                            <i class="ace-icon fa fa-key"></i>--%>
<%--                            <!-- &lt;%&ndash;<spring:message code="label.password.change"/>&ndash;%&gt; -->--%>
<%--                            Đổi mật khẩu--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                    <li class="divider"></li>--%>
<%--                    <li>--%>
<%--                        <a href="/login">--%>
<%--                            <i class="ace-icon fa fa-power-off"></i>--%>
<%--                            Thoát--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--            </button>--%>
<%--        </div>--%>
<%--    </div><!-- /.navbar-container -->--%>
<%--</div>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ page import="com.javaweb.security.utils.SecurityUtils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div id="navbar" class="navbar navbar-default">
    <div class="navbar-container" id="navbar-container">
        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
            <span class="sr-only">Toggle sidebar</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>

        <div class="navbar-header pull-left" id="header" style="padding: 12px; font-weight: 700">
            <a href="/admin/building-list" class="navbar-brand">
                <small style="font-size: 26px">
                    <i class="fa-solid fa-list-check"></i>
                    <span> Trang quản trị</span>
                </small>
            </a>
        </div>
        <div class="pull-right" style="margin-top: 10px; margin-right: 10px;">
            <a href="/trang-chu" style="text-decoration: none; margin-right: 10px">
                <button style="background-color: #5DCC91; color: white; border: none; padding: 10px 20px; cursor: pointer; font-weight: 700; font-size: 15px">
                    <i class="fa-solid fa-house-user" style="margin-right: 5px;"></i>
                    <span style="font-size: 15px;">Trang chủ</span>
                </button>
            </a>

            <div class="dropdown" style="display: inline-block; position: relative;">
                <button class="dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color: #5DCC91; color: white; border: none; padding: 10px 20px; cursor: pointer;font-weight: 700; font-size: 15px;">
                    <i class="fa-solid fa-caret-down" style="font-size: 18px; margin-right: 5px"></i>
                    <span style="font-size: 15px;">Xin chào, <%=SecurityUtils.getPrincipal().getUsername()%> </span>
                </button>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton" style="min-width: 150px; border: none; border-radius: 5px; box-shadow: 0 2px 5px rgba(0,0,0,0.2);">
                    <a class="dropdown-item" href="/admin/user-edit" style="text-decoration: none; color: #333;">
                        <i class="ace-icon fa fa-user" style="margin-right: 5px;"></i>
                        <span>Thông tin tài khoản</span>
                    </a>
                    <a class="dropdown-item" href="/admin/profile-password" style="text-decoration: none; color: #333;">
                        <i class="ace-icon fa fa-key" style="margin-right: 5px;"></i>
                        <span>Đổi mật khẩu</span>
                    </a>
                    <div class="dropdown-divider" style="margin: 5px 0;"></div>
                    <a class="dropdown-item" href="/login" style="text-decoration: none; color: #333;">
                        <i class="ace-icon fa fa-power-off" style="margin-right: 5px;"></i>
                        <span>Thoát</span>
                    </a>
                </div>
            </div>
        </div>


    </div><!-- /.navbar-container -->
</div>
