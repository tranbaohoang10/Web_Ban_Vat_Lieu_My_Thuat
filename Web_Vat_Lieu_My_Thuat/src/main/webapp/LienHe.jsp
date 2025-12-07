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
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<style>

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
</style>
<body>
<%@ include file="Header.jsp" %>

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
                        của bạn
                    </button>
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

<%@ include file="Footer.jsp" %>

<script>
    document.querySelector('.btn-lienhe').addEventListener('click', function () {
        alert('Gửi liên hệ thành công!');
    });
</script>

</body>

</html>