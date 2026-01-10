<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm kiếm</title>

    <!-- ✅ Dùng contextPath để không lỗi đường dẫn CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
          integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <style>
        .container {
            width: 1200px;
            margin: auto;
        }

        #section-info-mithuat {
            padding-top: 100px;
            background: #E5EEFF;
        }

        #section-trangchinh-danhmuc-sanpham {
            background-color: #DBE8FF;
        }

        #section-trangchinh-danhmuc-sanpham .content {
            padding: 20px 0;
            margin-bottom: 30px;
        }

        #section-trangchinh-danhmuc-sanpham .content a {
            text-decoration: none;
            color: black;
        }

        #section-trangchinh-danhmuc-sanpham .content a:nth-child(3) {
            color: #17479D;
        }

        /* Begin section-main */
        #section-main .container {
            display: flex;
            border: 1px solid #ddd;
            margin-bottom: 30px;
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
            border-radius: 10px;
            background: #fff;
        }

        #section-main .section-main-content {
            width: 100%;
            padding: 0 30px;
        }

        #section-main .section-main-content .section-main-content-image img {
            width: 100%;
            margin-top: 30px;
            border-radius: 20px;
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
            width: calc(25% - 17px);
            cursor: pointer;
            display: flex;
            flex-direction: column;
        }

        #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 img {
            border-radius: 15px;
            width: 100%;
            height: 250px;
            object-fit: cover;
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
            display: flex;
            flex-direction: column;
            flex-grow: 1;
            justify-content: space-between;
        }

        #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content .content {
            width: 200px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content-socials .list-product-list1-content-socials-1 {
            width: 60px;
            border-radius: 10px;
            text-align: center;
            line-height: 30px;
            background-color: #FFE0E2;
        }

        #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content-socials .list-product-list1-content-socials-1 i {
            color: #ED1C24;
            font-size: 10px;
        }

        #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content-socials .list-product-list1-content-socials-1 span {
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

        a { text-decoration: none; }

        #section-main .section-main-content .section-main-content-list .list-product .list-product-list1 .list-product-list1-content .list-product-list1-content-description .star i {
            color: #F3C63F;
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
            color: #268EF8;
            cursor: pointer;
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
            color: #666;
            border-radius: 50%;
            transition: all 0.3s ease;
        }

        #section-main .section-main-content .section-main-content-quantity a.active {
            background-color: #2659F3;
            color: white;
            border-color: #2659F3;
        }

        #section-main .section-main-content .section-main-content-quantity a:hover {
            background-color: #DEE2E6;
            color: #333;
        }

        #section-main .section-main-content .section-main-content-quantity a.active:hover {
            background-color: #1a47c9;
            color: white;
        }

        .search-sort {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            margin: 10px 0 20px;
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
            user-select: none;
        }

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
    </style>
</head>

<body>
<!-- Begin header-->
<%@ include file="Header.jsp" %>
<!-- End header-->

<!-- Begin section info mithuat -->
<div id="section-info-mithuat">
    <div class="container"></div>
</div>

<!-- Begin section main -->
<div id="section-main">
    <div class="container">
        <div class="section-main-content">

            <div class="section-main-content-list">
                <h2 class="header">
                    <c:choose>
                        <c:when test="${totalProducts > 0}">
                            Có ${totalProducts} kết quả tìm kiếm cho: "<c:out value="${keyword}"/>"
                        </c:when>
                        <c:otherwise>
                            Kết quả tìm kiếm cho: "<c:out value="${keyword}"/>"
                        </c:otherwise>
                    </c:choose>
                </h2>

                <!-- ✅ products rỗng vẫn KHÔNG làm bể div -->
                <c:if test="${empty products}">
                    <p>Không tìm thấy sản phẩm nào.</p>
                </c:if>

                <!-- ✅ chỉ bọc phần sort/list/paging trong not empty -->
                <c:if test="${not empty products}">
                    <div class="search-sort">
                        <span class="search-sort-label">Sắp xếp theo:</span>

                        <form id="filterForm"
                              action="${pageContext.request.contextPath}/search"
                              method="get">
                            <!-- giữ lại keyword -->
                            <input type="hidden" name="keyword" value="${keyword}"/>

                            <!-- sort hiện tại -->
                            <input type="hidden" name="sort" id="sortInput" value="${param.sort}"/>

                            <div class="search-sort-tabs">
                                <span class="sort-option ${empty param.sort ? 'active' : ''}" data-sort="">Tất cả</span>
                                <span class="sort-option ${param.sort == 'soldDesc' ? 'active' : ''}" data-sort="soldDesc">Bán chạy</span>
                                <span class="sort-option ${param.sort == 'newest' ? 'active' : ''}" data-sort="newest">Sản phẩm mới</span>
                                <span class="sort-option ${param.sort == 'priceAsc' ? 'active' : ''}" data-sort="priceAsc">Giá tăng dần</span>
                                <span class="sort-option ${param.sort == 'priceDesc' ? 'active' : ''}" data-sort="priceDesc">Giá giảm dần</span>
                            </div>
                        </form>
                    </div>

                    <div class="list-product" id="productList">
                        <%@ include file="ProductList.jsp" %>
                    </div>

                    <div class="section-main-content-quantity">
                        <c:if test="${totalPages > 1}">
                            <c:forEach var="p" begin="1" end="${totalPages}">
                                <a href="#"
                                   class="page-link ${p == currentPage ? 'active' : ''}"
                                   data-page="${p}">
                                        ${p}
                                </a>
                            </c:forEach>
                        </c:if>
                    </div>
                </c:if>
            </div>

        </div>
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

        // Nếu products rỗng thì form/productList không tồn tại => không chạy ajax
        if (!form || !productList || !sortInput) return;

        function submitFilter(extraParams = {}) {
            const formData = new FormData(form);
            formData.append('ajax', '1');

            // thêm params như page...
            Object.keys(extraParams).forEach(k => formData.set(k, extraParams[k]));

            const params = new URLSearchParams(formData);

            fetch(form.action + '?' + params.toString(), {
                method: 'GET',
                headers: { 'X-Requested-With': 'XMLHttpRequest' }
            })
                .then(response => response.text())
                .then(html => {
                    productList.innerHTML = html;
                })
                .catch(err => console.error('Lỗi khi lọc sản phẩm:', err));
        }

        // Click sort
        sortOptions.forEach(option => {
            option.addEventListener('click', function () {
                sortOptions.forEach(o => o.classList.remove('active'));
                this.classList.add('active');

                const sortValue = this.getAttribute('data-sort');
                sortInput.value = sortValue;

                // về trang 1 khi đổi sort
                submitFilter({ page: 1 });
            });
        });

        // Click phân trang
        document.addEventListener('click', function (e) {
            if (e.target.classList.contains('page-link')) {
                e.preventDefault();

                const page = e.target.getAttribute('data-page');
                const keywordEl = document.querySelector('input[name="keyword"]');

                const keyword = keywordEl ? keywordEl.value : '';
                const sort = sortInput.value || '';

                submitFilter({
                    keyword: keyword,
                    sort: sort,
                    page: page
                });

                // update active UI
                document.querySelectorAll('.page-link').forEach(link => {
                    link.classList.remove('active');
                    if (link.getAttribute('data-page') === page) link.classList.add('active');
                });

                productList.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    });
</script>

</body>
</html>
