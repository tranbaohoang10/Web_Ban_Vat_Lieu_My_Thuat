<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký</title>
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
          integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

</head>
<style>
    .container {
        width: 1200px;
        margin: auto;
    }

    /* style login */
    .main {
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        background-color: #1E76EF;
        padding-top: 50px;
    }

    .container {
        background-color: rgba(0, 0, 0, 0.4);
        padding: 40px 50px;
        /* box-sizing: border-box; */
        /* overflow: hidden; */
        transition: 0.5s ease;
        /* border-radius: 10px; */
        width: 530px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
    }

    h2 {
        color: white;
        text-align: center;
        text-transform: uppercase;
        margin-bottom: 15px;
    }

    .label {
        color: white;
        padding-left: 38%;
        font-size: 18px;
    }

    .btn-doi {
        display: flex;
        justify-content: space-between;
        margin-bottom: 25px;
        background-color: white;
        border-radius: 30px;
        padding: 5px;
    }

    .btn-doi button {
        flex: 1;
        border: none;
        border-radius: 25px;
        padding: 12px 0;
        font-weight: bold;
        cursor: pointer;
        font-size: 14px;
        transition: 0.3s;
    }

    .infor {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 15px 20px;
        margin-bottom: 20px;
    }

    .infor .tt-chitiet label {
        font-size: 17px;
        font-weight: normal;
        color: white;
    }

    .infor .tt-chitiet input {
        width: 100%;
        border: none;
        padding: 8px;
        border-bottom: 1px solid #ccc;
        outline: none;
        font-size: 14px;
        background: none;
        color: white;
        outline: none;

        border-radius: 8px;
        padding: 10px;
        color: #fff;
        transition: border-color 0.3s;

    }

    .infor .tt-chitiet input::placeholder {
        color: #B0B0B0;
    }


    .btn-DangKy {
        background: linear-gradient(90deg, #FFD700, #FFC107);
        width: 100%;
        background-color: #F5DF4D;
        padding: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-bottom: 15px;
        /* color: #343A40; */
        color: #000;
        font-weight: bold;
        transition: 0.3s;
    }

    .btn-DangKy:hover {
        transform: scale(1.05);
    }

    .dang-nhap {
        text-align: center;
        font-size: 17px;
        color: white;
        margin-bottom: 20px;
    }

    .dang-nhap a {
        color: #FFD700;
        text-decoration: none;

    }

    .dang-nhap a:hover {
        color: #6C785B;

    }

    .btn-dang-nhap-tt {
        display: flex;
        justify-content: space-between;
    }

    .btn-dang-nhap-tt button {
        width: 48%;
        border: none;
        border-radius: 8px;
        padding: 10px;
        font-size: 14px;
        color: white;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
    }

    .btn-gg {
        background-color: #DE3F32;
        margin-left: 140px;
    }

    /* .btn-fb{
        background-color: #49669C;

    } */
    .btn-dang-nhap-tt i {
        font-size: 16px;
    }

    .text-login {
        margin-top: 16px;
        text-align: center;
        color: #ffffff; /* màu chữ “Bạn đã có tài khoản” */
        font-size: 16px;
    }

    /* Style riêng cho link Đăng nhập */
    .text-login a {
        color: #FFD700; /* màu vàng giống theme */
        text-decoration: none; /* bỏ gạch chân */
        font-weight: 500;
    }

    .text-login a:hover {
        text-decoration: underline; /* nếu muốn hover có gạch chân */
    }


    /* end login */
</style>

<body>
<%@ include file="Header.jsp" %>
<div class="main">
    <div class="container">
        <h2>Đăng Ký</h2>

        <form action class="infor">
            <div class="tt-chitiet" style="grid-column: span 2;">
                <label for="Ho">Họ và Tên:</label>
                <input type="text" id="Ho" name="fullName"
                       placeholder="Họ và Tên" required>
            </div>

            <div class="tt-chitiet">
                <label for="Email">Email cá nhân:</label>
                <input type="email" id="email" name="email"
                       placeholder="Email cá nhân" required>
                <span id="email-error"
                      style="color: #FFD700; font-size: 14px;"></span>
            </div>

            <div class="tt-chitiet">
                <label for="sdt">Số điện thoại:</label>
                <input type="text" id="sdt" name="phone"
                       placeholder="Số điện thoại">
            </div>

            <div class="tt-chitiet"
                 style="grid-column: span 2; position: relative;">
                <label for="Mk">Mật khẩu:</label>
                <input type="password" id="Mk" name="password"
                       placeholder="Mật khẩu" required>
                <i class="hide-display" id="togglePassword"
                   style="position:absolute; right:10px; top:38px; cursor:pointer;"></i>
            </div>

            <button type="submit" class="btn-DangKy"
                    style="grid-column: span 2;">
                Đăng ký
            </button>
        </form>

        <p class="text-login">
            Bạn đã có tài khoản
            <a href="DangNhap.jsp">Đăng nhập tại đây</a>
        </p>

        <div class="btn-dang-nhap-tt">
            <button class="btn-gg"><i
                    class="fa-brands fa-google"></i>Google
            </button>

        </div>
    </div>
</div>
<%@ include file="Footer.jsp" %>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const form = document.querySelector('.infor');

        form.addEventListener('submit', function (e) {
            e.preventDefault();

            alert('Đăng ký thành công!');
        });
    });
</script>
</body>

</html>