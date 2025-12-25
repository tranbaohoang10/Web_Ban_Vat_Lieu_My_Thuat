<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin khách hàng</title>
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
          integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>

<body>
<style>
    .container {
        width: 1200px;
        margin: auto;
    }

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

    #section-info-mithuat .info-mithuat-header:hover + .hover-block {
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

        font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
        font-size: 14px;
        color: #333;
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

    .link {
        display: flex;
        align-items: center;
        text-decoration: none;
        color: inherit;
    }

    /* ENd section-main-ca-nhan */
</style>
<!-- Begin header-->

<%@ include file="Header.jsp" %>
<!-- End header-->
<!-- Begin section info mithuat -->
<div id="section-info-mithuat">
    <div class="container">
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

            <c:set var="activePage" value="profile" scope="request"/>
            <%@ include file="AccountSideBar.jsp" %>

            <div class="thongtin-canhan">
                <form action="${pageContext.request.contextPath}/profile" method="post">
                    <h2>Thông tin tài khoản</h2>
                    <label for="hovaten">Họ và tên:</label>
                    <br>
                    <input type="text" id="hovaten" name="fullName"
                           value="${sessionScope.currentUser.fullName}">
                    <br>
                    <label for="email">Email:</label>
                    <br>
                    <input type="email" id="email"
                           value="${sessionScope.currentUser.email}"
                           disabled>
                    <br>
                    <label for=" sodienthoai">Số điện thoại:</label>
                    <br>
                    <input type="text" id="sodienthoai" name="phoneNumber"
                           value="${sessionScope.currentUser.phoneNumber}">
                    <br>
                    <label for="ngaysinh">Ngày sinh:</label>
                    <br>
                    <input type="date" id="ngaysinh" name="dob"
                           value="${dob}">
                    <br>
                    <label for="diachi">Địa chỉ:</label>
                    <br>
                    <input type="text" id="diachi" name="address"
                           value="${sessionScope.currentUser.address}">
                    <br>
                    <input type="submit" value="Cập nhật thông tin" class="button">
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const params = new URLSearchParams(window.location.search);

        if (params.get("success") === "true") {
            Swal.fire({
                icon: 'success',
                title: 'Cập nhật thông tin thành công!',
                showConfirmButton: false,
                timer: 2000
            });
        }
    });
</script>

<!-- End section main -->
<%@ include file="Footer.jsp" %>
</body>

</html>