<!DOCTYPE html>
<html>
<head>
    <title>Shop Laptop</title>
    <style>
        body {
            font-family: Arial;
            background: #f5f5f5;
        }
        .header {
            background: #222;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 24px;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin-top: 20px;
        }
        .card {
            background: white;
            width: 250px;
            margin: 15px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
            padding: 15px;
            text-align: center;
        }
        .card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }
        .price {
            color: red;
            font-weight: bold;
            margin: 10px 0;
        }
        .btn {
            background: green;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<div class="header">
    🛒 Laptop Store
</div>

<div class="container">

    <div class="card">
        <img src="https://via.placeholder.com/250x150">
        <h3>Laptop Dell XPS</h3>
        <div class="price">25,000,000 VND</div>
        <button class="btn">Mua ngay</button>
    </div>

    <div class="card">
        <img src="https://via.placeholder.com/250x150">
        <h3>MacBook Pro</h3>
        <div class="price">40,000,000 VND</div>
        <button class="btn">Mua ngay</button>
    </div>

    <div class="card">
        <img src="https://via.placeholder.com/250x150">
        <h3>HP Pavilion</h3>
        <div class="price">18,000,000 VND</div>
        <button class="btn">Mua ngay</button>
    </div>

</div>

</body>
</html>