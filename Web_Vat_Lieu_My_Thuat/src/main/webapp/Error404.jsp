<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>404 - Không tìm thấy trang</title>
    <style>
        :root{
            --bg1:#0b1220;
            --bg2:#111b31;
            --card:rgba(255,255,255,.08);
            --border:rgba(255,255,255,.12);
            --text:rgba(255,255,255,.92);
            --muted:rgba(255,255,255,.65);
            --brand:#17479D; /* màu chủ đề của bạn */
            --brand2:#2659F5;
        }
        *{box-sizing:border-box}
        body{
            margin:0; min-height:100vh;
            font-family: system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif;
            color:var(--text);
            background: radial-gradient(1200px 600px at 20% 10%, rgba(38,89,245,.28), transparent 55%),
            radial-gradient(900px 500px at 80% 20%, rgba(23,71,157,.35), transparent 55%),
            linear-gradient(180deg, var(--bg1), var(--bg2));
            display:grid; place-items:center;
            padding:24px;
        }
        .wrap{
            width:min(920px, 100%);
            display:grid;
            grid-template-columns: 1.2fr .8fr;
            gap:18px;
            align-items:stretch;
        }
        .card{
            background:var(--card);
            border:1px solid var(--border);
            border-radius:18px;
            padding:28px;
            box-shadow: 0 18px 60px rgba(0,0,0,.35);
            backdrop-filter: blur(10px);
        }
        .badge{
            display:inline-flex; align-items:center; gap:10px;
            padding:8px 12px;
            border-radius:999px;
            border:1px solid var(--border);
            color:var(--muted);
            font-size:13px;
            letter-spacing:.3px;
        }
        .dot{
            width:10px; height:10px; border-radius:50%;
            background:linear-gradient(135deg, var(--brand2), var(--brand));
            box-shadow: 0 0 0 4px rgba(38,89,245,.18);
        }
        h1{
            margin:14px 0 6px;
            font-size:44px;
            line-height:1.05;
            letter-spacing:-.5px;
        }
        p{
            margin:0;
            color:var(--muted);
            font-size:16px;
            line-height:1.6;
        }
        .big404{
            font-size:120px;
            font-weight:900;
            letter-spacing:-6px;
            margin:0;
            background: linear-gradient(135deg, #ffffff, rgba(255,255,255,.2));
            -webkit-background-clip:text;
            background-clip:text;
            color:transparent;
            text-align:center;
        }
        .hint{
            margin-top:14px;
            font-size:14px;
            color:rgba(255,255,255,.55);
        }
        .actions{
            margin-top:18px;
            display:flex;
            flex-wrap:wrap;
            gap:12px;
        }
        .btn{
            appearance:none;
            border:0;
            cursor:pointer;
            border-radius:12px;
            padding:12px 16px;
            font-weight:600;
            font-size:14px;
            display:inline-flex;
            align-items:center;
            gap:10px;
            text-decoration:none;
            transition: transform .06s ease, opacity .2s ease, box-shadow .2s ease;
            user-select:none;
        }
        .btn:active{ transform: translateY(1px); }
        .btn-primary{
            color:#fff;
            background:linear-gradient(135deg, var(--brand2), var(--brand));
            box-shadow: 0 10px 28px rgba(38,89,245,.25);
        }
        .btn-ghost{
            color:rgba(255,255,255,.9);
            background:rgba(255,255,255,.06);
            border:1px solid var(--border);
        }
        .btn:hover{ opacity:.95; }
        .side{
            display:flex;
            flex-direction:column;
            justify-content:center;
            align-items:center;
            gap:10px;
            text-align:center;
        }
        .chip{
            width:100%;
            padding:12px 14px;
            border-radius:14px;
            border:1px solid var(--border);
            background:rgba(255,255,255,.05);
            color:rgba(255,255,255,.75);
            font-size:13px;
            text-align:left;
            overflow:hidden;
            text-overflow:ellipsis;
            white-space:nowrap;
        }
        @media (max-width: 820px){
            .wrap{ grid-template-columns: 1fr; }
            .big404{ font-size:96px; }
            h1{ font-size:38px; }
        }
    </style>
</head>
<body>
<div class="wrap">
    <div class="card">
        <div class="badge"><span class="dot"></span> Mythuat Shop Admin</div>

        <h1>Không tìm thấy trang</h1>
        <p>
            Trang bạn truy cập không tồn tại, đã bị đổi đường dẫn, hoặc bạn không có quyền truy cập.
        </p>

        <div class="actions">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/home">
                🏠 Về trang chủ
            </a>

            <button class="btn btn-ghost" type="button" onclick="history.back()">
                ↩️ Quay lại
            </button>

            <a class="btn btn-ghost" href="${pageContext.request.contextPath}/logout">
                🔐 Đăng nhập
            </a>
        </div>

        <div class="hint">
            Nếu bạn nghĩ đây là lỗi hệ thống, hãy liên hệ quản trị viên.
        </div>
    </div>

    <div class="card side">
        <p class="big404">404</p>
        <p>Oops! Không có gì ở đây cả.</p>
    </div>
</div>
</body>
</html>
