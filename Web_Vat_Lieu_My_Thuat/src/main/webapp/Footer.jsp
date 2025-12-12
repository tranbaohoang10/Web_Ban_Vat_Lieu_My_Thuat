<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--CSS footer--%>
<style>
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
</style>
<%-------------------------%>
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
            <a href="IntroductionPage.jsp">
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
            <a href ="${pageContext.request.contextPath}/contact">
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
