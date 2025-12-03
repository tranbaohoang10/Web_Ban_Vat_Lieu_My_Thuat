<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Liên hệ</title>
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
            integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <style>
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
        padding: 10px 10px;
        border-radius: 10px;
        width: 200px;
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

    #header-trang-chu {
        background-color: var(--color-main);
        display: flex;
        align-items: center;
        position: fixed;
        z-index: 999;
        top: 0;
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
        background-color: #0B234D;
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
        background-color: #0B234D;
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
        background-color: #0B234D;
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

    /* Lien He */

    .hearder-lienhe {
        background: #DBE8FF;
        color: #17479d;
        font-weight: 500;
        font-size: 16px;
        padding: 12px 40px;
        border-bottom: 1px solid #e5e7eb;
        margin-top: 100px;
        margin-bottom: 0;
    }


    .page-contact {

        padding-top: 140px;
        padding-bottom: 120px;

    }

    .container-all {
        max-width: 1200px;
        margin: 0 auto;
        display: flex;
        gap: 24px;
        padding: 0 16px;
        border: 1px solid #e8edf3;
        border-radius: 12px;
        

    }

    .container-right {
        flex: 50%;
        border: none;
    }

    .container-left {
        flex: 50%;
        border: none;
    }


    .contact-meta {
        display: grid;
        grid-template-columns: 1fr;
        gap: 8px;
        margin-bottom: 16px;
        color: #273142;
    }

    .contact-meta .row {
        display: flex;
        align-items: flex-start;
        gap: 10px;
        line-height: 1.5;
    }

    .contact-meta i {
        color: #17479d;
        min-width: 18px;
        margin-top: 2px;
    }

    .contact-grid {
        display: grid;
        grid-template-columns: 1.15fr 1fr;
        gap: 24px;
        align-items: start;
    }

    .card {
        padding: 18px;
        padding-top: 20px;
    }

    .form-title {
        font-weight: 600;
        margin-bottom: 12px;
        color: #0b234d;
        letter-spacing: .2px;
    }

    .form-group {
        margin-bottom: 12px;
    }

    .form-control {
        width: 100%;
        height: 36px;
        border: 1px solid #d7dee8;
        border-radius: 8px;
        padding: 6px 5px;
        font-size: 15px;
        outline: none;
        background: #fff;
    }

    .form-control:focus {
        border-color: #17479d;
        box-shadow: 0 0 0 3px rgba(23, 71, 157, .12);
    }

    textarea.form-control {
        height: 160px;
        resize: vertical;
    }

    .btn-lienhe {
        background: #17479d;
        color: #fff;
        border: none;
        border-radius: 28px;
        padding: 12px 20px;
        font-weight: 600;
        cursor: pointer;
        width: 100%;
    }

    .btn-lienhe:hover {
        background: #0c357c;
    }

    .map-card {
        padding-top: 50px;
    }

    .map-card iframe {
        width: 100%;
        height: 520px;
        border: 0;
        border-radius: 12px;
    }




    /* Begin footer */
    #footer-trang-chu {
        display: flex;
        background-color: #17479D;
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
        color: #FBE263;
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
        width: 100px;
        border: none;

    }

    #footer-trang-chu .footer-title .footer-title-form a {
        position: absolute;
        display: inline-flex;
        width: 100px;
        height: 36px;
        background-color: #0B234D;
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
        color: #FBE263;
        margin: 0;
    }

    #footer-trang-chu .footer-diachi span {
        color: #FBE263;
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

    #footer-trang-chu .footer-help {}

    #footer-trang-chu .footer-help h2 {
        font-size: 20px;
        color: #FBE263;
        margin: 0;
    }

    #footer-trang-chu .footer-help span {
        display: block;
        color: #FBE263;
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
        color: #FBE263;
        margin: 0;
    }

    #footer-trang-chu .footer-information .footer-information-header-list {}

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
        color: #17479D;
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
</style>

    <body>
        <header id="header-trang-chu" class="trang-chu">
            <div class="logo-trang-chu">
                <a href="index.jsp">
                    <img src="./assets/images/logo/logo.png" alt>
                </a>
            </div>
            <form action class="tim-kiem-san-pham">
                <input type="text" name placeholder="Tìm kiếm sản phẩm...">
                <i class="fa-solid fa-magnifying-glass"></i>
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
                    <div class="dangnhap">Đăng nhập</div>
                    <div class="dangki">Đăng kí</div>
                </div>

            </div>
            <div class="header-giohang">
                <i class="fa-solid fa-bag-shopping"></i>
            </div>
        </header>

        <!-- header lien he -->
        <div class="hearder-lienhe">Trang chủ / Thông tin liên hệ</div>

        <main class="page-contact">
            <div class="container-all">
                <div class="container-left">

                    <div class="card">
                        <!-- cho do chung voi lien he -->
                        <h1>Thienlong.com - Tập đoàn Thiên Long</h1>
                        <div class="contact-meta">
                            <div class="row">
                                <i class="fa-solid fa-location-dot"></i>
                                <div>
                                    Địa chỉ: Tầng 2, Chung cư An Bình, Đường Lê
                                    Trọng Tấn, Phường An Bình, TX.Dĩ An, Tỉnh
                                    Bình Dương, Việt Nam
                                </div>
                            </div>
                            <div class="row">
                                <i class="fa-solid fa-phone"></i>
                                <div>Số điện thoại: 0369897344</div>
                            </div>
                            <div class="row">
                                <i class="fa-solid fa-envelope"></i>
                                <div>
                                    Email:
                                    <a href="mailto:BaOngNau@gmail.com.vn">
                                        BaOngNau@gmail.com.vn
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="form-title">LIÊN HỆ VỚI CHÚNG TÔI</div>
                        <form action="#" method="post">
                            <div class="form-group">
                                <input class="form-control" type="text"
                                    name="fullname" placeholder="Họ tên"
                                    required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="email"
                                    name="email" placeholder="Email" required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="tel"
                                    name="phone" placeholder="Số điện thoại"
                                    required>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="message"
                                    placeholder="Nhập nội dung"
                                    required></textarea>
                            </div>
                            <button class="btn-lienhe" type="button">Gửi liên hệ
                                của bạn</button>
                        </form>
                    </div>

                </div>

                <!-- map -->
                <div class="container-right">

                    <div class="card map-card">
                        <iframe
                            src="https://www.google.com/maps?q=10%20Mai%20Chi%20Tho,%20Thu%20Thiem,%20Thu%20Duc,%20Ho%20Chi%20Minh&hl=vi&z=16&output=embed"
                            allowfullscreen loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade">
                        </iframe>
                    </div>
                </div>

            </div>
        </main>

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
                                <a href="LienHe.html">
                                    - Thông tin liên hệ
                                </a>
                                <a href>
                                    - Chương trình Affiliate
                                </a>
                            </div>
                            <div class="footer-information-socials">
                                <i class="fa-brands fa-facebook"></i>
                                <i class="fa-brands fa-youtube"></i>
                            </div>
                        </div>
                    </footer>
                    <script>
    document.querySelector('.btn-lienhe').addEventListener('click', function () {
        alert('Gửi liên hệ thành công!');
    });
</script>

                </body>

            </html>