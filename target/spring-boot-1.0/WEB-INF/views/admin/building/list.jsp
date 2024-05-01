<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url var="buildingAPI" value="/api/building"/>

<html>
<head>
    <title>Danh sách tòa nhà</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>

            <ul class="breadcrumb" >
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="/admin/home" style="color: #000;">Trang chủ</a>
                </li>
                <li class="active">Quản lý tòa nhà</li>
            </ul><!-- /.breadcrumb -->

        </div>

        <div class="page-content">
            <div class="page-header">
                <h1 style="color: #000; font-size: 26px; font-weight: 500;">
                    <i class="fa-solid fa-bars"></i>
                    Danh sách tòa nhà
                </h1>
            </div><!-- /.page-header -->
            <div class="row">
                <div class="col-xs-12 widget-container-col ui-sortable">
                    <div class="widget-box ui-sortable-handle">
                        <div class="widget-header">
                            <h5 class="widget-title" style="color: #000; font-size: 20px;">Tìm kiếm</h5>
                            <div class="widget-toolbar">
                                <div class="widget-menu">
                                    <a href="#" data-action="settings" data-toggle="dropdown">
                                        <i class="ace-icon fa fa-bars"></i>
                                    </a>
                                </div>
                                <a href="#" data-action="fullscreen" class="orange2">
                                    <i class="ace-icon fa fa-expand"></i>
                                </a>
                                <a href="#" data-action="reload">
                                    <i class="ace-icon fa fa-refresh"></i>
                                </a>
                                <a href="#" data-action="collapse">
                                    <i class="ace-icon fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="widget-body" style="font-family: 'Inria Serif', sans-serif;">
                            <div class="widget-main">
                                <form:form id="listForm" action="${buildingListURL}" method="get" modelAttribute="modelSearch">
                                    <div class="row">
                                        <form role="form" class="form-horizontal">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6">
                                                        <label class="name">Tên tòa nhà</label>
<%--                                                        <input class="form-control" type="text" name="name" value="${modelSearch.name}">--%>
                                                        <form:input class="form-control" path="name"/>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        <label class="name">Diện tích sàn</label>
<%--                                                        <input class="form-control" type="number" value="${modelSearch.floorArea}" name="floorArea" style="border-radius: 20px;">--%>
                                                        <form:input path="floorArea" class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12">
                                                    <div class="col-xs-2">
                                                        <label class="name">Quận</label>
<%--                                                        <select class="form-control" name="district" value="${modelSearch.district}">--%>
                                                            <form:select class="form-control" path="district">
                                                                <form:option value="">---Chọn Quận---</form:option>
                                                                <form:options items="${district}"/>
                                                            </form:select>

<%--                                                        </select>--%>
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <label class="name">Phường</label>
<%--                                                        <input class="form-control" type="text" name="ward" value="${modelSearch.ward}">--%>
                                                        <form:input path="ward" class="form-control"/>
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <label class="name">Đường</label>
<%--                                                        <input class="form-control" type="text" name="street" value="${modelSearch.street}">--%>
                                                        <form:input path="street" class="form-control"/>
                                                    </div>

                                                </div>

                                                <div class="col-xs-12">
                                                    <div class="col-xs-4">
                                                        <label class="name">Số tầng hầm</label>
<%--                                                        <input class="form-control" type="text" name="numberOfBasement" value="${modelSearch.numberOfBasement}">--%>
                                                        <form:input path="numberOfBasement" class="form-control"/>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <label class="name">Hướng tòa nhà</label>
<%--                                                        <input class="form-control" type="text" name="direction" value="${modelSearch.direction}">--%>
                                                        <form:input path="direction" class="form-control"/>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <label class="name">Hạng tòa nhà</label>
<%--                                                        <input class="form-control" type="number" name="level" value="${modelSearch.level}">--%>
                                                        <form:input path="level" class="form-control"/>
                                                    </div>

                                                </div>

                                                <div class="col-xs-12">
                                                    <div class="col-xs-3">
                                                        <label class="name">Diện tích từ</label>
<%--                                                        <input class="form-control" type="number" name="areaFrom" value="${modelSearch.areaFrom}">--%>
                                                        <form:input path="areaFrom" class="form-control"/>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">Diện tích đến</label>
<%--                                                        <input class="form-control" type="number" name="areaTo" value="${modelSearch.areaTo}">--%>
                                                        <form:input path="areaTo" class="form-control"/>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">Giá thuê từ</label>
<%--                                                        <input class="form-control" type="number" name="rentPriceFrom" value="${modelSearch.rentPriceFrom}">--%>
                                                        <form:input path="rentPriceFrom" class="form-control"/>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">Giá thuê đến</label>
<%--                                                        <input class="form-control" type="number" name="rentPriceTo" value="${modelSearch.rentPriceTo}">--%>
                                                        <form:input path="rentPriceTo" class="form-control"/>
                                                    </div>

                                                </div>

                                                <div class="col-xs-12">

                                                    <div class="col-xs-5">
                                                        <label class="name">Tên quản lý</label>
<%--                                                        <input class="form-control" type="text" name="managerName" value="${modelSearch.managerName}">--%>
                                                        <form:input path="managerName" class="form-control"/>
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <label class="name">Điện thoại quản lý</label>
<%--                                                        <input class="form-control" type="text" name="managerPhone" value="${modelSearch.managerPhone}">--%>
                                                        <form:input path="managerPhone" class="form-control"></form:input>
                                                    </div>
                                                    <security:authorize access="hasRole('MANAGER')">
                                                        <div class="col-xs-2">
                                                            <label class="name">Nhân viên quản lý</label>
                                                            <form:select class="form-control" name="staffId" path="staffId">
                                                                <form:option value="">---Chọn nhân viên---</form:option>
                                                                <form:options items="${listStaffs}"/>
                                                            </form:select>
                                                        </div>
                                                    </security:authorize>

                                                </div>
                                                <div class="col-xs-12">
                                                    <div class="col-xs-9">
                                                        <form:checkboxes path="typeCode" items="${buildingType}"/>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6">
                                                        <button id="btnSearchBuilding" type="submit" style="background-color: #5DCC91; color: #fff; border: #5DCC91;">
                                                            <i class="fa-solid fa-magnifying-glass"></i>
                                                            <span> Tìm kiếm</span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </form:form>

                            </div>
                        </div>
                        <security:authorize access="hasRole('MANAGER')">
                            <div class="pull-right">
                                <a href="/admin/building-edit" style="color: #000; margin-top: 20px">
                                    <button title="Thêm tòa nhà" style="margin-top: 20px">
                                        <i class="ace-icon glyphicon glyphicon-plus"></i>
                                        <span> Thêm tòa nhà </span>
                                    </button>
                                </a>
                                <button title="Xóa tòa nhà" id="btnDeleteBuilding" style="margin-top: 20px">
                                    <i class="fa-solid fa-trash-can"></i>
                                    <span> Xóa tòa nhà</span>
                                </button>
                            </div>
                        </security:authorize>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12" style="margin-top: 30px;">
                    <div class="table-responsive" >
                        <display:table name="buildingList" requestURI="${buildingListURL}"
                                       id="tableList" pagesize="${model.maxPageItems}"
                                       class="table table-striped table-bordered table-hover"
                                       style="text-align: center;">
                            <display:column title="<fieldset class='form-group'>
												        <input type='checkbox' id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell"
                                            headerClass="center select-cell">
                                <fieldset>
                                    <input type="checkbox" name="checkList" value="${tableList.id}"
                                           id="checkbox_${tableList.id}" class="check-box-element"/>
                                </fieldset>
                            </display:column>
                            <display:column property="name" title="Tên tòa nhà" headerClass="center"/>
                            <display:column property="address" title="Địa chỉ" headerClass="center"/>
                            <display:column property="numberOfBasement" title="Số tầng hầm" headerClass="center"/>
                            <display:column property="managerName" title="Tên quản lý" headerClass="center"/>
                            <display:column property="managerPhone" title="Số điện thoại" headerClass="center"/>
                            <display:column property="floorArea" title="Diện tích sàn" headerClass="center"/>
                            <display:column property="emptyArea" title="Diện tích trống" headerClass="center"/>
                            <display:column property="rentArea" title="Diện tích thuê" headerClass="center"/>
                            <display:column property="brokerageFee" title="Phí môi giới" headerClass="center"/>
                            <display:column title="Thao tác" headerClass="center">
                                <div class="hidden-sm hidden-xs btn-group">
                                    <security:authorize access="hasRole('MANAGER')">
                                        <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${tableList.id})" name="buildingid">
                                            <i class="ace-icon glyphicon glyphicon-list"></i>
                                        </button>

                                    </security:authorize>
                                    <a class="btn btn-xs btn-info" title="Sửa tòa nhà" href="/admin/building-edit-${tableList.id}">
                                        <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                    </a>
                                    <security:authorize access="hasRole('MANAGER')">
                                        <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteBuilding(${tableList.id})">
                                            <i class="ace-icon glyphicon glyphicon-trash"></i>
                                        </button>
                                    </security:authorize>
                                </div>

                                <div class="hidden-md hidden-lg">
                                    <div class="inline pos-rel">
                                        <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
                                            <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                                        </button>

                                        <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                            <li>
                                                <a href="#" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View">
                                        <span class="blue">
                                            <i class="ace-icon fa fa-search-plus bigger-120"></i>
                                        </span>
                                                </a>
                                            </li>

                                            <li>
                                                <a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit">
                                        <span class="green">
                                            <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                        </span>
                                                </a>
                                            </li>

                                            <li>
                                                <a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
                                        <span class="red">
                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                        </span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </display:column>
                        </display:table>
                    </div>
                </div>
            </div>

        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
<div class="modal" tabindex="-1" role="dialog" id="assignmentBuildingModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Danh sách nhân viên</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table id="staffList" class="table table-striped table-bordered table-hover" style="text-align: center;">
                    <thead>
                        <tr style="font-weight: 700;">
                            <td>Chọn</td>
                            <td>Tên nhân viên</td>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <input type="hidden" id="buildingId" value="" name="buildingId">
            </div>
            <div class="modal-footer">
                <button type="button" title="Giao tòa nhà" id="btnAssignmentBuildingModal" style="background-color: #5DCC91; border: 1px solid #fff; color: #fff;">
                    <span>Giao tòa nhà</span>
                </button>
                <button type="button" title="Đóng" data-dismiss="modal" style=" border: 1px solid #000; color: #000; background-color: #fff;">
                    <span>Đóng</span>
                </button>
            </div>
        </div>
    </div>
</div>
<script src="assets/js/jquery.2.1.1.min.js"></script>

<script>
    function assignmentBuilding(buildingId){
        $('#assignmentBuildingModal').modal();
        loadStaff(buildingId);
        $('#buildingId').val(buildingId);
    }
    function loadStaff(buildingId){
        $.ajax({
            type: "GET",
            url: "${buildingAPI}/" + buildingId + '/staffs',
            dataType: "JSON",
            success: function(response) {
                var row = '';
                $.each(response.data, function (index, item){
                    row += '<tr>';
                    row += '<td class="text-center"><input type="checkbox" value=' + item.staffId + ' id="checkbox_' + item.staffId + '" class = "check-box-element"' + item.checked + '/></td>';
                    row += '<td class="text-center">' + item.fullName + '</td>';
                    row += '</tr>';
                });
                $('#staffList tbody').html(row);
                console.info("success")
            },
            error: function(response){
                console.log("Fail!")
                window.location.href = "<c:url value="/admin/building-list?message=error" />"
            }
        });
    }
    $('#btnAssignmentBuildingModal').click(function(e){
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        if(data['staffs'] !== ''){
            UpdateAssignmentBuilding(data);
        }
        console.log("Ok");
    })
    function UpdateAssignmentBuilding(data){
        $.ajax({
            type: "POST",
            url: "${buildingAPI}/" + 'assignment',
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function(response) {
                window.location.href = "<c:url value="/admin/building-list"/>"
                console.info("success")
            },
            error: function(response){
                console.info("Giao không thành công")
                window.location.href = "<c:url value="/admin/building-list" />"
            }
        });
    }

    $('#btnSearchBuilding').click(function (e){
        $('#listForm').submit();
        e.preventDefault();
    })
    function deleteBuilding(data, e){
        var buildingId = [data];
        DeleteBuilding(buildingId);
        alert('Xóa thành công!');
        window.location.href = "/admin/building-list";
        e.preventDefault();
    }
    $('#btnDeleteBuilding').click(function(e){
        e.preventDefault();
        var buildingIds = $('#tableList').find('tbody input[type=checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        DeleteBuilding(buildingIds)
        if(buildingIds !== ""){
            alert('Xóa thành công!');
            window.location.href = "/admin/building-list";
        }
        else{
            alert("Vui lòng chọn tòa nhà cần xóa!")
        }
    })
    function DeleteBuilding(data){
        $.ajax({
            type: "Delete",
            url: "${buildingAPI}/" + data.join(','),
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function(response) {
                $('#h11').html('Success!')
            },
            error: function(response){
                console.log("Fail!")
            }
        });
    }
</script>
</body>
</html>
