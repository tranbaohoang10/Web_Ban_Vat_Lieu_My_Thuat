<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập</title>
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

    /* login */
    .main {
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        background-color: #1E76EF;
    }

    .container {
        /* background-color: #13438F; */
        background-color: rgba(0, 0, 0, 0.4);
        padding: 45px 45px;
        box-sizing: border-box;
        overflow: hidden;
        position: relative;
        transition: 0.5s ease;
        /* display: flex; */
        /* justify-content: space-between; */
        flex-wrap: wrap;
        border-radius: 10px;
        width: 460px;
        height: 480px;

    }

    h4 {
        color: white;
        text-align: center;
        text-transform: uppercase;
        margin-bottom: 30px;
        font-weight: 700;

    }


    .form-1 label {
        margin-bottom: 20px;
        display: block;
        margin-bottom: 5px;
        /* font-size: 0.9em; */
        /* color: #6CA4B9;*/
        color: white;
    }

    .form-1:nth-of-type(2) {
        margin-top: 10px;
    }


    .form-2 label {
        margin-bottom: 20px;
        /* margin-top: 20px; */
        display: block;
        color: #6CA4B9;
    }

    .form-1 input {
        width: 100%;
        padding: 10px 0;
        background: transparent;
        border: none;
        border-bottom: 1px solid #ffffff;
        color: white;
        outline: none;
        box-sizing: border-box;
    }

    .form-2 input {
        width: 100%;
        padding: 10px 0;
        background: transparent;
        border: none;
        border-bottom: 1px solid #ffffff;
        color: white;
        outline: none;
        box-sizing: border-box;
    }

    .form-1 input::placeholder {
        color: #a0a0a0;
    }

    .form-2 {
        margin-top: 10px;
    }

    .forgot-password {
        text-align: center;
        margin-bottom: 20px;

    }

    .forgot-password a {
        color: #ffc107;
        text-decoration: none;

    }

    .forgot-password a:hover {
        color: #6C785B;
    }

    .btn-login {
        width: 100%;
        background-color: #F5DF4D;
        padding: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-bottom: 15px;
        color: #343A40;
    }

    .link-dki {
        color: #FFC107;
        text-decoration: none;
    }

    .link-dki:hover {
        color: #6C785B;
    }

    .btn-login-gg {
        display: flex;
        justify-content: space-between;
    }

    .btn-gg {
        background-color: #DE3F32;
        color: white;
        border: none;
        border-radius: 5px;
        padding: 10px;
        padding-left: 50px;
        padding-right: 50px;
        margin-top: 10px;
        cursor: pointer;
        width: 100%;
    }

    .btn-fb {
        background-color: #49669C;
        color: white;
        border: none;
        border-radius: 5px;
        padding: 10px;
        padding-left: 50px;
        padding-right: 50px;
        margin-top: 10px;
        cursor: pointer;

    }

    .btn-login-gg i {
        margin-right: 8px;
    }

    p {
        color: white;
    }

    .chuataikhoan {
        color: white;
        text-align: center;
    }

    /* End footer */
</style>

<body>
<%@ include file="Header.jsp" %>
<div class="main">
    <div class="container">
        <h4>Đăng Nhập</h4>
        <form action="${pageContext.request.contextPath}/login" method="post" class="form-login">
            <div class="form-1">
                <label for="email"> Email*</label>
                <input type="email" name="email" placeholder="Nhập Email"
                       required
                       id="email">
                <span id="email-error"
                      style="color: #FFD700; font-size: 14px;"></span>
            </div>
            <div class="form-1">
                <label for="password"> Mật Khẩu*</label>
                <input type="password" name="password" placeholder="Nhập mật khẩu"
                       required id="password">
            </div>
            <p style="color: red; margin-top:8px"> ${error}</p>

            <div class="forgot-password">
                <p>Quên mật khẩu? Nhấn vào <a
                        href="QuenMatKhau.jsp">đây</a></p>
            </div>
            <button type="submit"
                    class="btn-login">Đăng
                Nhập
            </button>

            <div class="chuataikhoan">
                Bạn chưa có tài khoản <a href="DangKy.jsp"
                                         class="link-dki">Đăng ký tại đây</a>
            </div>

            <div class="btn-login-gg">

                <button class="btn-gg"><i
                        class="fa-brands fa-google"></i>Google
                </button>

            </div>

        </form>
    </div>
</div>
<%@ include file="Footer.jsp" %>
</body>
</html>