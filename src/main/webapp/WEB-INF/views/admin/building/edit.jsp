<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var="buildingAPI" value="/api/building"></c:url>
<c:url var="buildingEditURL" value="/admin/building-edit"></c:url>
<html lang="en">
<head>
    <form:form modelAttribute="buildingEdit" method="get" id="listForm">
        <c:if test="${empty buildingEdit.id}">
            <title>Thêm tòa nhà</title>
        </c:if>
        <c:if test="${not empty buildingEdit.id}">
            <title>Chỉnh sửa tòa nhà</title>
        </c:if>
    </form:form>
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
                        <a href="#" style="color: #000;">Trang chủ</a>
                    </li>
                    <li class="active">Dashboard</li>
                </ul><!-- /.breadcrumb -->

            </div>

            <div class="page-content">
                <div class="page-header">
                    <form:form modelAttribute="buildingEdit" method="get" id="list-form">
                        <c:if test="${empty buildingEdit.id}">
                            <h1 style="font-size: 26px; color: #000; font-weight: 500; margin-left: 20px">
                                <i class="fa-solid fa-plus"></i>
                                Thêm tòa nhà
                            </h1>
                        </c:if>
                        <c:if test="${not empty buildingEdit.id}">
                            <h1 style="font-size: 26px; color: #000; font-weight: 500; margin-left: 20px">
                                <i class="fa-solid fa-pen-to-square"></i>
                                Chỉnh sửa tòa nhà
                            </h1>
                        </c:if>
                    </form:form>
                </div><!-- /.page-header -->


                <div class="row" style="font-family: 'Inria Serif', sans-serif;">
                    <form:form id="listForm" action="${buildingEditURL}" method="post" modelAttribute="buildingEdit" enctype="multipart/form-data">
                        <div class="col-xs-12">
                            <div role="form" class="form-horizontal" id="form-edit">
                                <div class="form-group">
                                    <label class="col-xs-2">Tên tòa nhà</label>
                                    <div class="col-xs-9">
                                        <form:input path="name" class="form-control" name="name"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Quận</label>
                                    <div class="col-xs-2">
                                        <form:select class="form-control" path="district">
                                            <form:option value="">---Chọn Quận---</form:option>
                                            <form:options items="${district}"></form:options>
                                        </form:select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Phường</label>
                                    <div class="col-xs-9">
                                        <form:input path="ward" class="form-control" name="ward"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Đường</label>
                                    <div class="col-xs-9">
                                        <form:input path="street" class="form-control" name="street"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Kết cấu</label>
                                    <div class="col-xs-9">
                                        <form:input path="structure" name="structure" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Số tầng hầm</label>
                                    <div class="col-xs-9">
                                        <form:input path="numberOfBasement" name="numberOfBasement" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Diện tích sàn</label>
                                    <div class="col-xs-9">
                                        <form:input path="floorArea" name="floorArea" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Hướng</label>
                                    <div class="col-xs-9">
                                        <form:input path="direction" name="direction" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Hạng</label>
                                    <div class="col-xs-9">
                                        <form:input path="level" name="level" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Diện tích thuê</label>
                                    <div class="col-xs-9">
                                        <form:input path="rentArea" name="rentArea" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Giá thuê</label>
                                    <div class="col-xs-9">
                                        <form:input path="rentPrice" name="rentPrice" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Mô tả giá</label>
                                    <div class="col-xs-9">
                                        <form:input path="rentPriceDescription" name="rentPriceDescription" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Phí dịch vụ</label>
                                    <div class="col-xs-9">
                                        <form:input path="serviceFee" name="serviceFee" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Phí ô tô</label>
                                    <div class="col-xs-9">
                                        <form:input path="carFee" name="carFee" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Phí mô tô</label>
                                    <div class="col-xs-9">
                                        <form:input path="motoFee" name="motorbikeFee" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Phí ngoài giờ</label>
                                    <div class="col-xs-9">
                                        <form:input path="overtimeFee" name="overtimeFee" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Tiền điện</label>
                                    <div class="col-xs-9">
                                        <form:input path="electricityFee" name="electricityFee" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Đặt cọc</label>
                                    <div class="col-xs-9">
                                        <form:input path="deposit" name="deposit" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Thanh toán</label>
                                    <div class="col-xs-9">
                                        <form:input path="payment" name="payment" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Thời hạn thuê</label>
                                    <div class="col-xs-9">
                                        <form:input path="rentTime" name="rentTime" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Thời gian trang trí</label>
                                    <div class="col-xs-9">
                                        <form:input path="decorationtime" name="decorationTime" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Tên quản lý</label>
                                    <div class="col-xs-9">
                                        <form:input path="managerName" name="managerName" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">SĐT quản lý</label>
                                    <div class="col-xs-9">
                                        <form:input path="managerPhone" name="managerPhoneNumber" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Phí môi giới</label>
                                    <div class="col-xs-9">
                                        <form:input path="brokerageFee" name="brokerageFee" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Loại tòa nhà</label>
                                    <div class="col-xs-9">
                                        <form:checkboxes path="typeCode" items="${buildingType}" id="listCode"></form:checkboxes>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-2">Ghi chú</label>
                                    <div class="col-xs-9">
                                        <form:input path="note" name="note" class="form-control"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-2">Ảnh tòa nhà</label>
                                    <div class="col-xs-9">
                                        <input type="file" id="imageInput" name="image" accept="image/*" onchange="previewImage(event)"/>
                                        <div id="imagePreviewContainer" style="margin-top: 10px;">
                                            <img id="imagePreview" alt="Preview" style="object-fit: cover; overflow: hidden">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-9">
                                        <c:if test="${not empty buildingEdit.id}">
                                            <button type="submit" style="margin-right: 10px;" id="btnAddOrUpdateBuilding">
                                                <i class="fa-regular fa-pen-to-square"></i>
                                                <span> Cập nhập tòa nhà</span>
                                            </button>
                                            <button id="btnCancel">
                                                <i class="fa-solid fa-trash-can"></i>
                                                <span > Hủy thao tác</span>
                                            </button>
                                        </c:if>
                                        <c:if test="${empty buildingEdit.id}">
                                            <button type="submit" style="margin-right: 10px;" id="btnAddOrUpdateBuilding">
                                                <i class="ace-icon glyphicon glyphicon-plus"></i>
                                                <span> Thêm tòa nhà</span>
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
                    <form:hidden path="id" id="buildingId"></form:hidden>
                    </form:form>
                </div>

            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
    <script src="assets/js/jquery.2.1.1.min.js"></script>

    <script>
        $('#btnAddOrUpdateBuilding').click(function(e){
            var data = {};
            var typeCode = [];
            var formData = new FormData();
            $('#listForm').serializeArray().forEach(function(item) {
                if (item.name !== 'typeCode') {
                    data[item.name] = item.value;
                } else {
                    typeCode.push(item.value);
                }
                formData.append(item.name, item.value);
            });
            data['typeCode'] = typeCode;
            console.log("OK")
            if (data['typeCode'] != "") {
                var file = $("#imageInput")[0].files[0];
                formData.append("image", file);
                AddOrUpdateBuilding(data, formData);
                if (data['id'] != "") {
                    alert('Cập nhật thành công!');
                } else {
                    alert('Thêm mới thành công!');
                }
                window.location.href = "/admin/building-list";
                e.preventDefault();
            } else {
                if (data['id'] != "") {
                    alert("Thông tin chưa chính xác!")
                    window.location.href = "/admin/building-edit-"+ data['id'] + "?typeCode=require";
                } else {
                    alert("Thông tin chưa chính xác!")
                    window.location.href = "/admin/building-edit?typeCode=require";
                }
                e.preventDefault();
            }
        });

        function AddOrUpdateBuilding(data, formData){
            $.ajax({
                type: "POST",
                url: "${buildingEditURL}",
                data: formData,
                contentType: false,
                processData: false,
                dataType: "JSON",
                success: function(response) {

                },
                error: function(response){
                    console.log("Fail!")
                }
            });
        }

        $('#btnCancel').click(function (e){
            window.location.href = "/admin/building-list"
            e.preventDefault();
        })
        function previewImage(event) {
            var input = event.target;
            var preview = document.getElementById('imagePreview');
            var reader = new FileReader();
            reader.onload = function () {
                preview.src = reader.result;
            };
            reader.readAsDataURL(input.files[0]);
        }
    </script>
</body>
</html>
