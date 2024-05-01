<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var="customerURL" value="/admin/customer-edit"/>
<html lang="en">
<head>
    <form:form modelAttribute="customerEdit" method="get" id="listForm">
        <c:if test="${empty customerEdit.id}">
            <title>Thêm khách hàng</title>
        </c:if>
        <c:if test="${not empty customerEdit.id}">
            <title>Thông tin khách hàng</title>
        </c:if>
    </form:form>
</head>

<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check("breadcrumbs", "fixed");
                } catch (e) { }
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="<c:url value="/admin/customer-list"/>" style="color: #000">Trang chủ</a>
                </li>
                <c:if test="${empty customerEdit.id}">
                    <li class="active">Thêm mới khách hàng</li>
                </c:if>
                <c:if test="${not empty customerEdit.id}">
                    <li class="active">Thông tin khách hàng</li>
                </c:if>
            </ul>
            <!-- /.breadcrumb -->
        </div>

        <div class="page-content" style="margin-left: 50px">
            <div class="page-header">
                <form:form modelAttribute="customerEdit" method="get" id="list-form">
                    <c:if test="${empty customerEdit.id}">
                        <h1 style="
                    font-size: 26px;
                    color: #000;
                    font-weight: 500;
                    margin-left: 0;
                  ">
                            Thêm khách hàng
                        </h1>
                    </c:if>
                    <c:if test="${not empty customerEdit.id}">
                        <h1 style="font-size: 26px; color: #000; font-weight: 500">
                            <i class="fa-solid fa-pen-to-square"></i> Thông tin khách hàng
                        </h1>
                    </c:if>
                </form:form>
            </div>
            <!-- /.page-header -->

            <div class="row" style="font-family: 'Inria Serif', sans-serif">
                <form:form id="listForm" action="${customerURL}" method="get"
                           modelAttribute="customerEdit">
                    <div class="col-xs-12">
                        <div role="form" class="form-horizontal" id="form-edit">
                            <div class="form-group" style="margin-top: 15px">
                                <label class="col-xs-2">Tên khách hàng <span class="text-danger">*</span></label>
                                <div class="col-xs-5">
                                    <form:input path="fullName" class="form-control"
                                                name="fullName" required="required"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-2">Số điện thoại <span class="text-danger">*</span></label>
                                <div class="col-xs-5">
                                    <form:input path="phone" class="form-control" name="phone" required="required"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-2">Email <span class="text-danger">*</span></label>
                                <div class="col-xs-5">
                                    <form:input path="email" class="form-control" name="email" required="required"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-2">Tên công ty <span class="text-danger">*</span></label>
                                <div class="col-xs-5">
                                    <form:input path="companyName" name="companyName"
                                                class="form-control" required="required"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-2">Nhu cầu <span class="text-danger">*</span></label>
                                <div class="col-xs-5">
                                    <form:input path="demand" name="demand" class="form-control" required="required"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-2">Tình trạng <span class="text-danger">*</span></label>
                                <div class="col-xs-2">
                                    <form:select  class="form-control" path="status">
                                        <form:option value="">---Chọn tình trạng---</form:option>
                                        <form:options items="${statusType}"/>
                                    </form:select>
                                </div>
                            </div>

                        <form:hidden path="createdBy" name="demand" class="form-control" />
                            <form:hidden path="createdDate" name="demand" class="form-control" />
                            <div class="form-group">
                                <div class="col-xs-2"></div>
                                <div class="col-xs-9">
                                    <c:if test="${not empty customerEdit.id}">
                                        <button style="margin-right: 10px"
                                                id="btnAddOrUpdateCustomer">
                                            <i class="fa-regular fa-pen-to-square"></i>
                                            <span> Cập nhật khách hàng</span>
                                        </button>
                                        <button id="btnCancel">
                                            <i class="fa-solid fa-trash-can"></i>
                                            <span> Hủy thao tác</span>
                                        </button>
                                    </c:if>
                                    <c:if test="${empty customerEdit.id}">
                                        <button style="margin-right: 10px"
                                                id="btnAddOrUpdateCustomer">
                                            <i class="ace-icon glyphicon glyphicon-plus"></i>
                                            <span> Thêm khách hàng</span>
                                        </button>
                                        <button id="btnCancel">
                                            <i class="fa-solid fa-trash-can"></i>
                                            <span> Hủy thao tác</span>
                                        </button>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <form:hidden path="id" id="customerId"/>
                </form:form>
            </div>
            <c:if test="${not empty customerEdit.id}">
                <c:forEach var="item" items="${transactionType}">
                    <div class="col-xs-12" style="margin-top: 50px">
                        <h3 class="header smaller lighter">${item.value}</h3>
                        <button class="btn btn-success" onclick="transactionType('${item.key}', ${customerEdit.id})" style="background-color: #5DCB90 !important; border-color: #5DCB90 !important">
                            <i class="fa-solid fa-paper-plane"></i>
                            Add
                        </button>
                    </div>
                    <c:if test="${item.key == 'CSKH'}">
                        <div class="col-xs-12">
                            <table class="table table-striped table-bordered table-hover" style="text-align: center;">
                                <thead>
                                <tr>
                                    <th>Ngày tạo</th>
                                    <th>Người tạo</th>
                                    <th>Ngày sửa</th>
                                    <th>Người sửa</th>
                                    <th>Chi tiết giao dịch</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="transaction" items="${transactionDTOS}">
                                    <c:if test="${transaction.code == 'CSKH'}">
                                        <tr>
                                            <td>${transaction.createdDate}</td>
                                            <td>${transaction.createdBy}</td>
                                            <td>${transaction.modifiedDate}</td>
                                            <td>${transaction.modifiedBy}</td>
                                            <td>${transaction.note}</td>
                                            <td>
                                                <button class="btn btn-xs btn-info" title="Sửa thông tin" onclick="UpdateTransaction(${transaction.id})">
                                                    <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>

                    <c:if test="${item.key == 'DDX'}">
                        <div class="col-xs-12">
                            <table class="table table-striped table-bordered table-hover" style="text-align: center;">
                                <thead>
                                <tr>
                                    <th>Ngày tạo</th>
                                    <th>Người tạo</th>
                                    <th>Ngày sửa</th>
                                    <th>Người sửa</th>
                                    <th>Chi tiết giao dịch</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="transaction" items="${transactionDTOS}">
                                    <c:if test="${transaction.code == 'DDX'}">
                                        <tr>
                                            <td>${transaction.createdDate}</td>
                                            <td>${transaction.createdBy}</td>
                                            <td>${transaction.modifiedDate}</td>
                                            <td>${transaction.modifiedBy}</td>
                                            <td>${transaction.note}</td>
                                            <td>
                                                <button class="btn btn-xs btn-info" title="Sửa thông tin" onclick="UpdateTransaction(${transaction.id})">
                                                    <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </c:forEach>
            </c:if>
        </div>
        <div class="modal fade" id="transactionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document" modelAttribute="tr">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Nhập giao dịch</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row" style="margin-top:5px">
                                <label for="note" class="col-sm-3 col-form-label" style="margin-top: 7px;">Chi tiết giao dịch</label>
                                <div class="col-sm-9" id="noteCheck">
                                    <input class="form-control" id="note" name="note"/>
                                </div>
                            </div>
                            <input type="hidden" name="customerId" id="customerId" value="">
                            <input type="hidden" name="code" id="code" value="">
                            <input type="hidden" name="id" id="id" value="">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success" id="btnAddTransaction">Thêm giao dịch</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        </div>
                    </div>
                </div>
            </div>

        <!-- /.page-content -->
    </div>
</div>
<!-- /.main-content -->
<script>
    $("#btnAddOrUpdateCustomer").click(function (e) {
        var data = {};
        var formData = $("#listForm").serializeArray();
        $.each(formData, function (i, v) {
            data[v.name] = v.value;
        });
        console.log("OK");
        if(data['fulName'] === "" || data['phone'] === ""){
            alert("Vui lòng điền đầy đủ thông tin!")
        }
        else{
            AddOrUpdateCustomer(data);
            if (data['id'] !== "") {
                alert('Cập nhật thành công!');
                window.window.location.href = "/admin/customer-list";
            } else {
                alert('Thêm mới thành công!');
                window.window.location.href = "/admin/customer-list";
            }
        }

        e.preventDefault();
    });
    function AddOrUpdateCustomer(data) {
        $.ajax({
            type: "POST",
            url: "/api/customer",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (response) { },
            error: function (response) {
                console.log("Fail!");
            },
        });
    }
    $("#btnCancel").click(function (e) {
        window.location.href = "/admin/customer-list";
        e.preventDefault();
    });
    function transactionType(code, customerId){
        $('#transactionModal').modal();
        $('#customerId').val(customerId);
        $('#code').val(code);
    }

    function UpdateTransaction(id){
        $('#transactionModal').modal();
        loadTransaction(id);
        $('#id').val(id);
    }
    function loadTransaction(transactionId){
        $.ajax({
            type: "GET",
            url: "/api/transaction/" + transactionId + '/note',
            dataType: "JSON",
            success: function(response) {
                var note = response.note;
                $('#note').val(note);
                console.info("success");
            },
            error: function(response){
                console.log("Fail!")
            }
        });
    }
    $('#transactionModal').on('hidden.bs.modal', function () {
        $('#note').val('');
    });

    $('#btnAddTransaction').on('click', function() {
        var note = $('#note').val();
        var customerId = $('#customerId').val();
        var code = $('#code').val();
        var id = $('#id').val();
        var data = {
            note: note,
            customerId: customerId,
            code: code,
            id: id
        };
        console.log("OK");
        if (data['note'] === ""){
            alert("Vui lòng điền đầy đủ thông tin!")
        }
        else{
            if(data['id'] === ""){
                AddTransaction(data);
                // window.window.location.href = "/admin/customer-edit-" + data['customerId'];
            }
            else{
                updateTransaction(data);
                // window.window.location.href = "/admin/customer-edit-" + data['customerId'];
            }
        }

    });
    function updateTransaction(data) {
        $.ajax({
            type: "PUT",
            url: "/api/transaction/" + data['id'],
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (response) {
                alert('Cập nhật thành công!');
                $('#transactionModal').modal('hide');
                window.window.location.href = "/admin/customer-edit-" + data['customerId'];
            },
            error: function (xhr, status, error) {
                console.error("Fail!", error);
            },
        });
    }
    function AddTransaction(data) {
        $.ajax({
            type: "POST",
            url: "/api/transaction",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (response) {
                alert('Thêm mới thành công!');
                $('#transactionModal').modal('hide');
                window.window.location.href = "/admin/customer-edit-" + data['customerId'];
            },
            error: function (xhr, status, error) {
                console.error("Fail!", error);
            },
        });
    }
</script>
</body>
</html>