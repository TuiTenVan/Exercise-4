<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div id="sidebar" class="sidebar                  responsive">
    <script type="text/javascript">
        try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
    </script>
    <div class="sidebar-shortcuts" id="sidebar-shortcuts">
        <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
            <button class="btn btn-success">
                <i class="ace-icon fa fa-signal"></i>
            </button>

            <button class="btn btn-info">
                <i class="ace-icon fa fa-pencil"></i>
            </button>

            <button class="btn btn-warning">
                <i class="ace-icon fa fa-users"></i>
            </button>

            <button class="btn btn-danger">
                <i class="ace-icon fa fa-cogs"></i>
            </button>
        </div>

        <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>
        </div>
    </div>

    <ul class="nav nav-list" style="top: 0px;">
        <li class="">
            <a href="/admin/building-list" class="dropdown-toggle">
                <i class="fa-solid fa-building-user" style="font-size: 16px; margin-left: 6px;"></i>
                <span class="menu-text" style="margin-left: 5px;"> Quản lý tòa nhà</span>
            </a>

            <b class="arrow"></b>
            <ul class="submenu">
                <li class="">
                    <a href="/admin/building-list">
<%--                        <i class="menu-icon fa fa-caret-right"></i>--%>
                        <span>Danh sách tòa nhà</span>
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul>
        </li>
        <li class="">
            <a href="/admin/user-list" class="dropdown-toggle">
                <i class="fa-solid fa-user-tie" style="font-size: 16px; margin-left: 10px;"></i>
                <span class="menu-text" style="margin-left: 5px;"> Quản lý nhân viên</span>
            </a>

            <b class="arrow"></b>
            <ul class="submenu">
                <li class="">
                    <a href="/admin/user-list">
                        <%--                        <i class="menu-icon fa fa-caret-right"></i>--%>
                        <span>Danh sách nhân viên</span>
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul>
        </li>
        <li class="">
            <a href="/admin/customer-list" class="dropdown-toggle">
                <i class="fa-solid fa-users" style="font-size: 16px; margin-left: 6px;"></i>
                <span class="menu-text" style="margin-left: 5px;"> Quản lý khách hàng</span>
            </a>

            <b class="arrow"></b>
            <ul class="submenu">
                <li class="">
                    <a href="/admin/customer-list">
                        <%--                        <i class="menu-icon fa fa-caret-right"></i>--%>
                        <span>Danh sách khách hàng</span>
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul>
        </li>

    </ul>
    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
        <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>

    <script type="text/javascript">
        try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
    </script>
</div>