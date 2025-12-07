<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm kiếm</title>
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
    /* Begin section-main */

    #section-main .container {
        display: flex;
        border: 1px solid #ddd;
        margin-bottom: 30px;
        box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
        border-radius: 10px;
    }

    #section-main .section-main-filter {
        display: flex;
        flex-direction: column;
        flex-wrap: wrap;
        width: 15%;
        padding-left: 15px;
        padding-top: 30px;
        padding-bottom: 30px;
        position: sticky;
        top: 20px;
        height: fit-content;
    }

    #section-main .section-main-filter .header {
        color: #5980f6;
        margin-top: 0;
    }

    #section-main .section-main-filter input {
        display: inline-block;
        margin-right: 10px;
    }

    #section-main .section-main-filter-loaisanpham {
        border-bottom: 1px solid #ddd;
    }

    #section-main .section-main-filter-loaisanpham .list label {
        display: inline-block;
        cursor: pointer;
        margin-bottom: 10px;
    }

    #section-main .section-main-filter-loaisanpham .list input {
        display: inline-block;
        cursor: pointer;
    }

    #section-main .section-main-filter-loaisanpham .xemthem {
        margin-left: 30px;
        cursor: pointer;
        margin-bottom: 15px;
    }

    #section-main .section-main-filter-mucgia {
        border-bottom: 1px solid #ddd;
    }

    #section-main .section-main-filter-mucgia .list label {
        display: inline-block;
        margin-bottom: 10px;
        cursor: pointer;
        font-size: 14px;
    }

    #section-main .section-main-filter-mucgia .list input {
        display: inline-block;
        cursor: pointer;
    }

    #section-main .section-main-filter-mucgia .list label:nth-child(1) {
        margin-left: 32px;
    }

    #section-main .section-main-filter-tieuchi {
        border-bottom: 1px solid #ddd;
    }

    #section-main .section-main-filter-tieuchi .list label {
        display: inline-block;
        margin-bottom: 10px;
        cursor: pointer;
        font-size: 14px;
    }

    #section-main .section-main-filter-tieuchi .list input {
        display: inline-block;
        cursor: pointer;
    }


    #section-main .section-main-content {
        width: 85%;
        /* padding: 15px; */


    }


    #section-main .section-main-content .section-main-content-image img {
        width: calc(100% - 60px);
        margin-top: 30px;
        margin-left: 30px;
        border-radius: 20px;
    }

    #section-main .section-main-content .section-main-content-list {
        margin-left: 30px;
    }

    #section-main .section-main-content .section-main-content-list .list-product {
        display: flex;
        gap: 20px;
        margin-bottom: 30px;
        flex-wrap: wrap;
    }

    #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 {
        border-radius: 15px;
        background-color: #F8FAFF;
        border: 1px solid #D7E5FF;
        width: calc(25% - 20px);
        cursor: pointer;
    }

    #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 img {
        border-radius: 15px;
        width: 100%;
    }

    #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content-socials {
        display: flex;
        align-items: center;
        gap: 10px;
        margin-top: 10px;

    }

    #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content {
        padding: 0 15px 15px;
        text-align: center;
    }

    /* chu y */
    #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content .content {
        width: 200px;
        white-space: nowrap;
        /* không cho xuống dòng */
        overflow: hidden;
        /* ẩn phần bị tràn */
        text-overflow: ellipsis;
        /* thêm dấu … */
    }

    #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content-socials .list-product-list1-content-socials-1 {
        width: 60px;
        border-radius: 10px;
        text-align: center;
        line-height: 30px;
        /* height: 30px; */
        /* padding: 5px; */
        background-color: #FFE0E2;
    }

    #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content-socials .list-product-list1-content-socials-1 i {
        color: #ED1C24;
        font-size: 10px;
    }

    #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content-socials .list-product-list1-content-socials-1 span {
        /* display: inline-block; */
        color: #ED1C24;
        font-size: 12px;
        font-weight: 600;
        margin-left: 5px;
    }

    #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content-socials .list-product-list1-content-socials-2 {
        width: 100px;
        border-radius: 10px;
        text-align: center;
        line-height: 30px;
        /* height: 30px; */
        background-color: #E0EBFF;
    }

    #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content-socials .list-product-list1-content-socials-2 i {
        color: #268EF8;
        font-size: 10px;
    }

    #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content-socials .list-product-list1-content-socials-2 span {
        color: #268EF8;
        font-size: 12px;
        font-weight: 600;
        margin-left: 5px;
    }

    #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content .list-product-list1-content-description p {
        font-size: 14px;
        color: black;
    }

    a {
        text-decoration: none;
    }

    #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content .list-product-list1-content-description .star i {
        color: #F3C63F
    }

    #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content .list-product-list1-content-description .star span {
        color: #F3C63F;
        margin-left: 10px;
    }

    #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content .list-product-list1-content-description .price-product-after {
        color: #268EF8;
        font-weight: 600;
    }

    #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content .list-product-list1-content-description .price-product-before {
        color: #ccc;
        font-weight: 600;
        text-decoration: line-through;
        display: inline-block;
        margin: 0;
    }

    #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content .list-product-list1-content-description .price-product-discount {
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

    #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content .list-product-list1-content-description .button {
        margin-top: 15px;
        text-align: center;
    }

    #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content .list-product-list1-content-description .button .btn-xemchitiet {
        min-width: 64%;
        padding: 10px 0;
        background-color: transparent;
        border: 1px solid #268EF8;
        border-radius: 10px;
        color: white;
        cursor: pointer;

    }

    #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content .list-product-list1-content-description .button .btn-xemchitiet {
        color: #268EF8;
    }

    #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content .list-product-list1-content-description .button .btn-xemchitiet:hover {
        background-color: #268EF8;
        color: white;
    }

    #section-main .section-main-content .section-main-content-quantity {
        display: flex;
        align-items: center;
        justify-content: end;
        margin-bottom: 30px;
        margin-right: 15px;
        margin-top: 30px;
    }

    #section-main .section-main-content .section-main-content-quantity a {
        display: inline-block;
        width: 35px;
        height: 35px;
        background-color: transparent;
        border: 1px solid #ddd;
        margin: 10px;
        text-align: center;
        line-height: 35px;
        text-decoration: none;
        color: #ccc;
        border-radius: 50%;
    }

    #section-main .section-main-content .section-main-content-quantity a:nth-child(1) {
        background-color: #2659F3;
        color: white;
    }

    #section-main .section-main-content .section-main-content-quantity a:hover {
        background-color: #DEE2E6;
    }

    #section-main .section-main-content .section-main-content-quantity a:nth-child(1):hover {
        background-color: #2659F3;
        color: white;
    }

    /* End section-main */


</style>

<body>
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
                Danh mục /
            </a>
            <a href>
                Tất cả sản phẩm
            </a>
        </div>
    </div>
</div>
<!-- End section trang chinh - danh muc - san pham -->
<!-- Begin section main -->
<div id="section-main">
    <div class="container">
        <div class="section-main-filter">

            <div class="section-main-filter-mucgia">
                <h3 class="header">
                    Mức giá
                </h3>
                <form action class="list">
                    <label for="sanpham1">Giá dưới 100.000đ</label>
                    <br>
                    <input type="checkbox" name="sanpham2"
                           id="sanpham-mucgia-2">
                    <label for="sanpham-mucgia-2">100.000đ -
                        300.000đ</label>
                    <br>
                    <input type="checkbox" name="sanpham3"
                           id="sanpham-mucgia-3">
                    <label for="sanpham-mucgia-3">300.000đ -
                        500.000đ</label>
                    <br>
                    <input type="checkbox" name="sanpham4"
                           id="sanpham-mucgia-4">
                    <label for="sanpham-mucgia-4">500.000đ -
                        700.000đ</label>
                    <br>
                    <input type="checkbox" name="sanpham5"
                           id="sanpham-mucgia-5">
                    <label for="sanpham-mucgia-5">700.000đ -
                        1.000.000đ</label>
                    <br>
                    <input type="checkbox" name="sanpham1"
                           id="sanpham-mucgia-6">
                    <label for="sanpham-mucgia-6">Giá trên
                        1.000.000đ</label>
                    <br>
                </form>

            </div>
            <div class="section-main-filter-tieuchi">
                <h3 class="header">
                    Tiêu chí
                </h3>
                <form action class="list">
                    <input type="checkbox" name="sanpham2"
                           id="sanphamcaonhat">
                    <label for="sanphamcaonhat">Giá cao nhất</label>
                    <br>
                    <input type="checkbox" name="sanpham2"
                           id="sanphamthapnhat">
                    <label for="sanphamthapnhat">Giá thấp nhất</label>
                    <br>
                    <input type="checkbox" name="sanpham3"
                           id="sanphamdanhgiacaonhat">
                    <label for="sanphamdanhgiacaonhat">Đánh giá cao
                        nhất</label>
                    <br>
                    <input type="checkbox" name="sanpham4"
                           id="sanphammoi">
                    <label for="sanphammoi">Sản phẩm mới</label>
                    <br>

                </form>

            </div>

        </div>
        <div class="section-main-content">
            <div class="section-main-content-image">
                <img
                        src="./assets/images/logo/1920x600_c17ffe56498a4e2a9e5d27ac6eeaaad2_1024x1024.jpg"
                        alt>
            </div>
            <div class="section-main-content-list">
                <h2 class="header">Mỹ Thuật</h2>
                <div class="list-product">
                    <div class="list-product-list1">
                        <a href="ProductDetails.jsp">
                            <img src="./assets/images/logo/list1-1.jpg"
                                 alt>
                            <div class="list-product-list1-content">
                                <div
                                        class="list-product-list1-content-socials">
                                    <div
                                            class="list-product-list1-content-socials-1"><i
                                            class="fa-solid fa-thumbs-up"></i><span>New</span></div>
                                    <div
                                            class="list-product-list1-content-socials-2"><i
                                            class="fa-solid fa-arrow-up-right-dots"></i><span>Đã
                                                    bán 6</span></div>
                                </div>
                                <div
                                        class="list-product-list1-content-description">
                                    <p class="content">Bút Lông Thiên
                                        Long
                                        48/60 Màu Fiber Pen Washable -
                                        Phiên
                                        bản
                                        Demon Slayer</p>
                                    <div class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <span>(0)</span>
                                    </div>
                                    <h2
                                            class="price-product-after">168,300₫</h2>
                                    <p class="price-product-before">
                                        198,000đ</p>
                                    <span
                                            class="price-product-discount">-15%</span>
                                    <div class="button">
                                        <a href="ProductDetails.jsp">
                                            <button
                                                    class="btn-xemchitiet">
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
                    <div class="list-product-list1">
                        <a href="ProductDetails.jsp">
                            <img src="./assets/images/logo/list1-2.jpg"
                                 alt>
                            <div class="list-product-list1-content">
                                <div
                                        class="list-product-list1-content-socials">
                                    <div
                                            class="list-product-list1-content-socials-1"><i
                                            class="fa-solid fa-thumbs-up"></i><span>New</span></div>
                                    <div
                                            class="list-product-list1-content-socials-2"><i
                                            class="fa-solid fa-arrow-up-right-dots"></i><span>Đã
                                                    bán 11</span></div>
                                </div>
                                <div
                                        class="list-product-list1-content-description">
                                    <p class="content">[Bộ 12/18/24] Màu
                                        Gouache dạng tuýp 12ml Thiên
                                        Long
                                        Colokit
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
                                            class="price-product-after">80,800₫</h2>
                                    <p
                                            class="price-product-before">101,000đ</p>
                                    <span
                                            class="price-product-discount">-20%</span>
                                    <div class="button">
                                        <button class="btn-xemchitiet">
                                            <i
                                                    class="fa-solid fa-eye"></i>
                                            Xem chi tiết
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </a>

                    </div>
                    <div class="list-product-list1">
                        <a href="ProductDetails.jsp">
                            <img src="./assets/images/logo/list1-3.jpg"
                                 alt>
                            <div class="list-product-list1-content">
                                <div
                                        class="list-product-list1-content-socials">
                                    <div
                                            class="list-product-list1-content-socials-1"><i
                                            class="fa-solid fa-thumbs-up"></i><span>New</span></div>
                                    <div
                                            class="list-product-list1-content-socials-2"><i
                                            class="fa-solid fa-arrow-up-right-dots"></i><span>Đã
                                                    bán 826</span></div>
                                </div>
                                <div
                                        class="list-product-list1-content-description">
                                    <p class="content">[Tặng 2/4/6 màu]
                                        Acrylic Markers/ Bút sơn/ Bút
                                        lông
                                        12/24/36
                                        màu
                                        ThiênLong
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
                                            class="price-product-after">45,500₫</h2>
                                    <p
                                            class="price-product-before">65,000₫</p>
                                    <span
                                            class="price-product-discount">-30%</span>
                                    <div class="button">
                                        <button class="btn-xemchitiet">
                                            <i
                                                    class="fa-solid fa-eye"></i>
                                            Xem chi tiết
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </a>

                    </div>
                    <div class="list-product-list1">
                        <a href="ProductDetails.jsp"><img
                                src="./assets/images/logo/list1-4.jpg"
                                alt>
                            <div class="list-product-list1-content">
                                <div
                                        class="list-product-list1-content-socials">
                                    <div
                                            class="list-product-list1-content-socials-1"><i
                                            class="fa-solid fa-thumbs-up"></i><span>New</span></div>
                                    <div
                                            class="list-product-list1-content-socials-2"><i
                                            class="fa-solid fa-arrow-up-right-dots"></i><span>Đã
                                                    bán 73</span></div>
                                </div>
                                <div
                                        class="list-product-list1-content-description">
                                    <p class="content">Màu nước 8 màu
                                        Thiên
                                        Long Colokit WACO-C06/AK - Dễ
                                        dàng
                                        pha
                                        trộn
                                        màu - Phiên bản Akooland</p>
                                    <div class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <span>(0)</span>
                                    </div>
                                    <h2
                                            class="price-product-after">31,040₫</h2>
                                    <p
                                            class="price-product-before">38,800₫</p>
                                    <span
                                            class="price-product-discount">-20%</span>
                                    <div class="button">
                                        <button class="btn-xemchitiet">
                                            <i
                                                    class="fa-solid fa-eye"></i>
                                            Xem chi tiết
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </a>

                    </div>
                    <div class="list-product-list1">
                        <a href="ProductDetails.jsp">
                            <img src="./assets/images/logo/list1-5.jpg"
                                 alt>
                            <div class="list-product-list1-content">
                                <div
                                        class="list-product-list1-content-socials">
                                    <div
                                            class="list-product-list1-content-socials-1"><i
                                            class="fa-solid fa-thumbs-up"></i><span>New</span></div>
                                    <div
                                            class="list-product-list1-content-socials-2"><i
                                            class="fa-solid fa-arrow-up-right-dots"></i><span>Đã
                                                    bán 74</span></div>
                                </div>
                                <div
                                        class="list-product-list1-content-description">
                                    <p class="content">Bút lông 12 màu
                                        Fiber
                                        Pen Thiên Long Colokit FP-01/AK
                                        -
                                        Ngòi Fine
                                        tô đều màu và liên tục - Phiên
                                        bản
                                        Akooland</p>
                                    <div class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <span>(0)</span>
                                    </div>
                                    <h2
                                            class="price-product-after">21,780₫</h2>
                                    <p
                                            class="price-product-before">39,600₫</p>
                                    <span
                                            class="price-product-discount">-45%</span>
                                    <div class="button">
                                        <button class="btn-xemchitiet">
                                            <i
                                                    class="fa-solid fa-eye"></i>
                                            Xem chi tiết
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </a>

                    </div>
                    <div class="list-product-list1">
                        <a href="ProductDetails.jsp">
                            <img src="./assets/images/logo/list1-6.jpg"
                                 alt>
                            <div class="list-product-list1-content">
                                <div
                                        class="list-product-list1-content-socials">
                                    <div
                                            class="list-product-list1-content-socials-1"><i
                                            class="fa-solid fa-thumbs-up"></i><span>New</span></div>
                                    <div
                                            class="list-product-list1-content-socials-2"><i
                                            class="fa-solid fa-arrow-up-right-dots"></i><span>Đã
                                                    bán 170</span></div>
                                </div>
                                <div
                                        class="list-product-list1-content-description">
                                    <p class="content">Bút lông 6/12 màu
                                        nhũ
                                        Fiber Pen Metallic Thiên Long
                                        Colokit - Màu
                                        nhũ lấp lánh, vẽ được trên giấy
                                        đen</p>
                                    <div class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <span>(0)</span>
                                    </div>
                                    <h2
                                            class="price-product-after">36,000₫</h2>
                                    <p
                                            class="price-product-before">60,000₫</p>
                                    <span
                                            class="price-product-discount">-40%</span>
                                    <div class="button">
                                        <button class="btn-xemchitiet">
                                            <i
                                                    class="fa-solid fa-eye"></i>
                                            Xem chi tiết
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </a>

                    </div>
                    <div class="list-product-list1">
                        <a href="ProductDetails.jsp">
                            <img src="./assets/images/logo/list1-7.jpg"
                                 alt>
                            <div class="list-product-list1-content">
                                <div
                                        class="list-product-list1-content-socials">
                                    <div
                                            class="list-product-list1-content-socials-1"><i
                                            class="fa-solid fa-thumbs-up"></i><span>New</span></div>
                                    <div
                                            class="list-product-list1-content-socials-2"><i
                                            class="fa-solid fa-arrow-up-right-dots"></i><span>Đã
                                                    bán 329</span></div>
                                </div>
                                <div
                                        class="list-product-list1-content-description">
                                    <p class="content">Bút sáp 12/18 màu
                                        Thiên Long Colokit - Màu sắc
                                        tươi
                                        sáng Phủ đều
                                        Bền màu - Phiên bản Akooland</p>
                                    <div class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <span>(0)</span>
                                    </div>
                                    <h2
                                            class="price-product-after">11,800₫</h2>
                                    <p
                                            class="price-product-before">19,800₫</p>
                                    <span
                                            class="price-product-discount">-40%</span>
                                    <div class="button">
                                        <button class="btn-xemchitiet">
                                            <i
                                                    class="fa-solid fa-eye"></i>
                                            Xem chi tiết
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </a>

                    </div>
                    <div class="list-product-list1">
                        <a href="ProductDetails.jsp">
                            <img src="./assets/images/logo/list1-8.jpg"
                                 alt>
                            <div class="list-product-list1-content">
                                <div
                                        class="list-product-list1-content-socials">
                                    <div
                                            class="list-product-list1-content-socials-1"><i
                                            class="fa-solid fa-thumbs-up"></i><span>New</span></div>
                                    <div
                                            class="list-product-list1-content-socials-2"><i
                                            class="fa-solid fa-arrow-up-right-dots"></i><span>Đã
                                                    bán 1152</span></div>
                                </div>
                                <div
                                        class="list-product-list1-content-description">
                                    <p class="content">Acrylic Markers/
                                        Bút
                                        sơn/ Bút lông 12/24/36 màu
                                        ThiênLong
                                        Colokit
                                        - Màu sắc tươi sáng, Không thấm
                                        qua
                                        mặt giấy</p>
                                    <div class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <span>(0)</span>
                                    </div>
                                    <h2
                                            class="price-product-after">61,380₫</h2>
                                    <p
                                            class="price-product-before">102,300₫</p>
                                    <span
                                            class="price-product-discount">-40%</span>
                                    <div class="button">
                                        <button class="btn-xemchitiet">
                                            <i
                                                    class="fa-solid fa-eye"></i>
                                            Xem chi tiết
                                        </button>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
                </a>

            </div>
            <div class="section-main-content-quantity">
                <a href>1</a>
                <a href>2</a>
                <a href>3</a>
                <a href>...</a>
                <a href>9</a>
                <a href><i class="fa-solid fa-angle-right"></i></a>
                <a href><i class="fa-solid fa-angles-right"></i></a>

            </div>
        </div>
    </div>
</div>
<!-- End section main -->

<%@ include file="Footer.jsp" %>

</body>

</html>