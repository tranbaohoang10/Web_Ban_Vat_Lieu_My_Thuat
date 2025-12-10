<script>
    document.addEventListener('click', function(e) {
        const link = e.target.closest('.page-link');
        if (!link) return;

        e.preventDefault();

        const page = link.getAttribute('data-page');
        const productList = document.getElementById('productList');
        if (!productList || !page) return;

        const baseUrl = typeof paginationUrl !== 'undefined'
            ? paginationUrl
            : '${pageContext.request.contextPath}/search';

        const params = new URLSearchParams();
        params.append('page', page);
        params.append('ajax', '1');

        const currentUrl = new URL(window.location.href);
        currentUrl.searchParams.forEach((value, key) => {
            if (key !== 'page' && key !== 'ajax') {
                params.append(key, value);
            }
        });

        fetch(baseUrl + '?' + params.toString(), {
            method: 'GET',
            headers: { 'X-Requested-With': 'XMLHttpRequest' }
        })
            .then(response => response.text())
            .then(html => {
                productList.innerHTML = html;

                document.querySelectorAll('.page-link').forEach(a => a.classList.remove('active'));
                link.classList.add('active');

                productList.scrollIntoView({ behavior: 'smooth', block: 'start' });
            })
            .catch(err => console.error('Lỗi khi chuyển trang:', err));
    });
</script>
