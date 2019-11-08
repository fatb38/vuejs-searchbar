<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET');
header("Access-Control-Allow-Headers: X-Requested-With");

$db = new PDO (
    'mysql:host=localhost;dbname=itemselector;charset=utf8mb4',
    'root',
    'root',
    [
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    ]
);

if (strlen($_GET['q']) > 0) {

    $query = $db->prepare('
        SELECT
            id,
            firstname,
            lastname,
            email
        FROM customers
        WHERE firstname LIKE :search
        OR lastname LIKE :search
    ');
    $query->execute([':search' => '%' . $_GET['q'] . '%']);

    $items = $query->fetchAll();

    echo json_encode($items);
}
