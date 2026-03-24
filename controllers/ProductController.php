
<?php
require_once "models/ProductModel.php";

class ProductController {
    public function index() {
        $model = new ProductModel();
        $products = $model->getAllProducts();

        require "views/ProductViews.php";
    }
}