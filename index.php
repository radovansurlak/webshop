<?php
    error_reporting(E_ALL);
    ini_set("display_errors", 1);
    require 'vendor/autoload.php';

    //PDO Initialization + Database Connection

    $pdo = new PDO("mysql:host=localhost;dbname=webshop", "root", "root");
    $fpdo = new FluentPDO($pdo);

    //Category Selection Function

    function selectCategory($catID) {
      global $fpdo;
      global $query;
      $defaultQuery = $fpdo->from('products_categories AS categories')
                    ->leftJoin('products ON categories.ProductID = products.ID')
                    ->select('products.ImageURL, products.Name, products.Price');

      $query = $fpdo->from('products_categories AS categories')
                    ->leftJoin('products ON categories.ProductID = products.ID')
                    ->select('products.ImageURL, products.Name, products.Price')
                    ->where('categories.CategoryID',$catID);

      if ($catID === 'all') {
        $query = $defaultQuery;
      }
      return $query;
    }

    ////

    //Routing
    $router = new AltoRouter();

    $router->map( 'GET', '/', function() {
      selectCategory('all');
    });
    $router->map( 'GET', '/cart', function() {
      header('Location: /pages/cart.php');
    });
    $router->map( 'GET', '/[a:id]', function($id) {
      selectCategory($id);
    });



    // match current request url
    $match = $router->match();

    // call closure or throw 404 status
    if( $match && is_callable( $match['target'] ) ) {
    	call_user_func_array( $match['target'], $match['params'] );
    } else {
    	// no route was matched
    	header( $_SERVER["SERVER_PROTOCOL"] . ' 404 Not Found');
    }
?>

<html>
  <link rel="stylesheet" href="css/main.css">
<body>
  <menu>
    <ul>
      <li><a href="/">All Of 'Em</a></li>
      <li><a href="1">Fishy Fish</a></li>
      <li><a href="2">Unique Unicorns</a></li>
      <li><a href="3">Birdy Birds</a></li>
      <li><a href="4">Slimy Slides</a></li>
      <li><a href="5">Precious Predators</a></li>
      <li><a href="6">Other Crazy Ones</a></li>
    </ul>
  </menu>
  <main>
    <?php
      foreach ($query as $row) {
        // var_dump($row);
          echo "<section>
                  <div class='product product__image' style='background-image: url(images/{$row['ImageURL']})'></div>
                  <h1> {$row['Name']} </h1>
                  <h2> \${$row['Price']} </h2>
                  <button>Buy Now</button>
                </section>
                ";
      };
    ?>
  </main>
</body>
</html>
