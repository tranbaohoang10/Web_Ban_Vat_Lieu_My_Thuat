<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ</title>
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
            integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />

    </head>
    <style>
    .container {
        width: 1200px;
        margin: auto;
    }

    /* Begin header */
    #header-trang-chu {
        background-color: var(--color-main);
        display: flex;
        align-items: center;
        position: fixed;
        z-index: 999;
        width: 100%;
    }

    #header-trang-chu .logo-trang-chu {
        margin-left: 50px;
        margin-right: 50px;
        margin-top: 25px;
        margin-bottom: 25px;
    }

    #header-trang-chu .logo-trang-chu img {
        background-color: transparent;
        width: 200px;
        height: 100%;
    }

    #header-trang-chu .tim-kiem-san-pham {
        position: relative;
    }

    #header-trang-chu .tim-kiem-san-pham input {
        padding: 10px 15px;
        width: 600px;
        border-radius: 10px;
        border: none;
    }

    #header-trang-chu .tim-kiem-san-pham {
        display: flex;
    }

    #header-trang-chu .tim-kiem-san-pham i {
        position: absolute;
        right: 0;
        width: 50px;
        height: 100%;
        background-color: #0b234d;
        line-height: 40px;
        cursor: pointer;
        color: white;
        border-top-right-radius: 10px;
        border-bottom-right-radius: 10px;
    }

    #header-trang-chu .header-contact {
        display: flex;
        align-items: center;
    }

    #header-trang-chu .header-contact i {
        width: 30px;
        height: 30px;
        border-radius: 50%;
        background-color: #0b234d;
        line-height: 30px;
        color: white;
    }

    #header-trang-chu .header-contact {
        margin-left: 100px;
        margin-right: 50px;
        cursor: pointer;
    }

    #header-trang-chu .header-contact .contact {
        margin-left: 15px;
    }

    #header-trang-chu .header-contact .contact .contact-phone-number {
        color: white;
        font-weight: 600;
        font-size: 18px;
    }

    #header-trang-chu .header-contact .contact .contact-phone-help {
        color: white;
        font-size: 16px;
    }

    #header-trang-chu .header-dangnhap-dangki {
        display: flex;
        align-items: center;
        cursor: pointer;
    }

    #header-trang-chu .header-dangnhap-dangki i {
        width: 30px;
        height: 30px;
        border-radius: 50%;
        background-color: #0b234d;
        line-height: 30px;
        color: white;
    }

    #header-trang-chu .header-dangnhap-dangki {
        margin-right: 50px;
    }

    #header-trang-chu .header-dangnhap-dangki .dangnhap-dangki {
        margin-left: 15px;
    }

    #header-trang-chu .header-dangnhap-dangki .dangnhap-dangki .dangnhap {
        color: white;
        font-weight: 600;
        font-size: 18px;
    }

    #header-trang-chu .header-dangnhap-dangki .dangnhap-dangki .dangki {
        color: white;
        font-size: 16px;
    }

    #header-trang-chu .header-giohang {
        font-size: 25px;
        color: white;
        position: relative;
        cursor: pointer;
    }
    #header-trang-chu .header-giohang a i {
        color: white;

    }

    #header-trang-chu .header-giohang::after {
        display: inline-flex;
        content: "0";
        width: 20px;
        height: 20px;
        left: 20px;
        bottom: 15px;
        justify-content: center;
        align-items: center;
        font-size: 15px;
        background-color: red;
        position: absolute;
        border-radius: 50%;
    }

    /* End header */
    /* Begin footer */
    #footer-trang-chu {
        display: flex;
        background-color: #17479d;
        border-top-left-radius: 70px;
        border-top-right-radius: 70px;
        gap: 30px;
        align-items: center;
        justify-content: space-around;
        position: relative;
    }

    #footer-trang-chu .footer-title {
        text-align: justify;
        margin-left: 30px;
    }

    #footer-trang-chu .footer-title .img-main {
        background-color: transparent;
        width: 400px;
    }

    #footer-trang-chu .footer-title .footer-title-header {
        color: #fbe263;
    }

    #footer-trang-chu .footer-title .footer-title-description {
        color: white;
    }

    #footer-trang-chu .footer-title .footer-title-form {
        position: relative;
    }

    #footer-trang-chu .footer-title .footer-title-form input {
        padding: 10px 15px;
        border-radius: 10px;
        width: 300px;
        border: none;
    }

    #footer-trang-chu .footer-title .footer-title-form a {
        position: absolute;
        display: inline-flex;
        width: 100px;
        height: 36px;
        background-color: #0b234d;
        border-top-right-radius: 10px;
        border-bottom-right-radius: 10px;
        top: 0;
        right: 69px;
        justify-content: center;
        align-items: center;
        text-decoration: none;
        color: white;
    }

    #footer-trang-chu .footer-title .img-footer {
        width: 250px;
        margin-top: 15px;
        cursor: pointer;
        margin-bottom: 50px;
    }

    #footer-trang-chu .footer-diachi {
        width: 25%;
    }

    #footer-trang-chu .footer-diachi h2 {
        font-size: 20px;
        color: #fbe263;
        margin: 0;
    }

    #footer-trang-chu .footer-diachi span {
        color: #fbe263;
        display: block;
        padding-top: 15px;
    }

    #footer-trang-chu .footer-diachi .footer-diachi-header {
        display: inline;
        color: white;
    }

    #footer-trang-chu .footer-diachi .footer-diachi-description {
        display: inline;
        color: white;
    }

    #footer-trang-chu .footer-diachi .img-main {
        display: block;
        margin-top: 20px;
    }

    #footer-trang-chu .footer-help h2 {
        font-size: 20px;
        color: #fbe263;
        margin: 0;
    }

    #footer-trang-chu .footer-help span {
        display: block;
        color: #fbe263;
        padding-top: 15px;
    }

    #footer-trang-chu .footer-help .footer-help-header {
        display: inline;
        color: white;
    }

    #footer-trang-chu .footer-help .footer-help-header-list a {
        display: block;
        text-decoration: none;
        color: white;
        line-height: 1.4;
    }

    #footer-trang-chu .footer-diachi .img-main {
        cursor: pointer;
    }

    #footer-trang-chu .footer-information h2 {
        font-size: 20px;
        color: #fbe263;
        margin: 0;
    }

    #footer-trang-chu .footer-information .footer-information-header-list a {
        display: block;
        color: white;
        text-decoration: none;
        line-height: 1.4;
    }

    #footer-trang-chu .footer-information .footer-information-socials {
        padding-top: 35px;
    }

    #footer-trang-chu .footer-information .footer-information-socials i {
        width: 50px;
        height: 50px;
        background: white;
        border-radius: 50%;
        line-height: 50px;
        font-size: 25px;
        color: #17479d;
    }

    #footer-trang-chu .footer-information .footer-information-socials i:nth-child(1) {
        margin-right: 10px;
    }

    #footer-trang-chu::after {
        display: block;
        position: absolute;
        content: "2025 © Thienlong.vn - Bản quyền thuộc Tập đoàn Thiên Long";
        bottom: 0;
        color: white;
    }

    /* End footer */

    /* Begin section-info-mithuat */
    #section-info-mithuat {
        padding-top: 100px;
        background: #E5EEFF;
    }

    #section-info-mithuat .container {
        position: relative;
    }

    #section-info-mithuat .info-mithuat-header {
        display: flex;
        justify-content: center;
        align-items: center;

        font-size: 18px;
        padding: 20px 0px;
        font-weight: 500;
    }
    /* them the a */

    a{
        text-decoration: none;
        color: black;
        
    }

    #section-info-mithuat .info-mithuat-header .info-mithuat-header-content {
        margin: 0 5px;
    }

    #section-info-mithuat .info-mithuat-header i:nth-child(1) {
        color: #F7D74E;
    }

    #section-info-mithuat .info-mithuat-header:hover {
        background-color: white;
        cursor: pointer;
    }

    #section-info-mithuat .info-mithuat-header:hover .info-mithuat-header-content,
    i:nth-child(2) {
        color: #17479D; 
    }

    #section-info-mithuat .info-mithuat-header:hover .fa-angle-down {
        color: #17479D;
    }

    #section-info-mithuat .hover-block {
        display: none;
    }

    #section-info-mithuat .info-mithuat-header:hover+.hover-block {
        display: block;
    }

    /* Keep dropdown visible when hovering the header OR the dropdown itself */
    #section-info-mithuat .container:hover .hover-block,
    #section-info-mithuat .hover-block:hover {
        display: block;
    }

    #section-info-mithuat .info-mithuat-description {
        display: flex;
        padding: 20px;
        border: 1px solid #ddd;
        box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
        gap: 70px;
        position: absolute;
        z-index: 1;
        background-color: white;
        left: 0;
        right: 0;
        box-sizing: border-box;
        flex-wrap: nowrap;
    }


    #section-info-mithuat .info-mithuat-description .info-mithuat-description-first a {
        display: block;
        padding-right: 20px;
        width: 100%;
        margin-bottom: 20px;
        text-decoration: none;
        color: black;
    }

    #section-info-mithuat .info-mithuat-description .info-mithuat-description-first a:hover {
        color: #17479D;
    }

    #section-info-mithuat .info-mithuat-description .info-mithuat-description-second a {
        display: block;
        padding-right: 20px;
        width: 100%;
        margin-bottom: 15px;
        text-decoration: none;
        color: black;
    }

    #section-info-mithuat .info-mithuat-description .info-mithuat-description-second a:hover {
        color: #17479D;
    }



    #section-info-mithuat .info-mithuat-description .info-mithuat-description-img img {
        width: 100%;
        cursor: pointer;
    }

    /* End section-info-mithuat */

    /* ========== Slider ========== */
    .w3-left,
    .w3-right {
        position: absolute;
        top: 50%;
        /* căn giữa slider */
        left: 40px;
        /* vị trí nút trái */
        right: auto;
        transform: translateY(-50%);
        background-color: rgba(0, 0, 0, 0.4);
        color: white;
        padding: 14px;
        font-size: 24px;
        cursor: pointer;
        border-radius: 50%;
        user-select: none;
        transition: 0.3s;
        z-index: 10;
    }

    .w3-right {
        left: auto;
        right: 40px;
        /* vị trí nút phải */
    }

    .w3-left:hover,
    .w3-right:hover {
        background-color: rgba(0, 0, 0, 0.8);
    }

    /* Ảnh chiếm full màn hình */
    .w3-content {
        width: 100%;
        max-width: 100%;
        position: relative;
        overflow: hidden;
        margin-bottom: 100px;
        /* bù lại phần header fixed */
    }

    .mySlides {
        display: none;
        width: 100%;
        height: 80vh;
        object-fit: contain;
        background-color: #000;
        /* hoặc #fff tùy thiết kế */
    }

    /* Nút điều hướng */
    .w3-left,
    .w3-right {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        background-color: rgba(0, 0, 0, 0.4);
        color: white;
        padding: 12px;
        font-size: 24px;
        cursor: pointer;
        border-radius: 50%;
        transition: 0.3s;
        user-select: none;
    }

    .w3-left:hover,
    .w3-right:hover {
        background-color: rgba(0, 0, 0, 0.8);
    }

    .w3-left {
        left: 30px;
    }

    .w3-right {
        right: 30px;
    }

    /* Dấu chấm dưới */
    .w3-badge {
        cursor: pointer;
        height: 14px;
        width: 14px;
        padding: 0;
        margin: 0 3px;
        border-radius: 50%;
        display: inline-block;
        background-color: rgba(255, 255, 255, 0.6);
    }

    .w3-white {
        background-color: white !important;
    }

    .w3-display-bottommiddle {
        position: absolute;
        bottom: 20px;
        text-align: center;
    }

    /* End slider show */
    /* Begin section main */
    .section-but {
        margin-bottom: 100px;
    }

    .section-but .container {
        padding: 15px;
        border-radius: 15px;
        box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
    }

    .section-but img {
        width: 100%;
        height: auto;
        cursor: pointer;
        border-radius: 15px;

    }

    .section-but .section-but-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .section-but .section-but-header h2 {
        font-size: 20px;
        color: #17479D;
    }

    .section-but .section-but-header .list-type a {
        display: inline-block;
        padding: 8px 20px;
        text-decoration: none;
        color: black;
        border: 1px solid #ddd;
        border-radius: 30px;
        margin-left: 5px;
    }

    .section-but .section-but-header .list-type a:nth-child(1) {
        text-decoration: none;
        color: #17479D;
        border: 1px solid #17479D;
    }

    .section-but .section-but-header .list-type a:last-child {

        margin-right: 3px;
    }

    .section-but .list-product {
        display: flex;
        gap: 20px;
        margin-bottom: 30px;
        flex-wrap: wrap;
    }

    .section-but .list-product .list-product-list1 {
        border-radius: 15px;
        background-color: #F8FAFF;
        border: 1px solid #D7E5FF;
        width: calc(20% - 18px);
        cursor: pointer;
    }

    .section-but .list-product .list-product-list1 img {
        border-radius: 15px;
        width: 100%;
    }

    .section-but .list-product .list-product-list1 .list-product-list1-content-socials {
        display: flex;
        align-items: center;
        gap: 10px;
        margin-top: 10px;

    }

    .section-but .list-product .list-product-list1 .list-product-list1-content {
        padding: 0 15px 15px;
        text-align: center;
    }

    /* chu y */
    .section-but .list-product .list-product-list1 .list-product-list1-content .content {
        width: 200px;
        white-space: nowrap;
        /* không cho xuống dòng */
        overflow: hidden;
        /* ẩn phần bị tràn */
        text-overflow: ellipsis;
        /* thêm dấu … */
    }

    .section-but .list-product .list-product-list1 .list-product-list1-content-socials .list-product-list1-content-socials-1 {
        width: 60px;
        border-radius: 10px;
        text-align: center;
        line-height: 30px;
        /* height: 30px; */
        /* padding: 5px; */
        background-color: #FFE0E2;
    }

    .section-but .list-product .list-product-list1 .list-product-list1-content-socials .list-product-list1-content-socials-1 i {
        color: #ED1C24;
        font-size: 10px;
    }

    .section-but .list-product .list-product-list1 .list-product-list1-content-socials .list-product-list1-content-socials-1 span {
        /* display: inline-block; */
        color: #ED1C24;
        font-size: 12px;
        font-weight: 600;
        margin-left: 5px;
    }

    .section-but .list-product .list-product-list1 .list-product-list1-content-socials .list-product-list1-content-socials-2 {
        width: 100px;
        border-radius: 10px;
        text-align: center;
        line-height: 30px;
        /* height: 30px; */
        background-color: #E0EBFF;
    }

    .section-but .list-product .list-product-list1 .list-product-list1-content-socials .list-product-list1-content-socials-2 i {
        color: #268EF8;
        font-size: 10px;
    }

    .section-but .list-product .list-product-list1 .list-product-list1-content-socials .list-product-list1-content-socials-2 span {
        color: #268EF8;
        font-size: 12px;
        font-weight: 600;
        margin-left: 5px;
    }

    .section-but .list-product .list-product-list1 .list-product-list1-content .list-product-list1-content-description p {
        font-size: 14px;
        color: black;
    }

    .section-but .list-product .list-product-list1 .list-product-list1-content .list-product-list1-content-description .star i {
        color: #F3C63F
    }

    .section-but .list-product .list-product-list1 .list-product-list1-content .list-product-list1-content-description .star span {
        color: #F3C63F;
        margin-left: 10px;
    }

    .section-but .list-product .list-product-list1 .list-product-list1-content .list-product-list1-content-description .price-product-after {
        color: #268EF8;
        font-weight: 600;
    }

    .section-but .list-product .list-product-list1 .list-product-list1-content .list-product-list1-content-description .price-product-before {
        color: #ccc;
        font-weight: 600;
        text-decoration: line-through;
        display: inline-block;
        margin: 0;
    }

    .section-but .list-product .list-product-list1 .list-product-list1-content .list-product-list1-content-description .price-product-discount {
        color: #ED1C24;
        font-weight: 600;
        margin-left: 5px;
        width: 60px;
        border-radius: 20px;
        text-align: center;
        line-height: 30px;
        /* height: 30px; */
        /* padding: 5px; */
        display: inline-block;
        background-color: #FFE0E2;
    }

    .section-but .list-product .list-product-list1 .list-product-list1-content .list-product-list1-content-description .button {
        margin-top: 15px;
        text-align: center;
    }

    .section-but .list-product .list-product-list1 .list-product-list1-content .list-product-list1-content-description .button .btn-xemchitiet {
        min-width: 64%;
        padding: 10px 0;
        background-color: transparent;
        border: 1px solid #268EF8;
        border-radius: 10px;
        color: white;
        cursor: pointer;

    }

    .section-but .list-product .list-product-list1 .list-product-list1-content .list-product-list1-content-description .button .btn-xemchitiet {
        color: #268EF8;
    }

    .section-but .list-product .list-product-list1 .list-product-list1-content .list-product-list1-content-description .button .btn-xemchitiet:hover {
        background-color: #268EF8;
        color: white;
    }

    .section-but .section-but-button {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .section-but .section-but-button .button {
        background-color: #17479D;
        border: none;
        padding: 15px 15px;
        border-radius: 20px;
        color: white;
        cursor: pointer;
        font-size: 16px;
    }

    .section-but .section-but-button .button:hover {
        opacity: 0.9;
    }

    /* End section main */
</style>

    <body>
        <!-- Begin header-->

        <header id="header-trang-chu" class="trang-chu">
            <div class="logo-trang-chu">
                <a href>
                    <img src="./assets/images/logo/logo.png" alt>
                </a>
            </div>
            <form action class="tim-kiem-san-pham">
                <input type="text" name placeholder="Tìm kiếm sản phẩm...">
                <a href="TimKiem.jsp"><i
                        class="fa-solid fa-magnifying-glass"></i></a>

            </form>
            <div class="header-contact">
                <i class="fa-solid fa-phone"></i>
                <div class="contact">
                    <div class="contact-phone-number">1900 866 819</div>
                    <div class="contact-phone-help">Hỗ trợ khách hàng</div>
                </div>
            </div>
            <div class="header-dangnhap-dangki">

                <i class="fa-solid fa-user"></i>
                <div class="dangnhap-dangki">
                    <a href="DangNhap.jsp"><div class="dangnhap">Đăng
                            nhập</div></a>
                    <a href="DangKy.jsp"><div class="dangki">Đăng kí</div></a>

                </div>

            </div>
            <div class="header-giohang">
                <a class href="GioHang.jsp"><i
                        class="fa-solid fa-bag-shopping"></i></a>

            </div>
        </header>
        <!-- End header-->
        <!-- Begin section info mithuat -->
        <div id="section-info-mithuat">
            <div class="container">
                <div class="info-mithuat-header">
                    <i class="fa-solid fa-palette"></i>
                    <p class="info-mithuat-header-content"><a
                            href="TimKiem.jsp">Danh
                            mục</a> </p>
                    <i class="fa-solid fa-angle-down"></i>
                </div>
                <div class="hover-block">
                    <div class="info-mithuat-description">
                        <div class="info-mithuat-description-first">
                            <a href>NEW ARRIVAL</a>
                            <a href>Fiber Pen - Bút lông Màu</a>
                            <a href>Bút chì màu</a>
                            <a href>Màu nước</a>
                            <a href>Tập vẽ tranh - Tập tô màu</a>
                        </div>
                        <div class="info-mithuat-description-second">
                            <a href>Acrylic Marker - Bút sơn</a>
                            <a href>Màu sáp, màu sáp dầu</a>
                            <a href>Bút vẽ kỹ thuật</a>
                            <a href>Sáp nặn</a>
                            <a href>Combo mỹ thuật</a>
                        </div>
                        <div class="info-mithuat-description-img">
                            <img
                                src="./assets/images/logo/1920x600_c17ffe56498a4e2a9e5d27ac6eeaaad2_1024x1024.jpg"
                                alt>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End section info mithuat -->
        <!-- Begin slider show -->
        <div class="w3-content w3-display-container">
            <img class="mySlides" src="./assets/images/logo/banner-1.webp">
            <img class="mySlides" src="./assets/images/logo/banner-2.webp">
            <img class="mySlides" src="./assets/images/logo/banner-3.webp">

            <div class="w3-left" onclick="plusDivs(-1)">&#10094;</div>
            <div class="w3-right" onclick="plusDivs(1)">&#10095;</div>

            <div class="w3-display-bottommiddle" style="width:100%">
                <span class="w3-badge demo" onclick="currentDiv(1)"></span>
                <span class="w3-badge demo" onclick="currentDiv(2)"></span>
                <span class="w3-badge demo" onclick="currentDiv(3)"></span>
            </div>
        </div>

        <script>
        let slideIndex = 0;
        showDivs(slideIndex);

        // nút điều hướng
        function plusDivs(n) { showDivs(slideIndex += n); }
        function currentDiv(n) { showDivs(slideIndex = n - 1); }

        // hiển thị slide
        function showDivs(n) {
            let i;
            const slides = document.getElementsByClassName("mySlides");
            const dots = document.getElementsByClassName("demo");
            if (n >= slides.length) { slideIndex = 0 }
            if (n < 0) { slideIndex = slides.length - 1 }

            for (i = 0; i < slides.length; i++) slides[i].style.display = "none";
            for (i = 0; i < dots.length; i++) dots[i].classList.remove("w3-white");

            slides[slideIndex].style.display = "block";
            dots[slideIndex].classList.add("w3-white");
        }

        // tự động chạy
        setInterval(() => {
            plusDivs(1);
        }, 4000); // 4 giây chuyển 1 ảnh
    </script>
        <!-- End slider show -->
        <!-- Begin section -->
        <div class="section-but">
            <div class="container">
                <img src="./assets/images/logo/mythuat-logo.webp" alt>
                <div class="section-but-header">
                    <h2>MỸ THUẬT</h2>

                </div>
                <div class="section-but-content">
                    <div class="list-product">
                        <c:forEach var="p" items="${products}">
                            <div class="list-product-list1">
                                <a href="ChiTietSanPham.jsp?id=${p.id}">
                                    <img src="${pageContext.request.contextPath}/${p.thumbnail}" alt="${p.name}">
                                    <div class="list-product-list1-content">
                                        <div class="list-product-list1-content-socials">
                                            <div class="list-product-list1-content-socials-1">
                                                <i class="fa-solid fa-thumbs-up"></i><span>New</span>
                                            </div>
                                            <div class="list-product-list1-content-socials-2">
                                                <i class="fa-solid fa-arrow-up-right-dots"></i>
                                                <span>Đã bán ${p.soldQuantity}</span>
                                            </div>
                                        </div>
                                        <div class="list-product-list1-content-description">
                                            <!-- Tên sản phẩm -->
                                            <p class="content">${p.name}</p>

                                            <!-- Rating: tạm thời để cứng (0), sau này có bảng review thì đổi -->
                                            <div class="star">
                                                <i class="fa-solid fa-star"></i>
                                                <i class="fa-solid fa-star"></i>
                                                <i class="fa-solid fa-star"></i>
                                                <i class="fa-solid fa-star"></i>
                                                <i class="fa-solid fa-star"></i>
                                                <span>(0)</span>
                                            </div>

                                            <!-- Giá sau giảm, giá gốc, % giảm -->
                                            <h2 class="price-product-after">
                                                    ${p.priceAfterDiscount}₫
                                            </h2>
                                            <p class="price-product-before">
                                                    ${p.price}đ
                                            </p>
                                            <span class="price-product-discount">
                            -${p.discountDefault}%
                        </span>

                                            <div class="button">
                                                <a href="ChiTietSanPham.jsp?id=${p.id}">
                                                    <button class="btn-xemchitiet">
                                                        <i class="fa-solid fa-eye"></i>
                                                        Xem chi tiết
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>


                </div>
                <div class="section-but-button">
                    <a class="button" href="TimKiem.jsp">Xem tất cả<i
                            class="fa-solid fa-angle-right"></i></a>
                </div>
            </div>
        </div>
        <div class="section-but">
            <div class="container">
                <img src="./assets/images/logo/section-but.webp" alt>
                <div class="section-but-header">
                    <h2>Dụng cụ học tập nghệ thuật</h2>

                </div>
                <div class="section-but-content">
                    <div class="list-product">
                        <div class="list-product-list1"><a
                                href="ChiTietSanPham.jsp">
                                <img src="./assets/images/logo/combo1.jpg" alt>
                                <div class="list-product-list1-content">
                                    <div
                                        class="list-product-list1-content-socials">
                                        <div
                                            class="list-product-list1-content-socials-1"><i
                                                class="fa-solid fa-thumbs-up"></i><span>New</span>
                                        </div>
                                        <div
                                            class="list-product-list1-content-socials-2"><i
                                                class="fa-solid fa-arrow-up-right-dots"></i><span>Đã
                                                bán 6</span></div>
                                    </div>
                                    <div
                                        class="list-product-list1-content-description">
                                        <p class="content">Combo Bé Học Vui
                                            (Tiểu
                                            Học) - 10 món
                                        </p>
                                        <div class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <span>(0)</span>
                                        </div>
                                        <h2
                                            class="price-product-after">292,250₫</h2>
                                        <p class="price-product-before">
                                            145,000đ</p>
                                        <span
                                            class="price-product-discount">-35%</span>
                                        <div class="button">
                                            <a href="ChiTietSanPham.jsp">
                                                <button class="btn-xemchitiet">
                                                    <i
                                                        class="fa-solid fa-eye"></i>
                                                    Xem chi tiết
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </a>

                        </div>
                        <div class="list-product-list1"> <a
                                href="ChiTietSanPham.jsp">
                                <img src="./assets/images/logo/combo2.jpg" alt>
                                <div class="list-product-list1-content">
                                    <div
                                        class="list-product-list1-content-socials">
                                        <div
                                            class="list-product-list1-content-socials-1"><i
                                                class="fa-solid fa-thumbs-up"></i><span>New</span>
                                        </div>
                                        <div
                                            class="list-product-list1-content-socials-2"><i
                                                class="fa-solid fa-arrow-up-right-dots"></i><span>Đã
                                                bán 742</span></div>
                                    </div>
                                    <div
                                        class="list-product-list1-content-description">
                                        <p class="content">Combo Sắc Màu (Tiểu
                                            Học)
                                        </p>
                                        <div class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <span>(0)</span>
                                        </div>
                                        <h2
                                            class="price-product-after">169,000₫</h2>
                                        <p class="price-product-before">
                                            256,000đ</p>
                                        <span
                                            class="price-product-discount">-41%</span>
                                        <div class="button">
                                            <a href="ChiTietSanPham.jsp">
                                                <button class="btn-xemchitiet">
                                                    <i
                                                        class="fa-solid fa-eye"></i>
                                                    Xem chi tiết
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </a>

                        </div>
                        <div class="list-product-list1"> <a
                                href="ChiTietSanPham.jsp">
                                <img src="./assets/images/logo/combo3.jpg" alt>
                                <div class="list-product-list1-content">
                                    <div
                                        class="list-product-list1-content-socials">
                                        <div
                                            class="list-product-list1-content-socials-1"><i
                                                class="fa-solid fa-thumbs-up"></i><span>New</span>
                                        </div>
                                        <div
                                            class="list-product-list1-content-socials-2"><i
                                                class="fa-solid fa-arrow-up-right-dots"></i><span>Đã
                                                bán 123</span></div>
                                    </div>
                                    <div
                                        class="list-product-list1-content-description">
                                        <p class="content">Combo Sáng Tạo (Tiểu
                                            Học)
                                            - 11 món
                                        </p>
                                        <div class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <span>(0)</span>
                                        </div>
                                        <h2
                                            class="price-product-after">169,000₫</h2>
                                        <p class="price-product-before">
                                            256,000đ</p>
                                        <span
                                            class="price-product-discount">-41%</span>
                                        <div class="button">
                                            <a href="ChiTietSanPham.jsp">
                                                <button class="btn-xemchitiet">
                                                    <i
                                                        class="fa-solid fa-eye"></i>
                                                    Xem chi tiết
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </a>

                        </div>
                        <div class="list-product-list1"> <a
                                href="ChiTietSanPham.jsp">
                                <img src="./assets/images/logo/combo4.jpg" alt>
                                <div class="list-product-list1-content">
                                    <div
                                        class="list-product-list1-content-socials">
                                        <div
                                            class="list-product-list1-content-socials-1"><i
                                                class="fa-solid fa-thumbs-up"></i><span>New</span>
                                        </div>
                                        <div
                                            class="list-product-list1-content-socials-2"><i
                                                class="fa-solid fa-arrow-up-right-dots"></i><span>Đã
                                                bán 218</span></div>
                                    </div>
                                    <div
                                        class="list-product-list1-content-description">
                                        <p class="content">Bộ Fiber Pen Ghi Chú
                                            Sáng
                                            Tạo 1 (Option 3)
                                        </p>
                                        <div class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <span>(0)</span>
                                        </div>
                                        <h2
                                            class="price-product-after">159,000₫</h2>
                                        <p class="price-product-before">
                                            233,000đ</p>
                                        <span
                                            class="price-product-discount">-29%</span>
                                        <div class="button">
                                            <a href="ChiTietSanPham.jsp">
                                                <button class="btn-xemchitiet">
                                                    <i
                                                        class="fa-solid fa-eye"></i>
                                                    Xem chi tiết
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </a>

                        </div>
                        <div class="list-product-list1"> <a
                                href="ChiTietSanPham.jsp">
                                <img src="./assets/images/logo/combo5.jpg" alt>
                                <div class="list-product-list1-content">
                                    <div
                                        class="list-product-list1-content-socials">
                                        <div
                                            class="list-product-list1-content-socials-1"><i
                                                class="fa-solid fa-thumbs-up"></i><span>New</span>
                                        </div>
                                        <div
                                            class="list-product-list1-content-socials-2"><i
                                                class="fa-solid fa-arrow-up-right-dots"></i><span>Đã
                                                bán 6</span></div>
                                    </div>
                                    <div
                                        class="list-product-list1-content-description">
                                        <p class="content">Bộ mỹ thuật cho bé từ
                                            5-6
                                            tuổi
                                        </p>
                                        <div class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <span>(0)</span>
                                        </div>
                                        <h2
                                            class="price-product-after">117,500₫</h2>
                                        <p class="price-product-before">
                                            180,000đ</p>
                                        <span
                                            class="price-product-discount">-25%</span>
                                        <div class="button">
                                            <a href="ChiTietSanPham.jsp">
                                                <button class="btn-xemchitiet">
                                                    <i
                                                        class="fa-solid fa-eye"></i>
                                                    Xem chi tiết
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </a>

                        </div>
                        <div class="list-product-list1"> <a
                                href="ChiTietSanPham.jsp">
                                <img src="./assets/images/logo/combo6.png" alt>
                                <div class="list-product-list1-content">
                                    <div
                                        class="list-product-list1-content-socials">
                                        <div
                                            class="list-product-list1-content-socials-1"><i
                                                class="fa-solid fa-thumbs-up"></i><span>New</span>
                                        </div>
                                        <div
                                            class="list-product-list1-content-socials-2"><i
                                                class="fa-solid fa-arrow-up-right-dots"></i><span>541</span></div>
                                    </div>
                                    <div
                                        class="list-product-list1-content-description">
                                        <p class="content">Bộ sản phẩm mỹ thuật
                                            cơ
                                            bản Colokit
                                            êm
                                        </p>
                                        <div class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <span>(0)</span>
                                        </div>
                                        <h2
                                            class="price-product-after">129,000₫</h2>
                                        <p class="price-product-before">
                                            179,000đ</p>
                                        <span
                                            class="price-product-discount">-25%</span>
                                        <div class="button">
                                            <a href="ChiTietSanPham.jsp">
                                                <button class="btn-xemchitiet">
                                                    <i
                                                        class="fa-solid fa-eye"></i>
                                                    Xem chi tiết
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </a>

                        </div>
                        <div class="list-product-list1"> <a
                                href="ChiTietSanPham.jsp">
                                <img src="./assets/images/logo/combo7.jpg" alt>
                                <div class="list-product-list1-content">
                                    <div
                                        class="list-product-list1-content-socials">
                                        <div
                                            class="list-product-list1-content-socials-1"><i
                                                class="fa-solid fa-thumbs-up"></i><span>New</span>
                                        </div>
                                        <div
                                            class="list-product-list1-content-socials-2"><i
                                                class="fa-solid fa-arrow-up-right-dots"></i><span>Đã
                                                bán 123</span></div>
                                    </div>
                                    <div
                                        class="list-product-list1-content-description">
                                        <p class="content">Combo mỹ thuật tiện
                                            lợi 6
                                            món – Set combo gồm bút lông màu,
                                            sáp
                                            màu,
                                            bút chì, chuốt,
                                            thước kẻ và gôm
                                        </p>
                                        <div class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <span>(0)</span>
                                        </div>
                                        <h2
                                            class="price-product-after">190,000₫</h2>
                                        <p class="price-product-before">
                                            240,800đ</p>
                                        <span
                                            class="price-product-discount">-23%</span>
                                        <div class="button">
                                            <a href="ChiTietSanPham.jsp">
                                                <button class="btn-xemchitiet">
                                                    <i
                                                        class="fa-solid fa-eye"></i>
                                                    Xem chi tiết
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </a>

                        </div>
                        <div class="list-product-list1"> <a
                                href="ChiTietSanPham.jsp">
                                <img src="./assets/images/logo/combo8.jpg" alt>
                                <div class="list-product-list1-content">
                                    <div
                                        class="list-product-list1-content-socials">
                                        <div
                                            class="list-product-list1-content-socials-1"><i
                                                class="fa-solid fa-thumbs-up"></i><span>New</span>
                                        </div>
                                        <div
                                            class="list-product-list1-content-socials-2"><i
                                                class="fa-solid fa-arrow-up-right-dots"></i><span>Đã
                                                bán 6</span></div>
                                    </div>
                                    <div
                                        class="list-product-list1-content-description">
                                        <p class="content">Bộ dụng cụ mỹ thuật
                                            Colokit KIT-C012
                                        </p>
                                        <div class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <span>(0)</span>
                                        </div>
                                        <h2
                                            class="price-product-after">171,500₫</h2>
                                        <p class="price-product-before">
                                            253,000đ</p>
                                        <span
                                            class="price-product-discount">-25%</span>
                                        <div class="button">
                                            <a href="ChiTietSanPham.jsp">
                                                <button class="btn-xemchitiet">
                                                    <i
                                                        class="fa-solid fa-eye"></i>
                                                    Xem chi tiết
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </a>

                        </div>
                        <div class="list-product-list1"> <a
                                href="ChiTietSanPham.jsp">
                                <img src="./assets/images/logo/combo8.jpg" alt>
                                <div class="list-product-list1-content">
                                    <div
                                        class="list-product-list1-content-socials">
                                        <div
                                            class="list-product-list1-content-socials-1"><i
                                                class="fa-solid fa-thumbs-up"></i><span>New</span>
                                        </div>
                                        <div
                                            class="list-product-list1-content-socials-2"><i
                                                class="fa-solid fa-arrow-up-right-dots"></i><span>Đã
                                                bán 6</span></div>
                                    </div>
                                    <div
                                        class="list-product-list1-content-description">
                                        <p class="content">Bộ dụng cụ mỹ thuật
                                            Colokit KIT-C012
                                        </p>
                                        <div class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <span>(0)</span>
                                        </div>
                                        <h2
                                            class="price-product-after">171,500₫</h2>
                                        <p class="price-product-before">
                                            253,000đ</p>
                                        <span
                                            class="price-product-discount">-25%</span>
                                        <div class="button">
                                            <a href="ChiTietSanPham.jsp">
                                                <button class="btn-xemchitiet">
                                                    <i
                                                        class="fa-solid fa-eye"></i>
                                                    Xem chi tiết
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </a>

                        </div>
                        <div class="list-product-list1"> <a
                                href="ChiTietSanPham.jsp">
                                <img src="./assets/images/logo/combo10.jpg" alt>
                                <div class="list-product-list1-content">
                                    <div
                                        class="list-product-list1-content-socials">
                                        <div
                                            class="list-product-list1-content-socials-1"><i
                                                class="fa-solid fa-thumbs-up"></i><span>New</span>
                                        </div>
                                        <div
                                            class="list-product-list1-content-socials-2"><i
                                                class="fa-solid fa-arrow-up-right-dots"></i><span>Đã
                                                bán 369</span></div>
                                    </div>
                                    <div
                                        class="list-product-list1-content-description">
                                        <p class="content">Bộ mỹ thuật cho bé từ
                                            3-5
                                            tuổi
                                        </p>
                                        <div class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <span>(0)</span>
                                        </div>
                                        <h2
                                            class="price-product-after">149,850₫</h2>
                                        <p class="price-product-before">
                                            165,000đ</p>
                                        <span
                                            class="price-product-discount">-10%</span>
                                        <div class="button">
                                            <a href="ChiTietSanPham.jsp">
                                                <button class="btn-xemchitiet">
                                                    <i
                                                        class="fa-solid fa-eye"></i>
                                                    Xem chi tiết
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>

                </div>
                <div class="section-but-button">

                    <a class="button" href="TimKiem.jsp">Xem tất cả
                        <i
                            class="fa-solid fa-angle-right"></i></a>

                </div>
            </div>
        </div>

        <!-- End section -->

        <!-- Begin footer-->

        <footer id="footer-trang-chu">
            <div class="footer-title">
                <img src="./assets/images/logo/logo.png" alt class="img-main">
                <p class="footer-title-header">Thienlong.vn - Website thương mại
                    điện tử thuộc Tập đoàn Thiên Long</p>
                <p class="footer-title-description">Công ty Cổ Phần Tập Đoàn
                    Thiên Long
                    <br>
                    <br>
                    GPĐKKD số 0301464830 do Sở KHĐT TP. Hồ Chí Minh cấp ngày
                    14/03/2005.
                </p>
                <form action class="footer-title-form">
                    <input type="email" placeholder="Nhập địa chỉ email">
                    <a href>Đăng ký</a>
                </form>
                <img
                    src="./assets/images/logo/logo-parker_53d035f3ab7645168e62cd9e3f595090.png"
                    alt class="img-footer">
            </div>
            <div class="footer-diachi">
                <h2>ĐỊA CHỈ CÔNG TY</h2>
                <span>
                    Head Office:
                    <p class="footer-diachi-header"> Tầng 10, Sofic Tower, Số 10
                        Đường Mai Chí Thọ, Phường An Khánh,
                        Thành Phố Hồ Chí Minh, Việt Nam
                    </span>
                    <br>
                    <span>
                        Miền Bắc:
                        <p class="footer-diachi-description"> Số 38, đường
                            Gamuda Gardens 2-5, Khu đô thị mới C2 - Gamuda
                            Gardens, Phường Trần Phú, Thành phố Hà Nội, Việt
                            Nam.
                        </span>

                        <img src="./assets/images/logo/footer_bct.png" alt
                            class="img-main">
                    </div>
                    <div class="footer-help">
                        <h2>HỖ TRỢ KHÁCH HÀNG</h2>
                        <span>
                            Hotline:
                            <p class="footer-help-header">1900 866 819
                            </span>
                            <span>
                                Thứ 2 - Thứ 6 (8h - 17h)
                                salesonline@thienlongvn.com
                                <div class="footer-help-header-list">
                                    <a href>
                                        - Hướng dẫn mua hàng
                                    </a>
                                    <a href>
                                        - Hướng dẫn thanh toán
                                    </a>
                                    <a href>
                                        - Chính sách giao hàng
                                    </a>
                                    <a href>
                                        - Chính sách đổi trả & hoàn tiền
                                    </a>
                                    <a href>
                                        - Khách hàng thân thiết
                                    </a>
                                    <a href>
                                        - Khách hàng ưu tiên
                                    </a>
                                    <a href>
                                        - Phản ánh chất lượng sản phẩm
                                    </a>
                                </div>
                            </span>
                        </div>
                        <div class="footer-information">
                            <h2>VỀ THIENLONG.VN</h2>
                            <div class="footer-information-header-list">
                                <a href="GioiThieu.jsp">
                                    - Giới thiệu
                                </a>
                                <a href>
                                    - Dịch vụ in ấn quảng cáo
                                </a>
                                <a href>
                                    - Chính sách bảo mật chung
                                </a>
                                <a href>
                                    - Chính sách bảo mật thông tin cá nhân
                                </a>
                                <a href>
                                    - Thông tin liên hệ
                                </a>
                                <a href>
                                    - Chương trình Affiliate
                                </a>
                            </div>
                            <div class="footer-information-socials">
                                <a
                                    href="https://www.facebook.com/thienlongonline">
                                    <i class="fa-brands fa-facebook"></i>

                                </a>
                                <a
                                    href="https://youtube.com/@thienlongshop?si=vC9qMq3rF8RixxpU">
                                    <i class="fa-brands fa-youtube"></i>

                                </a>
                            </div>
                        </div>
                    </footer>
                    <!-- End footer-->
                </body>

            </html>