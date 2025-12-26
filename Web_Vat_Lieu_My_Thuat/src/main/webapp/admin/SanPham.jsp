<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
      integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
      crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.8/css/jquery.dataTables.min.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.8/js/jquery.dataTables.min.js"></script>

    <title>Quản lý sản phẩm</title>
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
      border-left: 2px solid #3B7DDD;
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

    .list-sanpham-container {
      width: 95%;
      margin: 30px auto;
      background: white;
      padding: 25px;
      border-radius: 10px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    .sub-title {
      color: #555;
      font-size: 16px;
      margin-bottom: 20px;
    }

    .sanpham-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 10px;
    }

    .sanpham-table th {
      background: #2659F5;
      color: white;
      padding: 12px;
      font-size: 14px;

    }

    .sanpham-table td {
      padding: 12px;
      background: #fafafa;
    }

    .sanpham-table tr:nth-child(even) td {
      background: #f0f0f0;
    }

    .sanpham-table td,
    .sanpham-table th {
      border-bottom: 1px solid #ddd;
      text-align: left;
      border-left: 1px solid #ddd;
      border-right: 1px solid #ddd;
    }

    .sanpham-table button {
      color: white;
      padding: 8px 12px;
      border-radius: 5px;
      cursor: pointer;
      margin-right: 5px;
      border: none;
    }

    .sanpham-table button:hover {
      opacity: 0.8;

    }

    .sanpham-table .chinhsua-sanpham {
      background-color: #FFC107;
      color: black;

    }
    /* nút khóa/mở khóa */
    .sanpham-table .btn-lock {
      background-color: #DC3545; /* đỏ */
      color: white;
    }
    .sanpham-table .btn-unlock {
      background-color: #28a745; /* xanh */
      color: white;
    }

    /* trạng thái chữ */
    .status-selling {
      color: #28a745;
      font-weight: 600;
    }
    .status-stopped {
      color: #DC3545;
      font-weight: 600;
    }

    .sanpham-table .xoa-sanpham {
      background-color: #DC3545;
    }

    .sanpham-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 20px;
    }

    .sanpham-header .sanpham-header-timkiem {
      position: relative;
    }

    .sanpham-header .sanpham-header-timkiem input {
      padding: 8px;
      width: 200px;
      border: 1px solid #ccc;
      border-radius: 5px;
      margin-right: 10px;
    }

    .sanpham-header .sanpham-header-timkiem .icon-timkiem {
      position: absolute;
      border-radius: 5px;
      left: 184px;
      top: 1px;
      border: none;
      padding: 8px;
    }

    .sanpham-header .sanpham-header-timkiem .them-sanpham {
      background-color: #2659F5;
      color: white;
      border: none;
      padding: 8px 12px;
      border-radius: 5px;
      cursor: pointer;
    }

    .sanpham-header .sanpham-header-timkiem .them-sanpham:hover {
      background-color: #17479D;
    }

    .sanpham-header .sanpham-header-timkiem .icon-timkiem:hover {
      cursor: pointer;
      background-color: #ddd;
    }

    .modal {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.5);
      justify-content: center;
      align-items: center;
      z-index: 999;

      padding: 20px;
      overflow-y: auto;
    }

    .modal-content {
      background: white;
      padding: 25px;
      width: 800px;
      border-radius: 10px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
      animation: fadeIn .2s ease;
      max-height: 90vh;
      overflow-y: auto;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: scale(0.9);
      }

      to {
        opacity: 1;
        transform: scale(1);
      }
    }

    .modal-content h2 {
      margin-bottom: 10px;
    }

    .modal-content label {
      display: block;
      margin-top: 10px;
      font-size: 14px;
      color: #444;
    }

    .modal-content input {
      width: 100%;
      padding: 8px;
      margin-top: 4px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .modal-buttons {
      display: flex;
      justify-content: flex-end;
      margin-top: 20px;
      gap: 10px;
    }

    #btn-save {
      background-color: #2659F5;
      color: white;
      padding: 8px 14px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    #btn-close {
      background-color: #ccc;
      padding: 8px 14px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .sub-img-box {
      position: relative;
      display: inline-block;
    }

    .sub-img-box img {
      width: 100px;
      height: 100px;
      object-fit: cover;
      border-radius: 6px;
      border: 1px solid #ddd;
    }

    .sub-img-box button {
      position: absolute;
      top: -5px;
      right: -5px;
      background: #DC3545;
      color: white;
      border: none;
      border-radius: 50%;
      width: 22px;
      height: 22px;
      cursor: pointer;
      font-size: 12px;
    }

    .form-row {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      gap: 40px;
    }

    .form-left,
    .form-right {
      width: 50%;
    }

    .form-left label,
    .form-right label {
      font-weight: 500;
      margin-top: 5px;
    }

    .form-left input,
    .form-right input {
      margin-bottom: 10px;
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
    .dataTables_wrapper {
      width: 100%;
      margin-top: 10px;
    }
    .thumb{
      width: 60px;
      height: 60px;
      object-fit: cover;
      border-radius: 8px;
      border: 1px solid #ddd;
    }
    .col-thumb{
      text-align: center;
      width: 90px;
    }

    .dataTables_filter input,
    .dataTables_length select {
      padding: 6px 10px;
      border-radius: 6px;
      border: 1px solid #ddd;
      outline: none;
    }

    .dataTables_filter {
      margin-bottom: 10px;
    }

    .dataTables_paginate .paginate_button {
      padding: 6px 10px !important;
      border-radius: 6px !important;
    }

    .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
      background: #17479D !important;
      color: #fff !important;
      border: 1px solid #17479D !important;
    }

    .dataTables_wrapper .dataTables_paginate .paginate_button.current {
      background: #17479D !important;
      color: #fff !important;
      border: 1px solid #17479D !important;
    }

  </style>

  <body>
    <div id="main">
      <div class="left">
        <div class="list-admin">
          <a href="Admin.jsp" class="logo"><img src="../assets/images/logo/logo.png" alt></a>
          <a href="${pageContext.request.contextPath}/admin/overview"><i class="fa-solid fa-house"></i> Tổng quan</a>
          <a href="${pageContext.request.contextPath}/admin/statistics"><i class="fa-solid fa-chart-line"></i>Thống
            kê</a>
          <a href="${pageContext.request.contextPath}/admin/categories"><i class="fa-solid fa-list"></i>Quản lý danh
            mục</a>
          <a href="${pageContext.request.contextPath}/admin/products" class="active"><i class="fa-solid fa-palette"></i>Quản
            lý sản phẩm</a>
          <a href="Nguoidung.jsp"><i class="fa-solid fa-person"></i>Quản
            lý người dùng</a>
          <a href="DonHang.jsp"><i class="fa-solid fa-box-open"></i>Quản
            lý đơn hàng</a>
          <a href="Khuyenmai.jsp"><i class="fa-solid fa-gift"></i>Quản lý
            khuyến mãi</a>
          <a href="SliderShow.jsp"><i class="fa-solid fa-sliders"></i>Quản lý
            Slider Show</a>
          <a href="Contact.jsp"><i class="fa-solid fa-address-book"></i>Quản lý
            liên hệ</a>
          <a href="${pageContext.request.contextPath}/logout"><i class="fa-solid fa-right-from-bracket"></i>
            Đăng xuất</a>
        </div>
      </div>
      <div class="right">
        <div class="container">
          <div class="list-sanpham-container">
            <div class="sanpham-header">
              <h1>Danh sách sản phẩm</h1>
              <div class="sanpham-header-timkiem">
                <button class="them-sanpham">Thêm sản phẩm</button>
              </div>
            </div>
            <table id="productTable" class="sanpham-table display">
            <thead>
                <tr>
                  <th>STT</th>
                  <th>ID</th>
                  <th>Tên sản phẩm</th>
                  <th>Hình ảnh</th>
                  <th>Danh mục</th>
                  <th>Giá</th>
                  <th>Ngày tạo</th>
                  <th>Số lượng tồn</th>
                  <th>Trạng thái</th>
                  <th>Tùy chọn</th>
                </tr>
              </thead>

              <tbody>
              <c:forEach var="p" items="${products}" varStatus="st">
                <tr>
                  <td>${st.index + 1}</td>
                  <td>${p.id}</td>
                  <td>${p.name}</td>


                  <c:set var="thumbUrl" value="${p.thumbnail}" />
                  <c:if test="${not empty p.thumbnail and not fn:startsWith(p.thumbnail,'http')}">
                    <c:set var="thumbUrl" value="${pageContext.request.contextPath}${p.thumbnail}" />
                  </c:if>

                  <td class="col-thumb">
                    <c:choose>
                      <c:when test="${not empty p.thumbnail}">
                        <img class="thumb" src="${thumbUrl}" alt="thumbnail">
                      </c:when>
                      <c:otherwise>-</c:otherwise>
                    </c:choose>
                  </td>


                  <td>
                    <c:forEach var="c" items="${categories}">
                      <c:if test="${c.id == p.categoryId}">${c.categoryName}</c:if>
                    </c:forEach>
                  </td>

                  <td>${p.price}</td>
                  <td>${p.createAt}</td>
                  <td>${p.quantityStock}</td>
                  <td>
                    <c:choose>
                      <c:when test="${p.isActive == 1}">
                        <span class="status-selling">Đang bán</span>
                      </c:when>
                      <c:otherwise>
                        <span class="status-stopped">Ngừng bán</span>
                      </c:otherwise>
                    </c:choose>
                  </td>


                  <!-- Tùy chọn -->
                  <td>
                    <button class="chinhsua-sanpham"
                            data-id="${p.id}"
                            data-name="${p.name}"
                            data-categoryid="${p.categoryId}"
                            data-price="${p.price}"
                            data-discount="${p.discountDefault}"
                            data-quantity="${p.quantityStock}"
                            data-brand="${p.brand}"
                            data-thumbnail="${thumbUrl}">
                      <i class="fa-solid fa-pen-to-square"></i>
                    </button>

                    <form action="${pageContext.request.contextPath}/admin/products"
                          method="post" style="display:inline">
                      <input type="hidden" name="action" value="toggleActive">
                      <input type="hidden" name="id" value="${p.id}">

                      <c:choose>
                        <c:when test="${p.isActive == 1}">
                          <input type="hidden" name="isActive" value="0">
                          <button class="xoa-sanpham" type="submit"
                                  onclick="return confirm('Khóa (ngừng bán) sản phẩm này?')"
                                  title="Khóa sản phẩm">
                            <i class="fa-solid fa-lock"></i>
                          </button>
                        </c:when>
                        <c:otherwise>
                          <input type="hidden" name="isActive" value="1">
                          <button class="chinhsua-sanpham" type="submit"
                                  onclick="return confirm('Mở khóa (bán lại) sản phẩm này?')"
                                  title="Mở khóa sản phẩm">
                            <i class="fa-solid fa-lock-open"></i>
                          </button>
                        </c:otherwise>
                      </c:choose>
                    </form>

                  </td>
                </tr>
              </c:forEach>
              </tbody>

            </table>

          </div>
        </div>
      </div>
      <!-- FORM THÊM SẢN PHẨM -->
      <div id="modal-add" class="modal">
        <div class="modal-content">
          <h2 id="modalTitle">Thêm sản phẩm</h2>

          <form id="productForm"
                action="${pageContext.request.contextPath}/admin/products"
                method="post"
                enctype="multipart/form-data">

            <input type="hidden" name="action" id="action" value="create">
            <input type="hidden" name="id" id="dbId" value="">
<%--            value được lấy từ dbId.value ở js--%>

            <div class="form-row">
              <div class="form-left">

                <label>Danh mục</label>
                <select id="categoryID" name="categoryId" style="width:100%; padding:8px; margin-top:4px;">
                  <c:forEach var="c" items="${categories}">
                    <option value="${c.id}">${c.categoryName}</option>
                  </c:forEach>
                </select>

                <label>Tên sản phẩm</label>
                <input type="text" id="name" name="name" required>

                <label>Ảnh chính</label>
                <input type="file" id="thumbnail-main" name="thumbnailMain" accept="image/*">
                <img id="previewImg-main" style="width:120px; display:none; margin-top: 10px;">
                <button type="button" id="removeImgBtn-main" style="display:none;">Xóa ảnh</button>

                <label>Ảnh phụ</label>
                <input type="file" id="thumbnail-sub" name="thumbnailSubs" multiple accept="image/*">

                <div id="sub-image-preview" style="display:flex; flex-wrap:wrap; gap:10px; margin-top:10px;"></div>

                <label>Giảm giá(%)</label>
                <input type="number" id="discountDefault" name="discountDefault" value="0" min="0" max="100">

                <label>Giá bán</label>
                <input type="number" id="price" name="price" required min="0">

                <label>Số lượng sản phẩm</label>
                <input type="number" id="quantity" name="quantityStock" required min="0">
              </div>

              <div class="form-right">
                <label>Thương hiệu</label>
                <input type="text" id="brand" name="brand">

                <label>Kích thước</label>
                <input type="text" id="size" name="size">

                <label>Xuất xứ</label>
                <input type="text" id="madeIn" name="madeIn">

                <label>Cảnh báo an toàn</label>
                <input type="text" id="warning" name="warning">
              </div>
            </div>

            <div class="modal-buttons">
              <button id="btn-save" type="submit">Lưu</button>
              <button id="btn-close" type="button">Hủy</button>
            </div>
          </form>
        </div>
      </div>


    </div>
    <script>
      const modal = document.getElementById("modal-add");
      const form = document.getElementById("productForm");
      const btnAdd = document.querySelector(".them-sanpham");
      const btnClose = document.getElementById("btn-close");
      const modalTitle = document.getElementById("modalTitle");

      const actionInput = document.getElementById("action");
      const dbId = document.getElementById("dbId");

      const categoryID = document.getElementById("categoryID");
      const nameInput = document.getElementById("name");
      const discountInput = document.getElementById("discountDefault");
      const priceInput = document.getElementById("price");
      const qtyInput = document.getElementById("quantity");
      const brandInput = document.getElementById("brand");
      const sizeInput = document.getElementById("size");
      const madeInInput = document.getElementById("madeIn");
      const warningInput = document.getElementById("warning");

      // main preview
      const thumbnailInput = document.getElementById("thumbnail-main");
      const previewImg = document.getElementById("previewImg-main");
      const removeImgBtn = document.getElementById("removeImgBtn-main");

      // sub preview (UI only)
      const thumbnailSub = document.getElementById("thumbnail-sub");
      const subPreviewContainer = document.getElementById("sub-image-preview");
      let subImages = [];

      function openModal() {
        modal.style.display = "flex";
        modal.style.gap = "20px";
      }
      function closeModal() {
        modal.style.display = "none";
      }

      // CREATE
      btnAdd.addEventListener("click", () => {
        modalTitle.innerText = "Thêm sản phẩm";
        actionInput.value = "create";
        dbId.value = "";

        form.reset();
        previewImg.style.display = "none";
        removeImgBtn.style.display = "none";

        subImages = [];
        subPreviewContainer.innerHTML = "";

        thumbnailSub.style.display = "block";
        subPreviewContainer.style.display = "flex";

        openModal();
      });

      btnClose.addEventListener("click", closeModal);
      window.addEventListener("click", (e) => { if (e.target === modal) closeModal(); });

      // MAIN PREVIEW
      thumbnailInput.addEventListener("change", function () {
        const file = this.files[0];
        if (file) {
          previewImg.src = URL.createObjectURL(file);
          previewImg.style.display = "block";
          removeImgBtn.style.display = "inline-block";
        }
      });

      removeImgBtn.addEventListener("click", function () {
        thumbnailInput.value = "";
        previewImg.src = "";
        previewImg.style.display = "none";
        removeImgBtn.style.display = "none";
      });

      // SUB PREVIEW (optional)
      thumbnailSub.addEventListener("change", function () {
        const files = Array.from(this.files);
        files.forEach(file => subImages.push({ file, url: URL.createObjectURL(file) }));
        renderSubImages();
      });

      function renderSubImages() {
        subPreviewContainer.innerHTML = "";
        subImages.forEach((imgObj, index) => {
          const box = document.createElement("div");
          box.className = "sub-img-box";
          const img = document.createElement("img");
          img.src = imgObj.url;

          const btn = document.createElement("button");
          btn.type = "button";
          btn.innerHTML = "×";
          btn.onclick = () => { subImages.splice(index, 1); renderSubImages(); };

          box.appendChild(img);
          box.appendChild(btn);
          subPreviewContainer.appendChild(box);
        });
      }

      // EDIT
      document.querySelectorAll(".chinhsua-sanpham").forEach(btn => {
        btn.addEventListener("click", () => {
          modalTitle.innerText = "Cập nhật sản phẩm";
          actionInput.value = "update";

          dbId.value = btn.dataset.id;
          nameInput.value = btn.dataset.name || "";
          categoryID.value = btn.dataset.categoryid || "";
          priceInput.value = btn.dataset.price || 0;
          discountInput.value = btn.dataset.discount || 0;
          qtyInput.value = btn.dataset.quantity || 0;
          brandInput.value = btn.dataset.brand || "";

          // nếu bạn có data-size/madein/warning thì set tiếp
          sizeInput.value = btn.dataset.size || "";
          madeInInput.value = btn.dataset.madein || "";
          warningInput.value = btn.dataset.warning || "";

          // ảnh chính (chỉ preview URL cũ)
          const thumb = btn.dataset.thumbnail;
          if (thumb) {
            previewImg.src = thumb;
            previewImg.style.display = "block";
            removeImgBtn.style.display = "inline-block";
          } else {
            previewImg.style.display = "none";
            removeImgBtn.style.display = "none";
          }

          // update: thường ẩn ảnh phụ (đỡ phức tạp)
          thumbnailSub.style.display = "none";
          subPreviewContainer.style.display = "none";

          openModal();
        });
      });
    </script>
    <script>
      $(function () {
        const viUrl = "https://cdn.datatables.net/plug-ins/1.13.8/i18n/vi.json";

        $("#productTable").DataTable({
          pageLength: 5,
          lengthChange: false,
          ordering: true,
          searching: true,
          info: false,
          language: {url: viUrl},
          columnDefs: [
            {orderable: false, targets: [3, 9]} // 3 = Hình ảnh, 9 = Tùy chọn
          ]
        })
      });

    </script>

  </body>

  </html>