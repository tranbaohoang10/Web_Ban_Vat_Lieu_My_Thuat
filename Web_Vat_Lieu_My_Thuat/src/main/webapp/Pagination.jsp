
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .section-main-content-quantity {
        display: flex;
        align-items: center;
        justify-content: end;
        margin-bottom: 30px;
        margin-right: 15px;
        margin-top: 30px;
    }

    .section-main-content-quantity .page-link {
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

    .section-main-content-quantity .page-link.active {
        background-color: #2659F3;
        color: #fff;
    }

    .section-main-content-quantity .page-link:hover {
        background-color: #DEE2E6;
    }

</style>
<div class="section-main-content-quantity">
    <c:if test="${totalPages > 1 and totalProducts > 0}">
        <c:forEach var="p" begin="1" end="${totalPages}">
            <a href="#" class="page-link ${p == currentPage ? 'active' : ''}" data-page="${p}"> ${p} </a>
        </c:forEach>
    </c:if>
</div>