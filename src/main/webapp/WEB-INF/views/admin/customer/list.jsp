<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var="formUrl" value="/admin/customer-list"/>
<c:url var="customerAPI" value="/api/customer"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>
        <%--<spring:message code="label.user.list"/>--%>
        Danh sách người dùng
    </title>
</head>

<body>
<div class="main-content">

        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try {
                        ace.settings.check('breadcrumbs', 'fixed')
                    } catch (e) {
                    }
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="<c:url value="/admin/home"/>" style="color: #000">
                                <%--<spring:message code="label.home"/>--%>
                            Trang chủ
                        </a>
                    </li>
                    <li class="active">
                            <%--<spring:message code="label.user.list"/>--%>
                        Danh sách khách hàng
                    </li>
                </ul>
                <!-- /.breadcrumb -->
            </div>
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <c:if test="${messageResponse!=null}">
                            <div class="alert alert-block alert-${alert}">
                                <button type="button" class="close" data-dismiss="alert">
                                    <i class="ace-icon fa fa-times"></i>
                                </button>
                                    ${messageResponse}
                            </div>
                        </c:if>
                        <form:form modelAttribute="modelSearch" action="${formUrl}" id="listForm" method="GET">
                            <div class="row">
                            <div class="col-xs-12">
                                <div class="widget-box table-filter">
                                    <div class="widget-header">
                                        <h4 class="widget-title" style="color: #000000">
                                                <%--<spring:message code="label.search"/>--%>
                                            Tìm kiếm khách hàng
                                        </h4>
                                        <div class="widget-toolbar">
                                            <a href="#" data-action="collapse">
                                                <i class="ace-icon fa fa-chevron-up"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <div class="form-horizontal">
                                                <div class="form-group" style="margin-top: 15px">
                                                    <label class="col-sm-2 control-label">
                                                            <%--<spring:message code="label.search.value"/>--%>
                                                        Tên khách hàng
                                                    </label>
                                                    <div class="col-sm-5">
                                                        <div class="fg-line">
                                                            <form:input path="fullName" cssClass="form-control input-sm"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">
                                                            <%--<spring:message code="label.search.value"/>--%>
                                                        Số điện thoại
                                                    </label>
                                                    <div class="col-sm-5">
                                                        <div class="fg-line">
                                                            <form:input path="phone" cssClass="form-control input-sm"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">
                                                            <%--<spring:message code="label.search.value"/>--%>
                                                        Email khách hàng
                                                    </label>
                                                    <div class="col-sm-5">
                                                        <div class="fg-line">
                                                            <form:input path="email" cssClass="form-control input-sm"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <security:authorize access="hasRole('MANAGER')">
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">
                                                            <%--<spring:message code="label.search.value"/>--%>
                                                        Chọn nhân viên
                                                    </label>
                                                        <div class="col-sm-2">
                                                            <form:select class="form-control" name="staffId" path="staffId">
                                                                <form:option value="">---Chọn nhân viên---</form:option>
                                                                <form:options items="${listStaffs}"/>
                                                            </form:select>
                                                        </div>
                                                </div>
                                                </security:authorize>

                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label"></label>
                                                    <div class="col-xs-8">
                                                        <button id="btnSearchCustomer" type="submit" style="background-color: #5DCC91; color: #fff; border: #5DCC91;">
                                                            <i class="fa-solid fa-magnifying-glass"></i>
                                                            <span> Tìm kiếm</span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <security:authorize access="hasRole('MANAGER')">
                                <div class="table-btn-controls">
                                    <div class="pull-right tableTools-container">
                                        <div class="dt-buttons btn-overlap btn-group">
                                            <a flag="info"
                                               class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
                                               data-toggle="tooltip"
                                                <%--title='<spring:message code="label.user.add"/>'--%>
                                               title="Thêm người dùng"
                                               href='<c:url value="/admin/customer-edit"/>'>
                                                <span>
                                                    <i class="fa fa-plus-circle bigger-110 purple"></i>
                                                </span>
                                            </a>

                                                <button id="btnDeleteCustomer" type="button"
                                                        class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
                                                        data-toggle="tooltip"
                                                        title="Xóa người dùng">
                                                <span>
                                                    <i class="fa fa-trash-o bigger-110 pink"></i>
                                                </span>
                                                </button>

                                        </div>
                                    </div>
                                </div>
                                </security:authorize>
                            </div>
                        </div>
                        </form:form>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="table-responsive">
                                    <display:table name="customerList" id="tableList" pagesize="4" requestURI="${formUrl}"
                                                   class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                                   style="margin: 3em 0 1.5em; text-align: center;">
                                        <display:column title="<fieldset class='form-group'>
												        <input type='checkbox' id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell"
                                                        headerClass="center select-cell">
                                            <fieldset>
                                                <input type="checkbox" name="checkList" value="${tableList.id}"
                                                       id="checkbox_${tableList.id}" class="check-box-element"/>
                                            </fieldset>
                                        </display:column>
                                        <display:column title="Tên khách hàng" property="fullName" headerClass="center"/>
                                        <display:column title="Số điện thoại" property="phone" headerClass="center"/>
                                        <display:column title="Email" property="email" headerClass="center"/>
                                        <display:column title="Nhu cầu" property="demand" headerClass="center"/>
                                        <display:column title="Người thêm" property="managementStaff" headerClass="center"/>
                                        <display:column title="Ngày thêm" property="createdDate" headerClass="center"/>
                                        <display:column title="Tình trạng" property="status" headerClass="center"/>
                                        <display:column title="Thao tác" headerClass="center">
                                            <div class="hidden-sm hidden-xs btn-group">
                                                <security:authorize access="hasRole('MANAGER')">
                                                    <button class="btn btn-xs btn-success" title="Giao khách hàng" onclick="assignmentCustomer(${tableList.id})" name="customerId">
                                                        <i class="ace-icon glyphicon glyphicon-list"></i>
                                                    </button>
                                                </security:authorize>
                                                <a class="btn btn-xs btn-info" title="Sửa thông tin"  href="/admin/customer-edit-${tableList.id}">
                                                    <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                                </a>
                                                <security:authorize access="hasRole('MANAGER')">
                                                    <button class="btn btn-xs btn-danger" title="Xóa thông tin" onclick="deleteCustomer(${tableList.id})">
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
                    </div>
                </div>
            </div>
        </div>

</div>
<div class="modal" tabindex="-1" role="dialog" id="assignmentCustomerModal">
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
                <input type="hidden" id="customerId" value="" name="customerId">
            </div>
            <div class="modal-footer">
                <button type="button" title="Giao tòa nhà" id="btnAssignmentAssignmentModal" style="background-color: #5DCC91; border: 1px solid #fff; color: #fff;">
                    <span>Giao khách hàng</span>
                </button>
                <button type="button" title="Đóng" data-dismiss="modal" style=" border: 1px solid #000; color: #000; background-color: #fff;">
                    <span>Đóng</span>
                </button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function assignmentCustomer(customerId){
        $('#assignmentCustomerModal').modal();
        loadStaff(customerId);
        $('#customerId').val(customerId);
    }
    function loadStaff(customerId){
        $.ajax({
            type: "GET",
            url: "${customerAPI}/" + customerId + '/staffs',
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
            }
        });
    }
    $('#btnAssignmentAssignmentModal').click(function(e){
        e.preventDefault();
        var data = {};
        data['customerId'] = $('#customerId').val();
        var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        if(data['staffs'] !== ''){
            UpdateAssignmentCustomer(data);
        }
        console.log("Ok");
    })
    function UpdateAssignmentCustomer(data){
        $.ajax({
            type: "POST",
            url: "${customerAPI}/" + 'assignment',
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function(response) {
                window.location.href = "<c:url value="/admin/customer-list"/>"
                console.info("success")
            },
            error: function(response){
                console.info("Giao không thành công")
                window.location.href = "<c:url value="/admin/customer-list"/>"
            }
        });
    }
    $('#btnSearchCustomer').click(function (e){
        $('#listForm').submit();
        e.preventDefault();
    })
    function deleteCustomer(data, e){
        var customerId = [data];
        DeleteCustomer(customerId);
        alert('Xóa thành công!');
        window.location.href = "/admin/customer-list";
        e.preventDefault();
    }
    $('#btnDeleteCustomer').click(function(e){
        e.preventDefault();
        var customerIds = $('#tableList').find('tbody input[type=checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        DeleteCustomer(customerIds)
        if(customerIds != ''){
            alert('Xóa thành công!');
            window.location.href = "/admin/customer-list";
        }
        else{
            alert("Vui lòng chọn khách hàng cần xóa!")
        }
    })
    function DeleteCustomer(data){
        $.ajax({
            type: "DELETE",
            url: "/api/customer/" + data.join(','),
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