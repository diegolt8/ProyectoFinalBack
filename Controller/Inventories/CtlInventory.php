<?php

require '../../Infraestructure/CORS.php';
require '../../DTO/Inventories/InventoryDTO.php';
require '../../DAO/Inventories/InventoryDAO.php';
require '../../Helper/Action/Action.php';
require '../../Infraestructure/Security.php';

/* Recepcion de datos */

$action = getInfo('action');
$miligramos = getInfo('miligramos');
$names = getInfo('names');
$description = getInfo('description');
$admissionDate = getInfo('admissionDate');
$expirationDate = getInfo('expirationDate');
$loteCode = getInfo('loteCode');
$quantity = getInfo('quantity');
$price = getInfo('price');
$laboratory_id = getInfo('laboratory_id');
$id = getInfo('id');


/* Recepcion del token */

$token = getInfo('token');
$security = new Security();

if ($security->validarTokenUser($token)) {
    $obj = new InventoryDTO(
        $id,
        $miligramos,
        $names,
        $description,
        $admissionDate,
        $expirationDate,
        $loteCode,
        $quantity,
        $price,
        $laboratory_id
    );

    $dao = new InventoryDAO();

    /* Control de acciones */
    ExecuteAction($action, $obj, $dao);
}