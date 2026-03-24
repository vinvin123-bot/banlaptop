<?php
// gọi controller
require_once "controllers/ProductController.php";

// lấy action (mặc định là index)
$action = $_GET['action'] ?? 'index';

// tạo controller
$controller = new ProductController();

// điều hướng
switch($action) {
    case 'index':
        $controller->index();
        break;

    default:
        echo "404 - Không tìm thấy trang";
        break;
}