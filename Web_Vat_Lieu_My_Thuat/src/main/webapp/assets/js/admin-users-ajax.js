(() => {
    const ctx = window.__CTX || "";
    const searchForm = document.getElementById("userSearchForm");
    const searchInput = document.getElementById("userSearchInput");
    const tbody = document.getElementById("userTbody");
    const pagination = document.getElementById("pagination");
    const statusEl = document.getElementById("searchStatus");

    if (!searchInput || !tbody || !pagination) return;

    let debounceTimer = null;
    let abortCtrl = null;

    function escapeHtml(str) {
        return (str ?? "")
            .replaceAll("&", "&amp;")
            .replaceAll("<", "&lt;")
            .replaceAll(">", "&gt;")
            .replaceAll('"', "&quot;")
            .replaceAll("'", "&#039;");
    }

    function renderRows(users, q, page) {
        if (!users || users.length === 0) {
            tbody.innerHTML =
                '<tr><td colspan="8" style="text-align:center; padding:14px; color:#666;">Không tìm thấy người dùng</td></tr>';
            return;
        }

        tbody.innerHTML = users
            .map((u) => {
                const id = u.id;
                const fullName = escapeHtml(u.fullName);
                const phone = escapeHtml(u.phoneNumber);
                const address = escapeHtml(u.address);
                const createAt = escapeHtml(u.createAt);
                const dob = escapeHtml(u.dob);
                const role = escapeHtml(u.role);
                const isActive = u.isActive;

                let lockHtml = "";
                if (isActive === 1) {
                    lockHtml = `
            <form class="lockForm" method="post" action="${ctx}/admin/users" style="display:inline">
              <input type="hidden" name="action" value="lock"/>
              <input type="hidden" name="id" value="${id}"/>
              <input type="hidden" name="page" value="${page}"/>
              <input type="hidden" name="q" value="${escapeHtml(q)}"/>
              <button class="btn-Xoa btn-open-lock" type="button" title="Khóa">
                <i class="fa-solid fa-lock"></i>
              </button>
            </form>`;
                } else if (isActive === 3) {
                    lockHtml = `
            <form class="lockForm" method="post" action="${ctx}/admin/users" style="display:inline">
              <input type="hidden" name="action" value="unlock"/>
              <input type="hidden" name="id" value="${id}"/>
              <input type="hidden" name="page" value="${page}"/>
              <input type="hidden" name="q" value="${escapeHtml(q)}"/>
              <button class="btn-unlock btn-open-lock" type="button" title="Mở khóa">
                <i class="fa-solid fa-lock-open"></i>
              </button>
            </form>`;
                } else {
                    lockHtml = `<span style="font-size:12px; opacity:.7;">Chưa kích hoạt</span>`;
                }

                return `
          <tr>
            <td class="col-id">${id}</td>
            <td class="col-ten">${fullName}</td>
            <td class="col-sdt">${phone}</td>
            <td class="col-diachi">${address}</td>
            <td>${createAt}</td>
            <td>${dob}</td>
            <td class="col-vaitro">${role}</td>
            <td>
              <button type="button" class="btn-Sua"
                data-id="${id}"
                data-fullname="${fullName}"
                data-phone="${phone}"
                data-address="${address}"
                data-dob="${dob}"
                data-role="${role}">
                <i class="fa-solid fa-pen-to-square"></i>
              </button>
              ${lockHtml}
            </td>
          </tr>`;
            })
            .join("");
    }

    function renderPagination(totalPages, currentPage) {
        totalPages = totalPages || 1;
        currentPage = currentPage || 1;

        let html = "";
        if (currentPage > 1) html += `<a class="page-link" href="#" data-page="${currentPage - 1}">Trước</a>`;

        for (let p = 1; p <= totalPages; p++) {
            html += `<a class="page-link ${p === currentPage ? "active" : ""}" href="#" data-page="${p}">${p}</a>`;
        }

        if (currentPage < totalPages) html += `<a class="page-link" href="#" data-page="${currentPage + 1}">Sau</a>`;
        pagination.innerHTML = html;
    }

    async function fetchUsers(q, page = 1) {
        if (abortCtrl) abortCtrl.abort();
        abortCtrl = new AbortController();

        if (statusEl) statusEl.textContent = "Đang tìm...";

        try {
            const url = new URL(ctx + "/admin/users", window.location.origin);
            url.searchParams.set("ajax", "1");
            url.searchParams.set("q", q || "");
            url.searchParams.set("page", String(page));

            const res = await fetch(url.toString(), {
                signal: abortCtrl.signal,
                headers: { "X-Requested-With": "XMLHttpRequest" },
            });

            const ct = res.headers.get("content-type") || "";
            if (!ct.includes("application/json")) {
                // nếu bị redirect do hết session
                window.location.href = ctx + "/login";
                return;
            }

            const data = await res.json();

            renderRows(data.users, data.q, data.currentPage);
            renderPagination(data.totalPages, data.currentPage);

            if (statusEl) statusEl.textContent = "";

            // update URL không reload
            const newUrl = new URL(window.location.href);
            newUrl.searchParams.set("q", data.q || "");
            newUrl.searchParams.set("page", String(data.currentPage || 1));
            window.history.replaceState({}, "", newUrl);
        } catch (err) {
            if (err.name === "AbortError") return;
            console.error(err);
            if (statusEl) statusEl.textContent = "Lỗi tìm kiếm, hãy thử lại.";
        }
    }

    // debounce input
    searchInput.addEventListener("input", () => {
        const q = searchInput.value || "";
        clearTimeout(debounceTimer);
        debounceTimer = setTimeout(() => fetchUsers(q, 1), 300);
    });

    // chặn submit để khỏi reload
    searchForm?.addEventListener("submit", (e) => {
        e.preventDefault();
        fetchUsers(searchInput.value || "", 1);
    });

    // phân trang ajax
    pagination.addEventListener("click", (e) => {
        const a = e.target.closest("a.page-link");
        if (!a) return;
        e.preventDefault();
        fetchUsers(searchInput.value || "", parseInt(a.dataset.page || "1", 10));
    });
})();
