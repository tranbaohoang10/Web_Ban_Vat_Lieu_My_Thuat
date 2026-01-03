var config = {};

(function () {
    // Ví dụ pathname:
    // /mythuat_shop_war_exploded/ckfinder/static/ckfinder/ckfinder.html
    var path = window.location.pathname;
    var idx = path.indexOf('/ckfinder/');

    // Lấy contextPath: /mythuat_shop_war_exploded
    var ctx = (idx >= 0) ? path.substring(0, idx) : '';

    // Connector đúng
    config.connectorPath = ctx + '/ckfinder/connector/';
    config.connectorUrl  = ctx + '/ckfinder/connector/';
})();

CKFinder.define(config);
