<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý danh mục</title>
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
</head>

<body>
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
            width: 100%;
            margin-top: 20px;
            margin-left: auto;
            margin-right: auto;
        }

        #main .right {
            flex: 1;
            background-color: #F9F9F9;
        }


        .order-container {
            width: 95%;
            margin: 30px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

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

        .order-table td:nth-child(6) {
            max-width: 220px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }


        .order-table td,
        .order-table th {
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        .btn-sm {
            background-color: #FFC107;
            color: black;
            border: none;
            padding: 6px 10px;
            cursor: pointer;
            font-size: 14px;
            border-radius: 4px;
            transition: 0.2s;
        }

        .btn-success {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 6px 10px;
            cursor: pointer;
            font-size: 14px;
            border-radius: 4px;
            transition: 0.2s;
        }

        .btn-sm:hover {
            background-color: #e0a800;
        }




        .btn-sm i {
            font-size: 14px;
        }

        .search-box {
            margin-left: auto;
            margin-right: 15px;
        }

        .search-box {
            display: flex;
            align-items: center;
            width: 400px;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 6px;
            padding-left: 10px;
            overflow: hidden;
        }

        .search-box input {
            border: none;
            outline: none;
            padding: 8px 10px;
            width: 100%;
            font-size: 14px;
        }

        .search-btn {
            background: #ddd;
            border: none;
            color: black;
            padding: 8px 12px;
            cursor: pointer;
            font-size: 14px;
            border-left: 1px solid #ddd;
        }

        .search-btn:hover {
            background: #ccc;
        }

        .search-btn i {
            font-size: 14px;
        }

        .search-box {
            height: 40px;
            display: flex;
            align-items: center;
        }

        .search-box input {
            height: 100%;
        }

        .search-btn {
            height: 100%;
        }

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

        .top-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .btn-add-category {
            background-color: #2659F5;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
            white-space: nowrap;
            height: 40px;
        }

        .btn-add-category:hover {
            background-color: #1e48c0;
        }

        .modal {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(0, 0, 0, 0.4);
            justify-content: center;
            align-items: center;
            z-index: 9999;
        }

        /* Khung modal */
        .category-box {
            width: 450px;
            background: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        /* Header */
        .modal-header {
            padding: 14px 20px;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-header h3 {
            margin: 0;
            font-size: 18px;
        }

        .close-add {
            font-size: 22px;
            cursor: pointer;
        }

        /* Body */
        .modal-body {
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .modal-body input[type="text"],
        .modal-body input[type="file"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            outline: none;
        }

        .modal-body input:focus {
            border-color: #2659F5;
        }

        /* Footer */
        .modal-footer {
            padding: 12px 20px;
            border-top: 1px solid #eee;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .btn-cancel,
        .btn-cancel-edit {
            background: #6c757d;
            color: white;
            padding: 8px 14px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .btn-save,
        .btn-save-edit {
            background: #2659F5;
            color: white;
            padding: 8px 14px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .order-table img {
            width: 100px;
            height: auto;
            border-radius: 5px;
        }

        img {
            overflow-clip-margin: content-box;
            overflow: clip;
        }
    </style>
    <div id="main">

        <!-- SIDEBAR -->
        <div class="left">
            <div class="list-admin">
                <a href="Admin.jsp" class="logo"><img src="../assets/images/logo/logo.png" alt></a>
                <a href="Admin.jsp"><i class="fa-solid fa-house"></i> Tổng
                    quan</a>
                <a href="ThongKe.jsp"><i class="fa-solid fa-chart-line"></i>Thống
                    kê</a>
                <a href="DanhMuc.html" class="active"><i class="fa-solid fa-list"></i>Quản
                    lý danh
                    mục</a>
                <a href="SanPham.jsp"><i class="fa-solid fa-palette"></i>Quản
                    lý sản phẩm</a>
                <a href="Nguoidung.jsp"><i class="fa-solid fa-person"></i>Quản
                    lý người dùng</a>
                <a href="DonHang.jsp"><i class="fa-solid fa-box-open"></i>Quản
                    lý đơn hàng</a>
                <a href="Khuyenmai.jsp"><i class="fa-solid fa-gift"></i>Quản lý
                    khuyến mãi</a>
                <a href="SliderShow.jsp"><i class="fa-solid fa-sliders"></i>Quản lý Slider
                    Show</a>
                <a href="LienHe.jsp"><i class="fa-solid fa-address-book"></i>Quản lý liên
                    hệ</a>
                <a href="${pageContext.request.contextPath}/logout"><i class="fa-solid fa-right-from-bracket"></i>
                    Đăng xuất</a>
            </div>
        </div>

        <!-- RIGHT -->
        <div class="right">
            <div class="container">

                <div class="order-container">
                    <h1>Quản lý danh mục</h1>
                    <div class="top-bar">
                        <div class="search-box">
                            <input type="text" placeholder="Tìm kiếm đơn hàng...">
                            <button class="search-btn">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                        </div>

                        <button class="btn-add-category">
                            Thêm danh mục
                        </button>

                    </div>
                    <table class="order-table">
                        <thead>
                            <tr>
                                <th>Mã Danh Mục</th>
                                <th>Tên Danh Mục</th>
                                <th>Hình Ảnh</th>
                                <th>Tùy Chọn</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>CT01</td>
                                <td>Bút lông màu</td>
                                <td><img src="..\assets\images\logo\banner-3.webp" alt="Danh mục 1"></td>
                                <td>
                                    <button class="btn btn-warning btn-sm btn-edit-category">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </button>

                                </td>
                            </tr>

                            <tr>
                                <td>CT02</td>
                                <td>Màu nước</td>
                                <td><img src="..\assets\images\logo\ct-maunuoc.jpg" alt="Danh mục 2"></td>
                                <td>
                                    <button class="btn btn-warning btn-sm btn-edit-category">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </button>

                                </td>
                            </tr>

                            <tr>
                                <td>CT03</td>
                                <td>Bút chì</td>
                                <td><img src="..\assets\images\logo\banner-2.webp" alt="Danh mục 3"></td>
                                <td>
                                    <button class="btn btn-warning btn-sm btn-edit-category">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </button>

                                </td>
                            </tr>

                        </tbody>
                    </table>

                    <div class="pagination">
                        <a href="#" class="page-link">Trước</a>
                        <a href="#" class="page-link active">1</a>
                        <a href="#" class="page-link">2</a>
                        <a href="#" class="page-link">3</a>
                        <a href="#" class="page-link">Sau</a>
                    </div>

                </div>

            </div>
        </div>

    </div>
    <!-- Modal Thêm Danh Mục -->
    <div id="addCategoryModal" class="modal">
        <div class="modal-content category-box">

            <div class="modal-header">
                <h3>Thêm Danh Mục</h3>
                <span class="close-add">&times;</span>
            </div>

            <div class="modal-body">
                <label>Mã danh mục:</label>
                <input type="text" id="catCode" placeholder="Nhập mã danh mục...">

                <label>Tên danh mục:</label>
                <input type="text" id="catName" placeholder="Nhập tên danh mục...">

                <label>Ảnh danh mục:</label>
                <input type="file" id="catImage">
            </div>

            <div class="modal-footer">
                <button class="btn-cancel">Hủy</button>
                <button class="btn-save">Thêm danh mục</button>
            </div>

        </div>
    </div>
    <div id="editCategoryModal" class="modal">
        <div class="modal-content category-box">

            <div class="modal-header">
                <h3>Sửa Danh Mục</h3>
                <span class="close-edit">&times;</span>
            </div>

            <div class="modal-body">
                <label>Mã danh mục:</label>
                <input type="text" id="editCatCode" value="CT01" disabled>
                <label>Tên danh mục:</label>
                <input type="text" id="editCatName" value="Bút lông màu">

                <label>Ảnh danh mục:</label>
                <input type="file" id="editCatImage">
            </div>

            <div class="modal-footer">
                <button class="btn-cancel-edit">Hủy</button>
                <button class="btn-save-edit">Cập nhật</button>
            </div>

        </div>
    </div>

</body>
<script>
    const addModal = document.getElementById("addCategoryModal");
    const btnAdd = document.querySelector(".btn-add-category");
    const closeAdd = document.querySelector(".close-add");
    const btnCancel = document.querySelector(".btn-cancel");
    const btnSave = document.querySelector(".btn-save");


    btnAdd.onclick = () => {
        addModal.style.display = "flex";
    };
    closeAdd.onclick = () => addModal.style.display = "none";
    btnCancel.onclick = () => addModal.style.display = "none";
    btnSave.onclick = () => {
        alert("Danh mục đã được thêm ");
        addModal.style.display = "none";
    };

    const editModal = document.getElementById("editCategoryModal");
    const closeEdit = document.querySelector(".close-edit");
    const btnCancelEdit = document.querySelector(".btn-cancel-edit");
    const btnSaveEdit = document.querySelector(".btn-save-edit");

    document.querySelectorAll(".btn-edit-category").forEach(btn => {
        btn.addEventListener("click", () => {
            editModal.style.display = "flex";

        });
    });


    closeEdit.onclick = () => editModal.style.display = "none";
    btnCancelEdit.onclick = () => editModal.style.display = "none";

    btnSaveEdit.onclick = () => {
        alert("Danh mục đã được cập nhật ");
        editModal.style.display = "none";
    };

</script>

</html>