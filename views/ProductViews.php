<!DOCTYPE html>
<html>
<head>
    <title>Quản lý giỏ hàng</title>
    <style>
        body {font-family: Arial; background:#f5f5f5;}
        .container {width:90%; margin:auto;}
        table {width:100%; border-collapse: collapse; background:white;}
        th, td {padding:12px; text-align:center;}
        th {background: #a1c5db;;}
        tr {border-bottom:1px solid #ddd;}
        .btn {padding:5px 10px; border-radius:5px; color:white;}
        .view {background:#5bc0de;}
        .edit {background:#5cb85c;}
        .delete {background:#d9534f;}
    </style>
</head>
<body>

<div class="container">
    <h2>Quản lý sản phẩm</h2>

    <table>
        <tr>
            <th>STT</th>
            <th>Mã</th>
            <th>Tên laptop</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th>Ngày tạo</th>
            <th>Hiển thị</th>
            <th>Hành động</th>
        </tr>

        <?php foreach($products as $p): ?>
        <tr>
            <td><?= $p['id'] ?></td>
            <td><?= $p['code'] ?></td>
            <td><?= $p['name'] ?></td>
            <td><?= number_format($p['price']) ?>đ</td>
            <td><?= $p['qty'] ?></td>
            <td><?= $p['date'] ?></td>
            <td><?= $p['show'] ? "Có" : "Không" ?></td>
            <td>
                <span class="btn view">Xem</span>
                <span class="btn edit">Sửa</span>
                <span class="btn delete">Xóa</span>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>

</div>

</body>
</html>