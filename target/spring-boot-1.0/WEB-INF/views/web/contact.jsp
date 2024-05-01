<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var="contactUrl" value="/lien-he"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên hệ</title>
</head>
<body>
<div class="page-wrapper">
    <div class="intro text-center mb-5">
        <div class="title-page">Liên hệ</div>
        <div class="row">
            <div class="col-xs-12 a-left">
                <ul class="desc-intro">
                    <li class="home">
                        <a href="./trang-chu"><span style="color:#fff">Trang chủ</span></a>
                        <span class="mx-1" style="color:#fff"> / </span>
                    </li>
                    <li class="intro-item"><span>Liên hệ</span></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- CONTENT  -->
    <div class="map">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="google-map margin-bottom-30">
                        <div class="maps_iframe">
                            <iframe style="width: 100%;"
                                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.577731862711!2d106.7695372142139!3d10.850261760047032!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f8d0e993b05%3A0x8abf4c480f8b822b!2zOTcgTWFuIFRoacOqbiwgUGjDuiBIaeG7h3AgSMaw4budYywgbmjhuq10IHPDumMgVHJ1w6JuIFbEg25nLCBWaeG7h3QgTmFt!5e0!3m2!1sen!2s!4v1652520257601!5m2!1sen!2s"
                                    width="600" height="450" style="border:0;" allowfullscreen=""
                                    loading="lazy">
                            </iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="box-lienhe mt-5">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-6">
                    <h2 class="title-lienhe"><strong>Công ty cổ phần bất động sản SkyLand</strong></h2>
                    <div class="desc-lienhe">
                        <p>Được thành lập vào ngày 20/08/2008 với niềm đam mê và khát vọng thành công trong lĩnh vực
                            bất động sản. Nhờ chiến lược rõ ràng và hướng đi đúng, SkyLand đã nhanh chóng phát triển
                            và đạt được những thành công nhất định.</p>
                        <ul class="margin-bottom-15 link" style="list-style-type: none;">
                            <li>
                                <span class="block_fonticon"><i class="fa fa-map-marker icon-lienhe"></i></span>
                                <span class="title-li"> 46 Man Thiện, TP. Thủ Đức, TP. HCM</span>
                            </li>
                            <li>
                                <span class="block_fonticon"><i class="fa fa-mobile icon-lienhe"></i></span>
                                <span class="title-li">
                                        Hotline: <a style="color: #434a6e;" class="fone" href="">0922227</a>

                                    </span>
                            </li>
                            <li>
                                <span class="block_fonticon"><i class="fa fa-envelope icon-lienhe"></i></span>
                                <span class="title-li">Email: <a style="color: #434a6e;"
                                                                 href="">vsh@gmail.com</a></span>
                            </li>
                        </ul>
                    </div>
                </div>
                    <div class="col-12 col-md-6">
                        <h2 class="title-lienhe"><strong>Liên hệ với chúng tôi</strong></h2>
                        <form:form id="listForm" action="${contactUrl}" method="get" modelAttribute="customerContact">
                            <div role="form" class="form-horizontal" id="form-edit">
                                <div class="row">
                                    <div class="col">
                                        <label for="fullName">Họ và tên:</label>
                                        <form:input path="fullName" id="fullName" class="form-control mb-3" name="fullName"/>
                                    </div>
                                    <div class="col">
                                        <label for="email">Email:</label>
                                        <form:input path="email" id="email" class="form-control mb-3" name="email"/>
                                    </div>
                                </div>
                                <label for="phone">Số điện thoại:</label>
                                <form:input path="phone" id="phone" class="form-control mb-3" name="phone"/>
                                <label for="content">Nội dung:</label>
                                <form:input path="content" id="content" class="form-control" name="content"/>
                                <button class="btn btn-primary px-4 mt-3" id="sendInform">Gửi liên hệ</button>
                            </div>
                        </form:form>

                    </div>
<%--                </div>--%>
            </div>
        </div>
    </div>
    <!-- FOOTER  -->
    <footer class="footer">
        <div class="container">
            <div class="top-footer text-center mt-0">
                <div class="logo logo-footer pt-5">
                    <a href="./ViewHome.html"><img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/logo_footer.png?1676257083798" alt="logo-footer"></a>
                    <p class="desc-logo-footer mt-3">Với hơn 10 năm kinh nghiệm, SkyLand tự hào là sàn
                        mua
                        bán, giao dịch và quảng cáo
                        bất động sản hàng đầu tại Việt Nam</p>
                    <div class="item-footer mt-5">
                        <div class="row">
                            <div class="col-12 col-md-4 text-center">
                                <div class="icon-footer">
                                    <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/place_maps.png?1676257083798" alt="">
                                </div>
                                <div class="content-center-footer">
                                    <p class="mb-1 mt-3">Trụ sở chính</p>
                                    <p class="desc-footer">Số 46 Man Thiện, TP Thủ Đức, TP HCM</p>
                                </div>
                            </div>
                            <div class="col-12 col-md-4 text-center">
                                <div class="icon-footer">
                                    <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/place_phone.png?1676257083798" alt="">
                                </div>
                                <div class="content-center-footer">
                                    <p class="mb-1 mt-3">Hotline</p>
                                    <p class="desc-footer"><a class="a-text" href="#">098828</a></p>
                                </div>
                            </div>
                            <div class="col-12 col-md-4 text-center">
                                <div class="icon-footer">
                                    <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/place_email.png?1676257083798g" alt="">
                                </div>
                                <div class="content-center-footer">
                                    <p class="mb-1 mt-3">Email</p>
                                    <p class="desc-footer"><a class="a-text" href="#">vsh@gmail.com</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <div class="border-bottom mb-5 mt-4"></div>
                </div>
            </div>
            <div class="bottom-footer">
                <div class="row">
                    <div class="col-12 col-md-3">
                        <h4 class="title-item-bottom-footer">Thông tin công ty</h4>
                        <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                            chủ</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                            sản</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Tin tức</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Liên hệ</a></p>
                    </div>
                    <div class="col-12 col-md-3">
                        <h4 class="title-item-bottom-footer">Chính sách hoạt động</h4>
                        <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                            chủ</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                            sản</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Tin tức</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Liên hệ</a></p>
                    </div>
                    <div class="col-12 col-md-3">
                        <h4 class="title-item-bottom-footer">Hỗ trợ khách hàng</h4>
                        <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                            chủ</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                            sản</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Tin tức</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Liên hệ</a></p>
                    </div>
                    <div class="col-12 col-md-3">
                        <h4 class="title-item-bottom-footer">Kết nối với chúng tôi</h4>
                        <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                            chủ</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                            sản</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Tin tức</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Liên hệ</a></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="bottom-footer-2">
            <div class="text-center desc-bottom-footer-2">@ Bản quyền thuộc về Happy Team |
                Cung cấp bởi <a class="a-text group-name" href="#">HappyTeam</a></div>
        </div>
    </footer>
</div>
<!-- Thêm thẻ script để tải jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Đưa đoạn mã JavaScript vào thẻ script sau khi thư viện jQuery đã được tải -->
<script type="text/javascript">
    $(document).ready(function(){
        $('#sendInform').click(function(e){
            var data={};
            var formData=$('#listForm').serializeArray();
            $.each(formData,function(i,v){
                data[""+v.name+""]=v.value;
            });
            AddCustomer(data);
            alert("Đã gửi liên hệ thành công!")
            e.preventDefault();
            console.log("OK");
        });

        function AddCustomer(data){
            $.ajax({
                type: "POST",
                url: '/api/customer',
                data: JSON.stringify(data),
                contentType: "application/json",
                dataType: "JSON",
                success: function (response) {
                    console.log("Successfully!");
                },
                error: function (response) {
                    console.log("Fail!");
                }
            });
        }
    });
</script>

</body>
</html>
