<?php
require_once 'config/database.php';

$pdo = Database::getInstance()->getConnection();
$total = $pdo->query("SELECT COUNT(*) FROM produk")->fetchColumn();

echo "Koneksi berhasil! Jumlah produk: " . $total;