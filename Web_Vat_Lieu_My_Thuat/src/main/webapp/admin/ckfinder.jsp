<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CKEditor4 + CKFinder</title>

    <!-- CKEditor 4 -->
    <script src="https://cdn.ckeditor.com/4.22.1/full/ckeditor.js"></script>

    <!-- CKFinder (bắt buộc để setup đúng URLs) -->
    <script src="<%=request.getContextPath()%>/ckfinder/ckfinder.js"></script>

    <style>
        body { padding: 16px; font-family: Arial; }
        .cke { width: 95vw !important; }
        .cke_contents { height: 450px !important; }
    </style>
</head>

<body>
<h3>Demo CKEditor4 + CKFinder</h3>

<textarea id="cktext" name="chitiet"></textarea>

<script>
    const ctx = '<%=request.getContextPath()%>';

    // 1) Init editor trước
    const editor = CKEDITOR.replace('cktext', {
        height: 500
    });

    // 2) CKFinder tự cấu hình browse/upload đúng theo servlet mapping /ckfinder/*
    CKFinder.setupCKEditor(editor, ctx + '/ckfinder/');
</script>
</body>
</html>
