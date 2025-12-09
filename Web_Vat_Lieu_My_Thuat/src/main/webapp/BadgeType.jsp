<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .badge-icon { font-size: 12px; }
    .badge-new  { color: #268EF8!important; }
    .badge-hot  { color: #ED1C24!important; }
    .badge-sale { color: #64da36 !important; }

</style>

<c:if test="${not empty p.badgeType}">
    <div class="list-product-list1-content-socials-1">
        <c:choose>
            <c:when test="${p.badgeType == 'NEW'}">
                <i class="fa-solid fa-thumbs-up badge-icon badge-new"></i>
                <span style="color: #268EF8">New</span>
            </c:when>

            <c:when test="${p.badgeType == 'HOT'}">
                <i class="fa-solid fa-fire badge-icon badge-hot"></i>
                <span style="color: #ED1C24">Hot</span>
            </c:when>

            <c:when test="${p.badgeType == 'SALE'}">
                <i class="fa-solid fa-tags badge-icon badge-sale"></i>
                <span style="color: #64da36">Sale</span>
            </c:when>
        </c:choose>
    </div>
</c:if>