<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="cp"  value="${pageContext.request.contextPath}" />
<c:set var="uri" value="${pageContext.request.requestURI}" />

<div class="left">
    <div class="list-admin">

        <a href="${cp}/admin/overview" class="logo">
            <img src="${cp}/assets/images/logo/logo.png" alt="">
        </a>

        <a href="${cp}/admin/overview"
           class="${fn:contains(uri, '/admin/overview') ? 'active' : ''}">
            <i class="fa-solid fa-house"></i> Tổng quan
        </a>

        <a href="${cp}/admin/statistics"
           class="${fn:contains(uri, '/admin/statistics') ? 'active' : ''}">
            <i class="fa-solid fa-chart-line"></i> Thống kê
        </a>

        <a href="${cp}/admin/categories"
           class="${fn:contains(uri, '/admin/categories') ? 'active' : ''}">
            <i class="fa-solid fa-list"></i> Quản lý danh mục
        </a>

        <a href="${cp}/admin/products"
           class="${fn:contains(uri, '/admin/products') ? 'active' : ''}">
            <i class="fa-solid fa-palette"></i> Quản lý sản phẩm
        </a>

        <a href="${cp}/admin/users"
           class="${fn:contains(uri, '/admin/users') ? 'active' : ''}">
            <i class="fa-solid fa-person"></i> Quản lý người dùng
        </a>

        <a href="${cp}/admin/orders"
           class="${fn:contains(uri, '/admin/orders') ? 'active' : ''}">
            <i class="fa-solid fa-box-open"></i> Quản lý đơn hàng
        </a>

        <a href="${cp}/admin/vouchers"
           class="${fn:contains(uri, '/admin/vouchers') ? 'active' : ''}">
            <i class="fa-solid fa-gift"></i> Quản lý khuyến mãi
        </a>

        <a href="${cp}/admin/sliders"
           class="${fn:contains(uri, '/admin/sliders') ? 'active' : ''}">
            <i class="fa-solid fa-sliders"></i> Quản lý Slider Show
        </a>

        <a href="${cp}/admin/contacts"
           class="${fn:contains(uri, '/admin/contacts') ? 'active' : ''}">
            <i class="fa-solid fa-address-book"></i> Quản lý liên hệ
        </a>

        <a href="${cp}/logout">
            <i class="fa-solid fa-right-from-bracket"></i> Đăng xuất
        </a>

    </div>
</div>
