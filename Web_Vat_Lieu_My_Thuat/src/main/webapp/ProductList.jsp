<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<c:forEach var="p" items="${products}">
    <div class="list-product-list1">
        <a href="ChiTietSanPham.jsp">
            <img src="${p.thumbnail}" alt="">
            <div class="list-product-list1-content">
                <div class="list-product-list1-content-socials">
                    <div class="list-product-list1-content-socials-1">
                        <i class="fa-solid fa-thumbs-up"></i><span>New</span>
                    </div>
                    <div class="list-product-list1-content-socials-2">
                        <i class="fa-solid fa-arrow-up-right-dots"></i>
                        <span>Đã bán ${p.soldQuantity}</span>
                    </div>
                </div>
                <div class="list-product-list1-content-description">
                    <p class="content">${p.name}</p>
                    <div class="star">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <span>(0)</span>
                    </div>
                    <h2 class="price-product-after">
                        <fmt:formatNumber value="${p.priceAfterDiscount}" type="number"/>₫
                    </h2>
                    <p class="price-product-before">
                        <fmt:formatNumber value="${p.price}" type="number" />₫
                    </p>
                    <span class="price-product-discount">
                        -${p.discountDefault}%
                    </span>
                    <div class="button">
                        <a href="ChiTietSanPham.jsp">
                            <button class="btn-xemchitiet">
                                <i class="fa-solid fa-eye"></i>
                                Xem chi tiết
                            </button>
                        </a>
                    </div>
                </div>
            </div>
        </a>
    </div>
</c:forEach>
