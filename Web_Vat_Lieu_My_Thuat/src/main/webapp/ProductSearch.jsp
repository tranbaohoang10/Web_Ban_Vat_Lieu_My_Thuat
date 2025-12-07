<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    #section-info-mithuat {
        padding-top: 100px;
        background: #E5EEFF;
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

    #section-trangchinh-danhmuc-sanpham .content a:nth-child(3) {
        color: #17479D;
    }

    /* End section-trangchinh-danhmuc-sanpham */
    /* Begin section-main */

    #section-main .container {
        display: flex;
        border: 1px solid #ddd;
        margin-bottom: 30px;
        box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
        border-radius: 10px;
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

    .search-sort {
        display: flex;
        align-items: center;
        justify-content: flex-start;
        margin: 10px 30px 20px;
        gap: 12px;
    }

    .search-sort-label {
        font-weight: 600;
        margin-right: 8px;
    }

    .search-sort-tabs {
        display: flex;
        align-items: center;
        gap: 20px;
        font-size: 14px;
    }

    .sort-option {
        position: relative;
        cursor: pointer;
        padding-bottom: 4px;
        color: #333;
    }

    /* Gạch chân + màu khi được chọn */
    .sort-option.active {
        color: #17479D;
        font-weight: 600;
    }

    .sort-option.active::after {
        content: "";
        position: absolute;
        left: 0;
        bottom: 0;
        height: 2px;
        width: 100%;
        background-color: #17479D;
        border-radius: 999px;
    }

    /* End section-main */

</style>
<body>
<!-- Begin header-->
<%@ include file="Header.jsp" %>
<!-- End header-->

<!-- Begin section info mithuat -->
<div id="section-info-mithuat">
    <div class="container">
    </div>
</div>
<!-- End section trang chinh - danh muc - san pham -->
<!-- Begin section main -->
<div id="section-main">
    <div class="container">

        <div class="section-main-content">

            <div class="section-main-content-list">
                <h2 class="header">Kết quả tìm kiếm cho: "<c:out value="${keyword}"/>"</h2>

                <c:if test="${empty products}">
                    <p>Không tìm thấy sản phẩm nào.</p>
                </c:if>

                <c:if test="${not empty products}">
                <div class="search-sort">
                    <span class="search-sort-label">Sắp xếp theo:</span>

                    <form id="filterForm"
                          action="${pageContext.request.contextPath}/search"
                          method="get">

                        <!-- giữ lại keyword -->
                        <input type="hidden" name="keyword" value="${keyword}"/>

                        <!-- sort hiện tại -->
                        <input type="hidden" name="sort" id="sortInput"
                               value="${empty param.sort ? 'soldDesc' : param.sort}"/>

                        <div class="search-sort-tabs">
                <span class="sort-option
                      <c:if test='${param.sort == "soldDesc" || empty param.sort}'>active</c:if>"
                      data-sort="soldDesc">
                    Bán chạy
                </span>

                            <span class="sort-option
                      <c:if test='${param.sort == "newest"}'>active</c:if>"
                                  data-sort="newest">
                    Sản phẩm mới
                </span>

                            <span class="sort-option
                      <c:if test='${param.sort == "priceAsc"}'>active</c:if>"
                                  data-sort="priceAsc">
                    Giá tăng dần
                </span>

                            <span class="sort-option
                      <c:if test='${param.sort == "priceDesc"}'>active</c:if>"
                                  data-sort="priceDesc">
                    Giá giảm dần
                </span>
                        </div>
                    </form>
                </div>
                <div class="list-product" id="productList">
                    <%@ include file="ProductList.jsp" %>
                </div>

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
        </c:if>
    </div>
</div>
<!-- End section main -->

<!-- Begin footer-->
<%@ include file="Footer.jsp" %>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const form = document.getElementById('filterForm');
        const productList = document.getElementById('productList');
        const sortInput = document.getElementById('sortInput');
        const sortOptions = document.querySelectorAll('.sort-option');

        if (!form || !productList) return;

        function submitFilter() {
            const formData = new FormData(form);
            formData.append('ajax', '1');

            const params = new URLSearchParams(formData);

            fetch(form.action + '?' + params.toString(), {
                method: 'GET',
                headers: {
                    'X-Requested-With': 'XMLHttpRequest'
                }
            })
                .then(response => response.text())
                .then(html => {
                    productList.innerHTML = html;
                })
                .catch(err => {
                    console.error('Lỗi khi lọc sản phẩm:', err);
                });
        }

        // Click vào từng tab sort
        sortOptions.forEach(option => {
            option.addEventListener('click', function () {
                // đổi highlight
                sortOptions.forEach(o => o.classList.remove('active'));
                this.classList.add('active');

                const sortValue = this.getAttribute('data-sort');
                sortInput.value = sortValue;

                // gọi AJAX
                submitFilter();
            });
        });
    });
</script>


</body>

</html>