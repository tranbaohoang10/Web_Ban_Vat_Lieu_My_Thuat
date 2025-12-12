<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên mật khẩu</title>
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
        /* background-color: #1E76EF; */
        background: linear-gradient(to left, #2659F3, #09BCE4);


    }

    .container {
        background-color: rgba(0, 0, 0, 0.4);
        padding: 45px 45px;
        box-sizing: border-box;
        overflow: hidden;
        position: relative;
        transition: 0.5s ease;
        flex-wrap: wrap;
        border-radius: 10px;
        width: 460px;
        height: 480px;

    }

    h2 {
        color: white;
        text-align: center;
        text-transform: uppercase;
        margin-bottom: 10px;
        font-weight: 700;

    }

    p {
        color: white;
        text-align: center;
        margin-bottom: 20px;
    }

    .form-email .form-1 input {
        width: 100%;
        border: none;
        padding: 8px;
        border-bottom: 1px solid #ccc;
        outline: none;
        font-size: 14px;
        background: none;
        color: white;
        border-radius: 8px;
        padding: 10px;
        transition: border-color 0.3s;
    }

    .form-email .form-1 input::placeholder {
        color: #ccc5c5;
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

    .btn-lay-mk {
        width: 100%;
        background-color: #F5DF4D;
        padding: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-bottom: 5px;
        margin-top: 15px;
        color: #343A40;
        font-size: 1rem;
        font-weight: bold;
    }

    .btn-lay-mk:hover {
        transform: scale(1.05);
    }

    .quay-lai-dang-nhap {
        text-align: center;
        margin-bottom: 15px;
    }

    .link-quay-lai {
        color: white;
        text-decoration: none;
        text-align: center;
    }

    .link-quay-lai:hover {
        color: #6C785B;
    }

    .link-dki {
        color: #FFC107;
        text-decoration: none;
    }

    .link-dki:hover {
        color: #6C785B;
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


</style>

<body>
<%@ include file="Header.jsp" %>
<div class="main">
    <div class="container">
        <h2>ĐẶT LẠI MẬT KHẨU</h2>
        <p>Chúng tôi sẽ gửi cho bạn một email để kích hoạt việc đặt lại
            mật khẩu</p>
        <form action = "${pageContext.request.contextPath}/forgotpassword" class="form-email" method="post">

            <div class="form-1">
                <input type="email" name = "email" placeholder="Email" required>
            </div>

            <p style="color: red; margin-top: 10px">${error}</p>
            <p style="color: #00ff00; margin-top: 10px">${success}</p>

            <button type="submit" class="btn-lay-mk">Lấy lại mật khẩu</button>

            <div class="quay-lai-dang-nhap">
                <a href="Login.jsp" class="link-quay-lai">Quay lại
                </a>
            </div>

            <div class="chuataikhoan">
                Bạn chưa có tài khoản <a href="${pageContext.request.contextPath}/register"
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
            <i class="fa-brands fa-facebook"></i>
            <i class="fa-brands fa-youtube"></i>
        </div>
    </div>
</footer>

</body>

</html>