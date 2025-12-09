<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List,java.util.ArrayList" %>
<%@ page import="vn.edu.nlu.fit.mythuatshop.Model.Users" %>
<%@ page import="vn.edu.nlu.fit.mythuatshop.Model.CartItem" %>
<%@ page import="vn.edu.nlu.fit.mythuatshop.Model.Product" %>
<%@ page import="vn.edu.nlu.fit.mythuatshop.Service.ProductService" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
          integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<%
    // 1. Bắt buộc đăng nhập
    Users currentUser = (Users) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login");
        return;
    }

    // 2. Lấy giỏ hàng từ session
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
    }

    // 3. Đếm số lượng sản phẩm + chuẩn bị tính tổng tiền
    int totalQuantity = cart.size();   // số loại sản phẩm
    long totalAmount = 0;

    ProductService productService = new ProductService();
%>
<style>
    .container {
        width: 1200px;
        margin: auto;
    }

    /* begin style shopping cart */

    .main {
        margin-top: 110px;
    }


    .container {
        width: 1200px;
        margin: auto;
    }

    .breadcrumb {
        /* background-color: #f3f4f6; */
        background: #DBE8FF;
        color: #17479d;
        font-weight: 500;
        font-size: 16px;
        padding: 12px 40px;
        border-bottom: 1px solid #e5e7eb;
        margin-top: 100px;
    }

    .grid {
        display: grid;
        grid-template-columns: 2fr 1fr;
        gap: 20px;
    }

    .card {
        background: #fff;
        border-radius: 12px;
        box-shadow: 0 2px 16px rgba(0, 0, 0, .08);
        border: 1px solid #e5e7eb;
    }

    .card-body {
        padding: 22px 26px;
    }

    .card-title {
        margin: 0 0 6px;
        font-size: 28px;
        font-weight: 700;
        color: #111827;
    }

    .subtle {
        color: #282b30;
    }

    .divider {
        height: 1px;
        background: #969aa3;
        margin: 16px 0;
    }

    .cart-item-card {
        background: #fff;
        border: 1px solid #e5e7eb;
        border-radius: 10px;
        box-shadow: 0 1px 6px rgba(0, 0, 0, 0.05);
        padding: 16px;
        margin-bottom: 16px;
        transition: box-shadow 0.2s ease;
    }

    .cart-list .item {
        padding: 8px 0;
    }

    .item-grid {
        display: flex;
        grid-template-columns: 84px 1fr auto auto;
        align-items: center;
        gap: 14px;
    }

    .thumb {
        width: 74px;
        height: 74px;
        border-radius: 8px;
        background: #f5f5f5;
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
        border: 1px solid #eee;
    }

    .thumb img {
        max-width: 100%;
        max-height: 100%;
        object-fit: cover;
    }

    .meta-title {
        font-weight: 700;
        color: #111827;
        margin-bottom: 4px;
        line-height: 1.35;
    }

    .muted {
        color: #6b7280;
        font-size: 14px;
    }

    .qty {
        display: inline-flex;
        align-items: center;
        background: #fff;
        border: 1px solid #e5e7eb;
        border-radius: 8px;
        overflow: hidden;
    }

    .qty button {
        width: 34px;
        height: 34px;
        border: none;
        background: #fff;
        font-size: 18px;
        cursor: pointer;
    }

    .qty button:hover {
        background: #f3f4f6;
    }

    .qty input[type="number"] {
        width: 50px;
        height: 34px;
        text-align: center;
        border: none;
        font-weight: 600;
        outline: none;
    }

    .qty button:first-child {
        border-right: 1px solid #e5e7eb;
    }

    .qty button:last-child {
        border-left: 1px solid #e5e7eb;
    }

    .price {
        font-weight: 600;
        color: #ef4444;
        font-size: 18px;
    }

    .summary .head {
        display: flex;
        justify-content: space-between;
        align-items: flex-end;
    }

    .summary .total {
        font-size: 22px;
        font-weight: 800;
        color: #ef4444;
    }

    .btn {
        width: 100%;
        border: none;
        border-radius: 8px;
        padding: 12px 14px;
        letter-spacing: .3px;
        background: #2659F3;
        color: #fff;
        cursor: pointer;
        margin-top: 8px;
        font-size: 1rem;
        font-weight: 600;
    }

    .card,
    .summary .card {
        border-radius: 12px;
    }

    .summary {
        height: fit-content;
    }

    .tinh-tien {
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-weight: 600;
        font-size: 18px;
        margin: 10px 0;
    }

    .tinh-tien p {
        margin: 0;
        color: #111827;
    }

    .tinh-tien .thanh-tien {
        color: #ef4444;
        font-weight: 700;
        font-size: 18px;
    }

    .qty-wrap {
        position: relative;
        display: inline-block;
    }

    .Xoa-sp {
        position: absolute;
        top: 0;
        right: 0;
        transform: translate(50%, -50%);
        width: 28px;
        height: 28px;
        border: none;
        border-radius: 50%;
        background: #111;
        color: #fff;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        box-shadow: 0 2px 8px rgba(0, 0, 0, .15);
        z-index: 2;
    }


    /* từ sửa sau */
    html,
    body {
        height: 100%;
        margin: 0;
        padding: 0;
    }

    body {
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }

    main {
        flex: 1;
    }


    /* end style shopping cart */
</style>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const updateUrl = '<%=request.getContextPath()%>/AddToCartController?action=ajaxUpdate';

        const qtyInputs = document.querySelectorAll('.qty-input');

        qtyInputs.forEach(input => {
            input.addEventListener('change', function () {
                const productId = this.dataset.productId;
                let quantity = parseInt(this.value, 10);
                if (isNaN(quantity) || quantity < 1) {
                    quantity = 1;
                    this.value = 1;
                }
                updateCartItem(productId, quantity);
            });
        });

        function formatCurrency(value) {
            return new Intl.NumberFormat('vi-VN').format(value) + 'đ';
        }

        function updateCartItem(productId, quantity) {
            const params =
                'productId=' + encodeURIComponent(productId) +
                '&quantity=' + encodeURIComponent(quantity);

            fetch(updateUrl, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
                },
                body: params
            })
                .then(resp => resp.json())
                .then(data => {
                    if (!data.success) {
                        console.error('Update cart failed');
                        return;
                    }

                    // cập nhật thành tiền từng dòng
                    const subSpan = document.getElementById('subtotal-' + productId);
                    if (subSpan) {
                        subSpan.textContent = formatCurrency(data.itemSubtotal);
                    }

                    // cập nhật tổng tiền
                    const totalSpan = document.querySelector('.thanh-tien');
                    if (totalSpan) {
                        totalSpan.textContent = formatCurrency(data.totalAmount);
                    }

                    // cập nhật số trên icon giỏ hàng
                    const cartIcon = document.getElementById('cartIcon');
                    if (cartIcon) {
                        cartIcon.setAttribute('data-count', data.cartCount);
                    }
                })
                .catch(err => console.error(err));
        }
    });
</script>

<body>
<%@ include file="Header.jsp" %>
<!-- Breadcrumb -->
<div class="breadcrumb">Trang chủ / Giỏ hàng</div>
<div class="container">
    <div class="grid">
        <!-- LEFT: CART -->
        <div class="card">
            <div class="card-body">
                <h2 class="card-title">Giỏ hàng của bạn</h2>
                <p class="subtle">
                    Bạn đang có <%= totalQuantity %> sản phẩm trong giỏ hàng
                </p>
                <div class="divider"></div>

                <form action="${pageContext.request.contextPath}/AddToCartController?action=update" method="post">
                    <div class="cart-list">
                        <%
                            if (cart.isEmpty()) {
                        %>
                        <p>Giỏ hàng của bạn đang trống.</p>
                        <%
                        } else {
                            for (CartItem item : cart) {
                                Product p = productService.getProductById(item.getProductId());
                                if (p == null) continue;

                                int qty = item.getQuantity();
                                long price = (long) p.getPriceAfterDiscount();
                                long subTotal = price * qty;
                                totalAmount += subTotal;
                        %>

                        <div class="cart-item-card">
                            <div class="item">
                                <div class="item-grid">
                                    <div class="select-product">
                                        <input type="checkbox" checked/>
                                    </div>

                                    <div class="thumb">
                                        <img src="<%= p.getThumbnail() %>" alt="<%= p.getName() %>"/>
                                    </div>

                                    <div>
                                        <div class="meta-title"><%= p.getName() %></div>
                                        <div class="muted">Mã SP: <%= p.getId() %></div>
                                    </div>

                                    <div class="price">
    <span class="price-value"
          id="subtotal-<%= p.getId() %>">
        <%= String.format("%,d₫", subTotal) %>
    </span>
                                    </div>

                                    <div class="qty-wrap">
                                        <!-- nút Xóa -->
                                        <a class="Xoa-sp"
                                           href="${pageContext.request.contextPath}/AddToCartController?action=remove&productId=<%= p.getId() %>"
                                           aria-label="Xóa sản phẩm">
                                            <i class="fa-solid fa-xmark"></i>
                                        </a>

                                        <input type="hidden" name="productId" value="<%= p.getId() %>"/>
                                        <div class="qty">
                                            <input type="number"
                                                   name="quantity"
                                                   value="<%= qty %>" min="1"
                                                   class="qty-input"
                                                   data-product-id="<%= p.getId() %>"/>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <%
                                } // end for
                            } // end else
                        %>
                    </div>

                    <!-- nút cập nhật -->
                </form>
            </div>
        </div>

        <!-- RIGHT: TỔNG TIỀN -->
        <div class="card summary">
            <div class="card-body">
                <div class="head">
                    <h3 style="margin:0;font-size:28px;font-weight:700">
                        Thông tin đơn hàng
                    </h3>
                </div>
                <div class="divider"></div>

                <div class="tinh-tien">
                    <p>Tổng tiền:</p>
                    <span class="thanh-tien">
                        <%= String.format("%,dđ", totalAmount) %>
                    </span>
                </div>

                <p class="muted">Phí vận chuyển sẽ được tính ở trang Thanh toán</p>
                <p class="muted">Mã giảm giá được nhập ở trang Thanh toán</p>

                <a href="ThanhToan.jsp">
                    <button class="btn" <%= cart.isEmpty() ? "disabled" : "" %>>
                        Đặt hàng
                    </button>
                </a>
            </div>
        </div>
    </div>
</div>
<%@ include file="Footer.jsp" %>
</body>

</html>