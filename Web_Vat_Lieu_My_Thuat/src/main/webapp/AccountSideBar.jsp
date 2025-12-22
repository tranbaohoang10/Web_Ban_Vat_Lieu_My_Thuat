<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<style>
    .section-main-ca-nhan {
        padding-bottom: 20px;
        padding-top: 20px;
    }

    .section-main-ca-nhan .container {
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 10px;

    }

    .section-main-ca-nhan .container .canhan {
        display: flex;
        gap: 30px;
    }

    .section-main-ca-nhan .container .tongquan-canhan {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 15px;
        background-color: #F1F1F1;
        border-radius: 10px;
        width: 30%;
        padding: 10px;

        top: 20px;
        height: fit-content;

    }

    .section-main-ca-nhan .container .tongquan-canhan .logo-name {
        width: 80px;
        height: 80px;
        background-color: #FB9F10;
        border-radius: 50%;
        color: white;
        font-size: 36px;
        display: flex;
        justify-content: center;
        align-items: center;
        font-weight: 700;
        margin-top: 20px;
    }

    .section-main-ca-nhan .container .tongquan-canhan .name-full {
        font-size: 18px;
        font-style: italic;
    }

    .section-main-ca-nhan .container .tongquan-canhan .name-full .span {
        color: #2659F3;
        font-weight: 600;
    }

    .section-main-ca-nhan .container .tongquan-canhan .list-canhan {
        display: flex;
        flex-direction: column;
        width: 100%;
        align-items: center;
        justify-content: center;

    }

    .section-main-ca-nhan .container .tongquan-canhan .list-canhan a {
        width: calc(100% - 30px);
        display: block;
        padding: 15px;
        background-color: #2659F3;
        text-decoration: none;
        color: white;
        font-size: 18px;
        font-weight: 600;
    }

    .section-main-ca-nhan .container .tongquan-canhan .list-canhan a:first-child {

        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
    }

    .section-main-ca-nhan .container .tongquan-canhan .list-canhan a.active {
        background-color: #FB9F10;
        transition: all 0.4s;
    }

    .section-main-ca-nhan .container .tongquan-canhan .list-canhan a:last-child {
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
    }


    .section-main-ca-nhan .container .tongquan-canhan .list-canhan a:hover {
        background-color: #FB9F10;
        transition: all 0.4s;
    }
    .section-main-ca-nhan .container .tongquan-canhan .list-canhan a.active{
        background-color: #FB9F10 !important;
    }

</style>
<div class="tongquan-canhan">
    <div class="logo-name">
        <c:choose>
            <c:when test="${not empty sessionScope.currentUser.fullName}">
                ${fn:substring(sessionScope.currentUser.fullName, 0, 1)}
            </c:when>
            <c:otherwise>U</c:otherwise>
        </c:choose>
    </div>

    <p class="name-full">
        Xin chào, <span class="span">${sessionScope.currentUser.fullName}</span>
    </p>

    <div class="list-canhan">
        <a href="${pageContext.request.contextPath}/profile"
           class="${activePage == 'profile' ? 'active' : ''}">
            <i class="fa-solid fa-user"></i> Thông tin tài khoản
        </a>

        <a href="${pageContext.request.contextPath}/order-history"
           class="${activePage == 'orders' ? 'active' : ''}">
            <i class="fa-solid fa-box-open"></i> Lịch sử mua hàng
        </a>

        <a href="${pageContext.request.contextPath}/change-password"
           class="${activePage == 'changePassword' ? 'active' : ''}">
            <i class="fa-solid fa-rotate"></i> Đổi mật khẩu
        </a>

        <a href="${pageContext.request.contextPath}/logout">
            <i class="fa-solid fa-right-from-bracket"></i> Đăng xuất
        </a>
    </div>
</div>
