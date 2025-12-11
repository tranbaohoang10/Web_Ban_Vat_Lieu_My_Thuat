<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch sử mua hàng</title>
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
    /* Begin section-main-ca-nhan */
    .section-main-ca-nhan {
        padding-bottom: 20px;
        padding-top: 20px;
    }

    .section-main-ca-nhan .container {
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 10px;

    }

    .section-main-ca-nhan .container .canhan {
        display: flex;
        gap: 30px;
    }

    .section-main-ca-nhan .container .tongquan-canhan {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 15px;
        background-color: #F1F1F1;
        border-radius: 10px;
        width: 30%;
        padding: 10px;

        top: 20px;
        height: fit-content;

    }

    .section-main-ca-nhan .container .tongquan-canhan .logo-name {
        width: 80px;
        height: 80px;
        background-color: #FB9F10;
        border-radius: 50%;
        color: white;
        font-size: 36px;
        display: flex;
        justify-content: center;
        align-items: center;
        font-weight: 700;
        margin-top: 20px;
    }

    .section-main-ca-nhan .container .tongquan-canhan .name-full {
        font-size: 18px;
        font-style: italic;
    }

    .section-main-ca-nhan .container .tongquan-canhan .name-full .span {
        color: #2659F3;
        font-weight: 600;
    }

    .section-main-ca-nhan .container .tongquan-canhan .list-canhan {
        display: flex;
        flex-direction: column;
        width: 100%;
        align-items: center;
        justify-content: center;

    }

    .section-main-ca-nhan .container .tongquan-canhan .list-canhan a {
        width: calc(100% - 30px);
        display: block;
        padding: 15px;
        background-color: #2659F3;
        text-decoration: none;
        color: white;
        font-size: 18px;
        font-weight: 600;
    }

    .section-main-ca-nhan .container .tongquan-canhan .list-canhan a:first-child {

        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
    }

    .section-main-ca-nhan .container .tongquan-canhan .list-canhan a.active {
        background-color: #FB9F10;
        transition: all 0.4s;
    }

    .section-main-ca-nhan .container .tongquan-canhan .list-canhan a:last-child {
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
    }


    .section-main-ca-nhan .container .tongquan-canhan .list-canhan a:hover {
        background-color: #FB9F10;
        transition: all 0.4s;
    }

    .section-main-ca-nhan .container .thongtin-canhan {
        flex: 1;
        background-color: #F1F1F1;
    }

    .section-main-ca-nhan .container .thongtin-canhan form {
        padding: 20px;
        display: flex;
        flex-direction: column;
    }

    .section-main-ca-nhan .container .thongtin-canhan form h2 {
        color: #FB9F10;
    }

    .section-main-ca-nhan .container .thongtin-canhan form input {
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        margin-bottom: 10px;
    }

    .section-main-ca-nhan .container .thongtin-canhan form input.button {
        padding: 10px 25px;
        color: white;
        background-color: #2659F3;
        border-radius: 20px;
        font-weight: 600;
        display: inline-block;
        margin-bottom: 10px;
        margin: 0 auto;
        cursor: pointer;
        font-size: 16px;
    }

    .section-main-ca-nhan .container .thongtin-canhan form input.button:hover {
        opacity: 0.9;
    }

    /* order history */
    .order-history {
        flex: 1;
        background: #fff;
        padding: 24px;
        border-radius: 12px;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        border: 1px solid #e5e7eb;
        overflow: hidden;

    }


    .order-tabs {
        display: flex;
        gap: 10px;
        margin-bottom: 20px;
    }

    .order-tabs button {
        flex: 1;
        background: #f1f5ff;
        border: none;
        border-radius: 8px;
        padding: 10px;
        font-weight: 600;
        cursor: pointer;
        color: #2659F3;
        transition: all 0.3s;
    }

    .order-tabs button.active,
    .order-tabs button:hover {
        background: linear-gradient(135deg, #2659F3 0%, #1e40af 100%);
        color: white;
    }

    .order-card {
        border: 1px solid #e5e7eb;
        border-radius: 10px;
        margin-bottom: 25px;
        overflow: hidden;
    }

    .order-header {
        background: #f9fafb;
        padding: 12px 20px;
        display: flex;
        justify-content: space-between;
        border-bottom: 1px solid #e5e7eb;
        font-weight: 600;
    }

    .order-status {
        padding: 4px 12px;
        border-radius: 20px;
        font-size: 0.9rem;
    }

    .order-status.pending {
        background: #fff3cd;
        color: #856404;
    }

    .order-status.success {
        background: #d1fae5;
        color: #065f46;
    }

    .order-status.canceled {
        background: #fee2e2;
        color: #991b1b;
    }

    .order-items {
        padding: 15px 20px;
        display: flex;
        flex-direction: column;
        gap: 12px;
    }

    .order-item {
        display: flex;
        align-items: center;
        gap: 16px;
        padding: 12px 0;
    }

    .order-item img {
        width: 80px;
        height: 80px;
        border-radius: 8px;
        object-fit: cover;
        border: 1px solid #e5e7eb;
        flex-shrink: 0;
    }

    .order-info {
        flex: 1;
    }

    .order-name {
        font-weight: 600;
        margin: 0;
    }

    .order-quantity {
        color: #6b7280;
        margin: 4px 0 0;
    }

    .order-price {
        text-align: right;
    }

    .order-price p {
        color: #6b7280;
        margin: 0;
    }

    .order-price strong {
        color: #dc2626;
        font-size: 1rem;
    }

    .order-footer {
        background: #f9fafb;
        padding: 12px 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .order-buttons .btn-review,
    .order-buttons .btn-cancel {
        display: inline-block;
        padding: 8px 16px;
        border-radius: 8px;
        cursor: pointer;
        transition: 0.3s;
        font-weight: 600;
        text-decoration: none;
    }

    .order-buttons {
        display: flex;
        gap: 8px;
    }


    .order-buttons .btn-review {
        border: 1px solid #2659F3;
        background: #ffffff;
        color: #2659F3;
    }

    .order-buttons .btn-review:hover {
        background: #eff6ff;
    }

    .order-buttons .btn-cancel {
        border: 1px solid #f43f3f;
        background: #ffffff;
        color: #f43f3f;
    }

    .order-buttons .btn-cancel:hover {
        background: #fee2e2;
    }


    .order-history {
        font-size: 16px;
    }


    .order-name {
        font-size: 17px;
        font-weight: 600;
        color: #111827;
    }


    .order-quantity,
    .order-price p {
        font-size: 15px;
    }


    .order-price strong {
        font-size: 17px;
        font-weight: 700;
        color: #dc2626;
    }


    .order-header {
        font-size: 16px;
    }

    .order-buttons button {
        font-size: 15px;
    }


    .total {
        font-size: 20px;
        color: #ef4444;
    }

    .link {
        display: flex;
        align-items: center;
        text-decoration: none;
        color: inherit;
    }


    /* ENd section-main-ca-nhan */
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
            <a href>
                Tài khoản
            </a>
        </div>
    </div>
</div>
<!-- End section trang chinh - danh muc - san pham -->
<!-- Begin section main -->
<div class="section-main-ca-nhan">
    <div class="container">
        <div class="canhan">
            <div class="tongquan-canhan">
                <div class="logo-name">
                    HT
                </div>
                <p class="name-full">Xin chào, <span class="span">Hoàng
                Trần</span></p>
                <div class="list-canhan">
                    <a href="ThongTinKhachHang.jsp"><i
                            class="fa-solid fa-user"></i> Thông tin
                        tài
                        khoản</a>
                    <a href class="active"><i class="fa-solid fa-box-open"></i> Lịch
                        sử
                        mua
                        hàng</a>
                    <a href="${pageContext.request.contextPath}/logout">
                        <i class="fa-solid fa-rotate"></i> Đổi mật khẩu</a>
                    <a href="${pageContext.request.contextPath}/logout"><i
                            class="fa-solid fa-right-from-bracket"></i>Đăng
                        xuất</a>
                </div>
            </div>
            <div class="order-history">
                <div class="order-tabs">
                    <button class="active">Tất cả</button>
                    <button>Chờ xác nhận</button>
                    <button>Hoàn thành</button>
                    <button>Đã hủy</button>
                </div>

                <!-- Đơn hàng 1 -->
                <div class="order-card">
                    <div class="order-header">
                        <span>Mã đơn: #DH001</span>
                        <span class="order-status pending">Chờ xác
                  nhận</span>
                    </div>

                    <div class="order-items">
                        <div class="order-item">
                            <img src="./assets/images/logo/list1-1.jpg" alt="Sản phẩm 1">
                            <div class="order-info">
                                <p class="order-name">Bút Lông Thiên
                                    Long Fiber Pen Washable - Demon</p>
                                <p class="order-quantity">Số lượng:
                                    2</p>
                            </div>
                            <div class="order-price">
                                <p>168,300₫</p>
                                <strong>336,600₫</strong>
                            </div>
                        </div>

                        <div class="order-item">
                            <img src="./assets/images/logo/list1-3.jpg" alt="Sản phẩm 2">
                            <div class="order-info">
                                <p class="order-name">Bút lông hiên Long
                                    Colokit - Màu sắc tươi sáng</p>
                                <p class="order-quantity">Số lượng:
                                    1</p>
                            </div>
                            <div class="order-price">
                                <p>45,500₫</p>
                                <strong>45,500₫</strong>
                            </div>
                        </div>
                    </div>

                    <div class="order-footer">
                <span class="total">Tổng cộng:
                  <strong>382,100₫</strong></span>
                        <div class="order-buttons">
                            <a href="ProductReviews.jsp" class="btn-review">Đánh giá</a>
                            <button class="btn-cancel">Hủy đơn</button>
                        </div>
                    </div>
                </div>

                <!-- Đơn hàng 2 -->
                <div class="order-card">
                    <div class="order-header">
                        <span>Mã đơn: #DH002</span>
                        <span class="order-status success">Hoàn
                  tất</span>
                    </div>

                    <div class="order-items">
                        <div class="order-item">
                            <img src="./assets/images/logo/list1-4.jpg" alt="Sản phẩm 3">
                            <div class="order-info">
                                <p class="order-name">Màu nước 8 màu
                                    Thiên Long Colokit WACO-C06/AK</p>
                                <p class="order-quantity">Số lượng:
                                    1</p>
                            </div>
                            <div class="order-price">
                                <p>31,080₫</p>
                                <strong>31,080₫</strong>
                            </div>
                        </div>
                    </div>

                    <div class="order-footer">
                <span class="total">Tổng cộng:
                  <strong>31,080₫</strong></span>
                        <div class="order-buttons">
                            <a href="ProductReviews.jsp" class="btn-review">Đánh giá</a>
                            <button class="btn-cancel">Xác nhận</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<!-- End section main -->

<%@ include file="Footer.jsp" %>

</body>

</html>