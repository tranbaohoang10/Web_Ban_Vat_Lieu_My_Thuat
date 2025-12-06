
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
    #section-main .section-main-filter {
        display: flex;
        flex-direction: column;
        flex-wrap: wrap;
        width: 15%;
        padding-left: 15px;
        padding-top: 30px;
        padding-bottom: 30px;
        position: sticky;
        top: 20px;
        height: fit-content;
    }

    #section-main .section-main-filter .header {
        color: #5980f6;
        margin-top: 0;
    }

    #section-main .section-main-filter input {
        display: inline-block;
        margin-right: 10px;
    }

    #section-main .section-main-filter-loaisanpham {
        border-bottom: 1px solid #ddd;
    }

    #section-main .section-main-filter-loaisanpham .list label {
        display: inline-block;
        cursor: pointer;
        margin-bottom: 10px;
    }

    #section-main .section-main-filter-loaisanpham .list input {
        display: inline-block;
        cursor: pointer;
    }

    #section-main .section-main-filter-loaisanpham .xemthem {
        margin-left: 30px;
        cursor: pointer;
        margin-bottom: 15px;
    }

    #section-main .section-main-filter-mucgia {
        border-bottom: 1px solid #ddd;
    }

    #section-main .section-main-filter-mucgia .list label {
        display: inline-block;
        margin-bottom: 10px;
        cursor: pointer;
        font-size: 14px;
    }

    #section-main .section-main-filter-mucgia .list input {
        display: inline-block;
        cursor: pointer;
    }

    #section-main .section-main-filter-mucgia .list label:nth-child(1) {
        margin-left: 32px;
    }

    #section-main .section-main-filter-tieuchi {
        border-bottom: 1px solid #ddd;
    }

    #section-main .section-main-filter-tieuchi .list label {
        display: inline-block;
        margin-bottom: 10px;
        cursor: pointer;
        font-size: 14px;
    }

    #section-main .section-main-filter-tieuchi .list input {
        display: inline-block;
        cursor: pointer;
    }


</style>
<div class="section-main-filter">
    <div class="section-main-filter-mucgia">
        <h3 class="header">
            Mức giá
        </h3>
        <form action class="list">
            <label for="sanpham1">Giá dưới 100.000đ</label>
            <br>
            <input type="checkbox" name="sanpham2"
                   id="sanpham-mucgia-2">
            <label for="sanpham-mucgia-2">100.000đ -
                300.000đ</label>
            <br>
            <input type="checkbox" name="sanpham3"
                   id="sanpham-mucgia-3">
            <label for="sanpham-mucgia-3">300.000đ -
                500.000đ</label>
            <br>
            <input type="checkbox" name="sanpham4"
                   id="sanpham-mucgia-4">
            <label for="sanpham-mucgia-4">500.000đ -
                700.000đ</label>
            <br>
            <input type="checkbox" name="sanpham5"
                   id="sanpham-mucgia-5">
            <label for="sanpham-mucgia-5">700.000đ -
                1.000.000đ</label>
            <br>
            <input type="checkbox" name="sanpham1"
                   id="sanpham-mucgia-6">
            <label for="sanpham-mucgia-6">Giá trên
                1.000.000đ</label>
            <br>
        </form>

    </div>
    <div class="section-main-filter-tieuchi">
        <h3 class="header">
            Tiêu chí
        </h3>
        <form action class="list">
            <input type="checkbox" name="sanpham2"
                   id="sanphamcaonhat">
            <label for="sanphamcaonhat">Giá cao nhất</label>
            <br>
            <input type="checkbox" name="sanpham2"
                   id="sanphamthapnhat">
            <label for="sanphamthapnhat">Giá thấp nhất</label>
            <br>
            <input type="checkbox" name="sanpham3"
                   id="sanphamdanhgiacaonhat">
            <label for="sanphamdanhgiacaonhat">Đánh giá cao
                nhất</label>
            <br>
            <input type="checkbox" name="sanpham4"
                   id="sanphammoi">
            <label for="sanphammoi">Sản phẩm mới</label>
            <br>

        </form>

    </div>

</div>