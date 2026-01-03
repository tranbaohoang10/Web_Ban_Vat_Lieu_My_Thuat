<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>CKEditor4 + CKFinder</title>

    <script src="https://cdn.ckeditor.com/4.22.1/full/ckeditor.js"></script>
    <!-- ✅ CKFinder 4: js nằm ngay dưới /ckfinder/ -->
    <script src="<%=request.getContextPath()%>/ckfinder/ckfinder.js"></script>
</head>
<body>

<textarea id="cktext" name="chitiet"></textarea>

<script src="https://cdn.ckeditor.com/4.22.1/full/ckeditor.js"></script>

<!-- ✅ ĐÚNG theo cấu trúc thư mục bạn đang có -->
<script src="<%=request.getContextPath()%>/ckfinder/static/ckfinder/ckfinder.js"></script>

<script>
    const ctx = '<%=request.getContextPath()%>';

    const editor = CKEDITOR.replace('cktext', {
        height: 500,
        filebrowserBrowseUrl: ctx + '/ckfinder/static/ckfinder/ckfinder.html',
        filebrowserImageBrowseUrl: ctx + '/ckfinder/static/ckfinder/ckfinder.html?type=Images',
        filebrowserUploadUrl: ctx + '/ckfinder/connector?command=QuickUpload&type=Files',
        filebrowserImageUploadUrl: ctx + '/ckfinder/connector?command=QuickUpload&type=Images'
    });

    // 🔥 QUAN TRỌNG: basePath phải đúng thư mục chứa CKFinder frontend
    CKFinder.setupCKEditor(editor, ctx + '/ckfinder/static/ckfinder/');
</script>



</body>
</html>
