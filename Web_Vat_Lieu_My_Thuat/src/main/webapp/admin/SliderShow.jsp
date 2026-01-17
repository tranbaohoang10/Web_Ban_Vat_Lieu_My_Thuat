<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý slider show</title>
        <link rel="stylesheet" href="../assets/css/style.css">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
            integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />

    </head>
    <style>
    #main {
        display: flex;
    }

    #main .left {
        background-color: #17479D;
        height: 100vh;
        width: 17%;
    }

    #main .left .list-admin {
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    #main .left .list-admin a {
        display: block;
        text-decoration: none;
        color: white;
        padding: 10px 20px;
    }

    #main .left .list-admin a i {
        margin-right: 20px;
    }

    #main .left .list-admin a:hover {
        background-color: #203247;
        border-left: #3B7DDD 2px solid;
    }

    #main .left .list-admin .logo img {
        width: 100%;
        height: auto;
        margin: 10px 0 20px 0;
    }

    #main .left .list-admin a.logo {
        padding: 0;
    }

    #main .left .list-admin a.logo:hover {
        background-color: #203247;
        border-left: none;
    }

    .list-admin a.active {
        background-color: #203247;
        border-left: 4px solid #FFD700;
        /* hoặc màu khác */
        font-weight: bold;
    }

    #main .right .container {
        display: flex;
        flex-direction: column;
        width: calc(100% - 100px);
        margin-top: 20px;
        margin-left: auto;
        margin-right: auto;
    }

    #main .right {
        flex: 1;
        background-color: #F9F9F9;
    }

    #main .right .container .dashboard {
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
        padding: 20px 10px;
        background-color: white;
        border-radius: 5px;
    }

    #main .right .container .dashboard h1 {
        width: 100%;
    }

    #main .right .container .dashboard .total-box {
        background-color: #17479D;
        color: white;
        border-radius: 5px;
    }

    #main .right .container .dashboard .total-box hr {
        border: 1px solid #ffffff33;
        width: 80%;
        margin-left: auto;
        margin-right: auto;
    }

    #main .right .container .dashboard .total-box h2,
    h3 {
        padding: 10px 20px;
        text-align: center;
    }

    /* sửa margin */
    .order-container {
        width: 95%;
        margin: 10px auto 5px;
        background: white;
        padding: 25px;
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    /*  */

    .search {
        display: flex;
        align-items: center;
        justify-content: end;
        gap: 10px;
        width: 100%;
        margin: 0 auto;
        margin-bottom: 15px;
    }

    .search-input-icon {
        display: flex;
        align-items: center;
        border: 1px solid #ddd;
        border-radius: 10px;
        overflow: hidden;
        background: #fff;
    }

    .search-input-icon input {
        padding: 10px 15px;
        border: none;
        outline: none;
        width: 250px;
        font-size: 14px;
    }

    .icon {
        background: #f1f1f1;
        padding: 10px 15px;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
    }

    .icon i {
        font-size: 16px;
        color: #333;
    }

    .btn-Sua {
        background-color: #FFC107;
        color: black;
        border: none;
        padding: 6px 10px;
        cursor: pointer;
        font-size: 14px;
        border-radius: 4px;
        transition: 0.2s;
    }

    .btn-Sua:hover {
        background-color: #e0a800;
    }

    .btn-Xoa {
        background-color: #DC3545;
        color: white;
        border: none;
        padding: 6px 10px;
        cursor: pointer;
        font-size: 14px;
        border-radius: 4px;
        transition: 0.2s;
    }

    .btn-Xoa:hover {
        background-color: #b02a37;
    }

    .btn-Sua i,
    .btn-Xoa i {
        font-size: 14px;
    }

    .btn-them-banner {
        background-color: #2659F5;
        border: none;
        color: white;
        padding: 8px 16px;
        font-size: 14px;
        border-radius: 5px;
        cursor: pointer;
        margin-left: 0;
    }

    /*  */


    h1 {
        margin: 0;
        margin-bottom: 10px;
        color: #222;
    }

    .sub-title {
        color: #555;
        font-size: 16px;
        margin-bottom: 20px;
    }

    .order-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }

    .order-table th {
        background: #2659F5;
        color: white;
        padding: 12px;
        font-size: 14px;
    }

    .order-table td {
        padding: 12px;
        background: #fafafa;
    }

    .order-table tr:nth-child(even) td {
        background: #f0f0f0;
    }

    .order-table td,
    .order-table th {
        border-bottom: 1px solid #ddd;
        text-align: left;
    }

    /* thêm cho ảnh tin tức */
    .order-table img {
        width: 100px;
        height: auto;
        border-radius: 5px;
    }

    /* Trạng thái đơn hàng */
    .status {
        padding: 6px 12px;
        border-radius: 8px;
        font-size: 13px;
        font-weight: bold;
    }

    .status.pending {
        background: #FFF3CD;
        color: #555;
    }

    .status.success {
        background: #D1FAE5;
        color: #0f5132;
    }

    .status.cancel {
        background: #ffd6d6;
        color: #b91c1c;
    }

    /* ================== MODAL THÊM KHÁCH HÀNG ================== */
    .modal {
        position: fixed;
        inset: 0;
        /* top:0; right:0; bottom:0; left:0 */
        background: rgba(0, 0, 0, 0.4);
        display: none;
        /* Ẩn mặc định */
        align-items: center;
        /* Căn giữa theo chiều dọc */
        justify-content: center;
        /* Căn giữa theo chiều ngang */
        z-index: 999;
    }

    .modal-content {
        background: #fff;
        width: 400px;
        max-width: 95%;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        overflow: hidden;
        animation: fadeInScale 0.2s ease-out;
    }

    .modal-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 12px 16px;
        background-color: #2659F5;
        color: #fff;
    }

    .modal-header h2 {
        margin: 0;
        font-size: 18px;
        text-align: center;
    }

    #customerModal .modal-header h2 {
        width: 100%;
        text-align: center;
    }

    #editCustomerModal .modal-header h2 {
        width: 100%;
        text-align: center;
    }

    .close-modal {
        cursor: pointer;
        font-size: 20px;
        padding: 0 5px;
    }

    .close-edit-modal {
        cursor: pointer;
        font-size: 20px;
        padding: 0 5px;
    }

    .modal-body {
        padding: 15px 16px 5px;
    }

    .form-group {
        display: flex;
        flex-direction: column;
        margin-bottom: 10px;
    }

    .form-group label {
        font-size: 14px;
        margin-bottom: 4px;
        color: #333;
    }

    .form-group input,
    .form-group select {
        padding: 8px 10px;
        border-radius: 6px;
        border: 1px solid #ddd;
        font-size: 14px;
        outline: none;
    }

    .form-group input:focus,
    .form-group select:focus {
        border-color: #2659F5;
    }

    .modal-footer {
        display: flex;
        justify-content: flex-end;
        gap: 8px;
        padding: 10px 16px 14px;
        background: #f7f7f7;
    }

    .btn-cancel,
    .btn-save {
        border: none;
        border-radius: 5px;
        padding: 8px 14px;
        font-size: 14px;
        cursor: pointer;
    }

    .btn-cancel {
        background: #e0e0e0;
        color: #333;
    }

    .btn-save {
        background: #2659F5;
        color: #fff;
    }

    .btn-edit-cancel,
    .btn-edit-save {
        border: none;
        border-radius: 5px;
        padding: 8px 15px;
        font-size: 14px;
        cursor: pointer;
    }

    .btn-edit-cancel {
        background: #e0e0e0;
        color: #333;
    }

    .btn-edit-save {
        background: #2659F5;
        color: #fff;
    }

    /* =========Xem trang trc sau======== */

    .pagination {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 25px 0;
        gap: 5px;
    }

    .page-link {
        padding: 6px 12px;
        border: 1px solid #d0d7de;
        border-radius: 4px;
        color: #0d6efd;
        background-color: white;
        text-decoration: none;
        font-size: 14px;
        transition: 0.2s;
    }

    .page-link:hover {
        background-color: #e9ecef;
    }

    .page-link.active {
        background-color: #2659F5;
        color: white;
        font-weight: bold;
        border-color: #2659F5;
    }

    /* Hiệu ứng nhỏ khi mở modal */
    @keyframes fadeInScale {
        from {
            opacity: 0;
            transform: scale(0.9);
        }

        to {
            opacity: 1;
            transform: scale(1);
        }
    }
</style>

    <body>


    <div id="main">
        <jsp:include page="/admin/includes/Sidebar.jsp" />

        <div class="right">
            <div class="container">
                <div class="order-container">
                    <h1>Danh sách banner</h1>

                    <!-- SEARCH: submit về /admin/sliders -->
                    <form class="search" method="get" action="${pageContext.request.contextPath}/admin/sliders">
                        <div class="search-input-icon">
                            <input type="text" name="q" value="${q}" placeholder="Tìm kiếm slider...">
                            <button class="icon" type="submit" style="border:none;">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                        </div>
                        <button type="button" class="btn-them-banner">Thêm banner</button>
                    </form>

                    <!-- BẢNG: bỏ "Ngày tạo" vì DB không có -->
                    <table class="order-table">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tiêu đề</th>
                            <th>Trạng thái</th>
                            <th>Thứ tự</th>
<%--                            <th>Link</th>--%>
                            <th>Ảnh</th>
                            <th>Tùy chọn</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="s" items="${sliders}">
                            <tr>
                                <td>${s.id}</td>
                                <td class="col-title">${s.title}</td>

                                <td class="col-status">
                                    <c:choose>
                                        <c:when test="${s.status == 1}">
                                            <span class="status success">Hiển thị</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="status cancel">Ẩn</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <td class="col-order">${s.indexOrder}</td>
<%--                                <td class="col-link">${s.linkTo}</td>--%>

                                <td>
                                    <img class="col-thumb" src="${s.thumbnail}" alt="banner">
                                </td>

                                <td>
                                    <!-- SỬA: mở modal edit, đổ data-* -->
                                    <button class="btn-Sua btn-open-edit"
                                            data-id="${s.id}"
                                            data-title="${s.title}"
                                            data-status="${s.status}"
                                            data-order="${s.indexOrder}"
<%--                                            data-link="${s.linkTo}"--%>
                                            data-thumb="${s.thumbnail}">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </button>

                                    <!-- TOGGLE status -->
                                    <form style="display:inline;" method="post" action="${pageContext.request.contextPath}/admin/sliders">
                                        <input type="hidden" name="action" value="toggle">
                                        <input type="hidden" name="id" value="${s.id}">
                                        <input type="hidden" name="currentStatus" value="${s.status}">
                                        <button class="btn-Sua" type="submit" title="Ẩn/Hiện">
                                            <i class="fa-solid fa-eye"></i>
                                        </button>
                                    </form>

                                    <!-- XÓA -->
                                    <form style="display:inline;" method="post"
                                          action="${pageContext.request.contextPath}/admin/sliders"
                                          onsubmit="return confirm('Xóa slider #${s.id}?');">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="id" value="${s.id}">
                                        <button class="btn-Xoa" type="submit">
                                            <i class="fa-solid fa-trash"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>

                        <c:if test="${empty sliders}">
                            <tr><td colspan="7">Không có dữ liệu</td></tr>
                        </c:if>
                        </tbody>
                    </table>

                    <!-- PAGINATION -->
                    <div class="pagination">
                        <c:if test="${page > 1}">
                            <a class="page-link"
                               href="${pageContext.request.contextPath}/admin/sliders?q=${q}&size=${size}&page=${page-1}">Trước</a>
                        </c:if>

                        <c:forEach var="p" begin="1" end="${totalPages}">
                            <a class="page-link ${p==page ? 'active' : ''}"
                               href="${pageContext.request.contextPath}/admin/sliders?q=${q}&size=${size}&page=${p}">${p}</a>
                        </c:forEach>

                        <c:if test="${page < totalPages}">
                            <a class="page-link"
                               href="${pageContext.request.contextPath}/admin/sliders?q=${q}&size=${size}&page=${page+1}">Sau</a>
                        </c:if>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <!-- =============== MODAL THÊM =============== -->
    <div id="customerModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Thêm banner</h2>
                <span class="close-modal">&times;</span>
            </div>

            <!-- FORM THÊM: action=create + enctype upload -->
            <form method="post" action="${pageContext.request.contextPath}/admin/sliders" enctype="multipart/form-data">
                <input type="hidden" name="action" value="create">


                <div class="modal-body">
                    <div class="form-group">
                        <label>Tiêu đề</label>
                        <input type="text" name="title" placeholder="Nhập tiêu đề" required>
                    </div>

                    <div class="form-group">
                        <label>Trạng thái</label>
                        <select name="status">
                            <option value="1">Hiển thị</option>
                            <option value="0">Ẩn</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Thứ tự hiển thị (indexOrder)</label>
                        <input type="number" name="indexOrder" min="1" placeholder="Nhập thứ tự" required>
                    </div>

<%--                    <div class="form-group">--%>
<%--                        <label>LinkTo</label>--%>
<%--                        <input type="text" name="linkTo" placeholder="VD: category?categoryId=2">--%>
<%--                    </div>--%>

                    <div class="form-group">
                        <label>Upload ảnh (ưu tiên)</label>
                        <input type="file" name="thumbnailFile" accept="image/*" required>
                    </div>

<%--                    <div class="form-group">--%>
<%--                        <label>Hoặc nhập URL ảnh</label>--%>
<%--                        <input type="text" name="thumbnailUrl" placeholder="https://...">--%>
<%--                    </div>--%>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn-cancel">Hủy</button>
                    <button type="submit" class="btn-save">Lưu</button>
                </div>
            </form>
        </div>
    </div>

    <!-- =============== MODAL SỬA =============== -->
    <div id="editCustomerModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Chỉnh sửa banner</h2>
                <span class="close-edit-modal">&times;</span>
            </div>

            <!-- FORM SỬA: action=update -->
            <form method="post" action="${pageContext.request.contextPath}/admin/sliders" enctype="multipart/form-data">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" id="editId">

                <div class="modal-body">
                    <div class="form-group">
                        <label>Tiêu đề</label>
                        <input type="text" name="title" id="editTitle" required>
                    </div>

                    <div class="form-group">
                        <label>Thứ tự hiển thị (indexOrder)</label>
                        <input type="number" name="indexOrder" id="editOrder" min="1" required>
                    </div>

                    <div class="form-group">
                        <label>Trạng thái</label>
                        <select name="status" id="editStatus">
                            <option value="1">Hiển thị</option>
                            <option value="0">Ẩn</option>
                        </select>
                    </div>

<%--                    <div class="form-group">--%>
<%--                        <label>LinkTo</label>--%>
<%--                        <input type="text" name="linkTo" id="editLink">--%>
<%--                    </div>--%>

                    <div class="form-group">
                        <label>Ảnh hiện tại</label>
                        <img id="editPreview" src="" style="width:100px;border-radius:6px;border:1px solid #eee;">
                    </div>

                    <div class="form-group">
                        <label>Upload ảnh mới (nếu muốn đổi)</label>
                        <input type="file" name="thumbnailFile" accept="image/*">
                    </div>

<%--                    <div class="form-group">--%>
<%--                        <label>Hoặc nhập URL ảnh mới</label>--%>
<%--                        <input type="text" name="thumbnailUrl" placeholder="https://...">--%>
<%--                    </div>--%>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn-edit-cancel">Hủy</button>
                    <button type="submit" class="btn-edit-save">Lưu thay đổi</button>
                </div>
            </form>
        </div>
    </div>

    <!-- JS mở / đóng + đổ dữ liệu edit -->
    <script>
        // ===== MODAL THÊM =====
        const btnThem = document.querySelector('.btn-them-banner');
        const modalAdd = document.getElementById('customerModal');
        const btnCloseAdd = document.querySelector('.close-modal');
        const btnCancelAdd = document.querySelector('.btn-cancel');

        btnThem.addEventListener('click', () => modalAdd.style.display = 'flex');
        btnCloseAdd.addEventListener('click', () => modalAdd.style.display = 'none');
        btnCancelAdd.addEventListener('click', () => modalAdd.style.display = 'none');

        window.addEventListener('click', (e) => {
            if (e.target === modalAdd) modalAdd.style.display = 'none';
        });

        // ===== MODAL SỬA =====
        const modalEdit = document.getElementById("editCustomerModal");
        const btnCloseEdit = document.querySelector(".close-edit-modal");
        const btnEditCancel = document.querySelector(".btn-edit-cancel");

        const editId = document.getElementById("editId");
        const editTitle = document.getElementById("editTitle");
        const editOrder = document.getElementById("editOrder");
        const editStatus = document.getElementById("editStatus");
        const editLink = document.getElementById("editLink");
        const editPreview = document.getElementById("editPreview");

        document.querySelectorAll(".btn-open-edit").forEach(btn => {
            btn.addEventListener("click", () => {
                modalEdit.style.display = "flex";

                editId.value = btn.dataset.id;
                editTitle.value = btn.dataset.title || "";
                editOrder.value = btn.dataset.order || "1";
                editStatus.value = btn.dataset.status || "1";
                editLink.value = btn.dataset.link || "";
                editPreview.src = btn.dataset.thumb || "";
            });
        });

        btnCloseEdit.addEventListener("click", () => modalEdit.style.display = "none");
        btnEditCancel.addEventListener("click", () => modalEdit.style.display = "none");

        window.addEventListener("click", (e) => {
            if (e.target === modalEdit) modalEdit.style.display = "none";
        });
    </script>

    </body>

</html>