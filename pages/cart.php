<?php
  error_reporting(E_ALL);
  ini_set("display_errors", 1);
  require '../vendor/autoload.php';

  $pdo = new PDO("mysql:host=localhost;dbname=webshop", "root", "root");
  $fpdo = new FluentPDO($pdo);


?>
