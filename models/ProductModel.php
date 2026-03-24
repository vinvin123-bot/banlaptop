<?php
class ProductModel {
    public function getAllProducts() {
        return [
            ["id"=>1,"code"=>"LAP001","name"=>"Dell XPS 13","price"=>32000000,"qty"=>15,"date"=>"2025-09-01","show"=>true],
            ["id"=>2,"code"=>"LAP002","name"=>"MacBook Air M2","price"=>28000000,"qty"=>20,"date"=>"2025-09-01","show"=>true],
            ["id"=>3,"code"=>"LAP003","name"=>"Asus ROG Strix G15","price"=>35000000,"qty"=>8,"date"=>"2025-09-01","show"=>false],
            ["id"=>4,"code"=>"LAP004","name"=>"HP Pavilion 15","price"=>18000000,"qty"=>25,"date"=>"2025-09-01","show"=>true],
            ["id"=>5,"code"=>"LAP005","name"=>"Lenovo Legion 5","price"=>30000000,"qty"=>12,"date"=>"2025-09-01","show"=>false],
        ];
    }
}