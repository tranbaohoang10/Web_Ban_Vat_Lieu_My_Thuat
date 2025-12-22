<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giới thiệu</title>
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
          integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

</head>
<body>
<style>
    .container {
        width: 1200px;
        margin: auto;
    }

    /* Begin section-trangchinh-danhmuc-sanpham */
    #section-trangchinh-danhmuc-sanpham {
        background-color: #DBE8FF;
    }

    #section-trangchinh-danhmuc-sanpham .content {

        padding: 20px 0;
        margin-bottom: 30px;
    }

    #section-trangchinh-danhmuc-sanpham .content a {
        text-decoration: none;
    }

    #section-trangchinh-danhmuc-sanpham .content a {
        color: black;
    }

    #section-trangchinh-danhmuc-sanpham .content a:nth-child(2) {
        color: #17479D;
    }

    /* End section-trangchinh-danhmuc-sanpham */
    /* Begin section-main-gioi-thieu */
    .section-main-gioi-thieu {
        margin-bottom: 100px;
        margin-top: 50px;
    }

    .section-main-gioi-thieu .container {
        border: 1px solid #ddd;
        padding: 20px;
        border-radius: 20px;
        box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
        font-size: 18px;
        line-height: 1.4;
    }

    .section-main-gioi-thieu .container .header-main {
        font-size: 28px;
        color: black;
    }

    .section-main-gioi-thieu .container .description-main span {
        color: #17479D;
        font-weight: 600;
    }

    .section-main-gioi-thieu .container .img-main {
        display: block;
        width: 1100px;
        margin-left: auto;
        margin-right: auto;
    }

    .section-main-gioi-thieu .container .sub-header {
        font-size: 24px;
        color: black;
        margin-top: 30px;
        margin-bottom: 15px;
    }

    .section-main-gioi-thieu .container .sub-description span {
        color: #17479D;
        font-weight: 600;
    }

    .section-main-gioi-thieu .container .img-sub {

        display: block;
        margin-left: auto;
        margin-right: auto;
    }

    .section-main-gioi-thieu .container iframe {
        display: block;
        margin: 20px auto;
        width: 100%;
    }

    .link {
        display: flex;
        align-items: center;
        text-decoration: none;
        color: inherit;
    }

    /* End section-main-gioi-thieu */
</style>

<%@ include file="Header.jsp" %>
<!-- Begin section info mithuat -->
<div id="section-info-mithuat">
    <div class="container">
        <%@ include file="CategoryMenu.jsp" %>
    </div>
</div>
<!-- End section info mithuat -->
<!-- Begin section trang chinh - danh muc - san pham -->
<div id="section-trangchinh-danhmuc-sanpham">
    <div class="container">
        <div class="content">
            <a href>
                Trang chủ /
            </a>
            </a>
            <a href>
                Giới thiệu về thiên long /
            </a>
        </div>
    </div>
</div>
<!-- End section trang chinh - danh muc - san pham -->
<!-- Begin section main -->
<div class="section-main-gioi-thieu">
    <div class="container">
        <h1 class="header-main">Giới thiệu về Thiên Long</h1>
        <p class="description-main"><span>Thienlong.vn</span> là website thương
            mại điện tử thuộc Công ty Cổ phần Tập đoàn
            Thiên Long.
            Chúng tôi có kinh nghiệm
            hơn 36 năm trong ngành nghiên cứu, sản xuất và phân phối bút viết, văn
            phòng phẩm, học cụ và dụng cụ mỹ thuật.
            <span> Thienlong.vn</span> cung cấp các mặt hàng cho nhiều đối tượng
            khách hàng khác nhau, từ học sinh, sinh
            viên, giới văn
            phòng, từ sản phẩm cao cấp cho đến các loại bút viết phổ thông. Tất cả
            đều được tập đoàn Thiên Long nghiên cứu,
            sản xuất và phân phối.
        </p>
        <img src="./assets/images/logo/logo_gioithieu.png" alt class="img-main">
        <h2 class="sub-header">Định hướng hoạt động</h2>
        <p class="sub-description">
            <span>Thienlong.vn</span> ra đời với mong muốn mang sự tiện lợi cho
            khách hàng có nhu cầu văn phòng phẩm, học
            cụ,
            sản phẩm mỹ thuật có thể dễ dàng tiếp cận và chọn mua sản phẩm một cách
            nhanh chóng. Ngoài ra,
            <span>Thienlong.vn</span> còn
            mong muốn thay đổi thói quen tiêu dùng chọn mua văn phòng phẩm truyền
            thống, đem đến cho khách hàng một hệ thống
            cung cấp các sản phẩm văn phòng, giáo dục trực tuyến một nơi uy tín và
            đáng tin cậy.
            <br>
            <span>Thienlong.vn</span> đặt mục tiêu trở thành sàn thương mại điện tử
            hàng đầu Việt Nam chuyên về sản phẩm văn
            phòng, học cụ,
            dụng cụ mỹ thuật và tất cả các sản phẩm liên quan đến giáo dục.
        </p>
        <img src="./assets/images/logo/banner-3.webp" alt class="img-sub">
        <h2 class="sub-header">Giá trị mang đến cho khách hàng</h2>
        <p class="sub-description">
            <span>Thienlong.vn</span> xác định luôn trung thành với những giá trị
            cốt lõi của mình để luôn là sự lựa chọn
            hàng đầu của người tiêu dùng:
        <p>- Hệ thống sản phẩm phong phú và đa dạng.</p>
        <p>- Thanh toán bảo mật, an toàn.</p>
        <p>- Giao hàng nhanh chóng trong 48 giờ.</p>
        <p>- Nền tảng công nghệ hiện đại, giao dịch thuận tiện nhanh chóng.</p>
        </p>
        <h2 class="sub-header">Hệ thống phân phối</h2>
        <p class="sub-description">
            Dựa vào hệ thống phân phối hơn 65.000 điểm bán trên toàn quốc, hơn 160
            Nhà Phân Phối, 2 tổng kho tại Miền Bắc và
            Miền Nam được vận hàng bởi 4 Công ty thương mại có trụ sở tại Hà Nội, Đà
            Nẵng, TP. Hồ Chí Minh, Thiên Long sở
            hữu một nền tảng vững chắc trong việc xây dựng và phát triển hoạt động
            thương mại điện tử. Bên cạnh đó, hệ thống
            quản lý phân phối DMS của Thiên Long đã được chính thức được vận hành,
            Thiên Long càng có nhiều lợi thể để nâng
            cao chất lượng bán hàng trực tuyến phục vụ nhu cầu của khách hàng trên
            khắp nước Việt Nam.
        </p>
        <img src="./assets/images/logo/picture1.png" alt>
        <h2 class="sub-header">Head Office</h2>
        <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.5081908292227!2d106.71996407451712!3d10.772335359270215!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752fcdd2041771%3A0xa46e9842e044baf4!2sThisofic%20Tower!5e0!3m2!1svi!2s!4v1762166913436!5m2!1svi!2s"
                width="600" height="450" style="border:0;" allowfullscreen
                loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>

</div>
<!-- End section main -->
<%@ include file="Header.jsp" %>
</body>

</html>