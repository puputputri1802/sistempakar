<?php
$host = "localhost";
$username = "root";
$password = "";
$dbname = "pakar";

// Gunakan mysqli_connect untuk koneksi database
$conn = mysqli_connect($host, $username, $password, $dbname);

if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
}
?>
