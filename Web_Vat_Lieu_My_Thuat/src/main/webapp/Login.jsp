<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String ctx = request.getContextPath();
    String timeout = request.getParameter("timeout");
%>
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

/*    style session*/

    #sessionModal {
        position: fixed;
        inset: 0;
        background: rgba(0, 0, 0, 0.55);
        display: none;               /* mặc định ẩn */
        align-items: center;
        justify-content: center;
        z-index: 9999;
    }

    .session-modal-card {
        background: linear-gradient(135deg, #13438F, #1E76EF);
        border-radius: 16px;
        padding: 24px 28px;
        min-width: 320px;
        max-width: 420px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.35);
        text-align: center;
        color: #fff;
        border: 1px solid rgba(245, 223, 77, 0.9);
        animation: fadeInScale 0.25s ease-out;
    }

    .session-modal-icon {
        width: 56px;
        height: 56px;
        border-radius: 50%;
        background: rgba(245, 223, 77, 0.15);
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 12px auto;
        color: #F5DF4D;
        font-size: 26px;
    }

    .session-modal-title {
        margin: 0;
        font-size: 20px;
        font-weight: 700;
        letter-spacing: 0.02em;
    }

    .session-modal-text {
        margin: 10px 0 18px 0;
        font-size: 14px;
        color: #E5ECFF;
    }

    .btn-session-close {
        padding: 8px 20px;
        border-radius: 999px;
        border: none;
        background: #F5DF4D;
        color: #343A40;
        font-weight: 600;
        cursor: pointer;
        font-size: 14px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.25);
        transition: transform 0.15s ease, box-shadow 0.15s ease, background 0.15s ease;
    }
    .btn-session-close i{
       color: #343A40;
    }

    .btn-session-close:hover {
        background: #ffe86f;
        transform: translateY(-1px);
        box-shadow: 0 6px 14px rgba(0, 0, 0, 0.35);
    }

    .btn-session-close:active {
        transform: translateY(0);
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.25);
    }



</style>

<body>
<%@ include file="Header.jsp" %>
<div class="main">
    <div class="container">
        <h4>Đăng Nhập</h4>
<%--  Them e      --%>
<%--        <% String e = request.getAttribute("error")== null?" ": request.getAttribute("error")+" ";%>--%>
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
                        href="${pageContext.request.contextPath}/forgotpassword">đây</a></p>
            </div>
            <button type="submit"
                    class="btn-login">Đăng
                Nhập
            </button>

            <div class="chuataikhoan">
                Bạn chưa có tài khoản <a href= "${pageContext.request.contextPath}/register"
                                         class="link-dki">Đăng ký tại đây</a>
            </div>

            <div class="btn-login-gg">

                <a class="btn-gg" href="${pageContext.request.contextPath}/oauth2/google"
                   style="text-align: center"><i
                        class="fa-brands fa-google"></i>
                    Google
                </a>

            </div>

        </form>
    </div>
</div>
<!-- Modal hết phiên -->
<div id="sessionModal">
    <div class="session-modal-card">
        <div class="session-modal-icon">
            <i class="fa-solid fa-clock-rotate-left"></i>
        </div>
        <h3 class="session-modal-title">Phiên đăng nhập đã hết hạn</h3>
        <p class="session-modal-text">
            Vui lòng đăng nhập lại để tiếp tục sử dụng hệ thống.
        </p>
        <button id="closeSessionModal" class="btn-session-close">
            <i class="fa-solid fa-x"></i> Đóng
        </button>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        var timeoutFlag = "<%= timeout %>";
        if (timeoutFlag === "1") {
            var modal = document.getElementById("sessionModal");
            var btn = document.getElementById("closeSessionModal");
            if (modal && btn) {
                modal.style.display = "flex";

                btn.addEventListener("click", function () {

                    modal.style.display = "none";
                    var emailInput = document.getElementById("email");
                    if (emailInput) emailInput.focus();
                });
            }
        }
    });
</script>

<%@ include file="Footer.jsp" %>


</body>
</html>