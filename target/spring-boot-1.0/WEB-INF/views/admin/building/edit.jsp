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
                    <form:form id="listForm" action="${buildingEditURL}" method="get" modelAttribute="buildingEdit">
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
                                    <label class="col-sm-2 no-padding-right">Hình đại diện</label>
                                    <input class="col-sm-2 no-padding-right" type="file" id="uploadImage"/>
                                    <div class="col-sm-8">
                                        <c:if test="${not empty buildingEdit.avatar}">
                                            <c:set var="imagePath" value="/repository${buildingEdit.avatar}"/>
                                            <img src="${imagePath}" id="viewImage" width="300px" height="300px" style="overflow: hidden; object-fit: cover">
                                        </c:if>
                                        <c:if test="${empty buildingEdit.avatar}">
                                            <img src="/admin/image/default.png" id="viewImage" width="300px" height="300px">
                                        </c:if>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-9">
                                        <c:if test="${not empty buildingEdit.id}">
                                            <button style="margin-right: 10px;" id="btnAddOrUpdateBuilding">
                                                <i class="fa-regular fa-pen-to-square"></i>
                                                <span> Cập nhập tòa nhà</span>
                                            </button>
                                            <button id="btnCancel">
                                                <i class="fa-solid fa-trash-can"></i>
                                                <span > Hủy thao tác</span>
                                            </button>
                                        </c:if>
                                        <c:if test="${empty buildingEdit.id}">
                                            <button style="margin-right: 10px;" id="btnAddOrUpdateBuilding">
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
        var imageBase64 = '';
        var imageName = '';

        $('#btnAddOrUpdateBuilding').click(function(e){
            var data={};
            var typeCode=[];
            var formData=$('#listForm').serializeArray();
            $.each(formData,function(i,v){
                if(v.name != 'typeCode'){
                    data[""+v.name+""]=v.value;
                }
                else{
                    typeCode.push(v.value);
                }
                if ('' !== imageBase64) {
                    data['imageBase64'] = imageBase64;
                    data['imageName'] = imageName;
                }
            })

            data['typeCode'] = typeCode;
            console.log("OK")
            if (data['typeCode'] != "") {
                AddOrUpdateBuilding(data);
                if (data['id'] != "") {
                    alert('Cập nhật thành công!');
                } else {
                    alert('Thêm mới thành công!');
                }
                window.location.href = "/admin/building-list";
                e.preventDefault();
            } else {
                if (data['id'] != "") {
                    alert("Vui lòng điền đầy đủ thông tin!")
                    window.location.href = "/admin/building-edit-"+ data['id'] + "?typeCode=require";
                } else {
                    alert("Vui lòng điền đầy đủ thông tin!")
                    window.location.href = "/admin/building-edit?typeCode=require";
                }
                e.preventDefault();
            }
        });
        function AddOrUpdateBuilding(data){
            $.ajax({
                type:"POST",
                url: '/api/building',
                data: JSON.stringify(data),
                contentType:"application/json",
                dataType:"JSON",
                success: function(response) {
                },
                error: function(response){
                    console.log("Fail!")
                }
            });
        }
        $('#uploadImage').change(function (event) {
            var reader = new FileReader();
            var file = $(this)[0].files[0];
            reader.onload = function(e){
                imageBase64 = e.target.result;
                imageName = file.name; // ten hinh khong dau, khoang cach. Dat theo format sau: a-b-c
            };
            reader.readAsDataURL(file);
            openImage(this, "viewImage");
        });

        function openImage(input, imageView) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#' +imageView).attr('src', reader.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }


        $('#btnCancel').click(function (e){
            window.location.href = "/admin/building-list"
            e.preventDefault();
        })

    </script>
</body>
</html>
