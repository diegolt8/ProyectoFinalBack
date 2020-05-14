<?php

require '../../Infraestructure/CORS.php';
require '../../DTO/Inventories/InventoryDTO.php';
require '../../DAO/Inventories/InventoryDAO.php';
require '../../Helper/Action/Action.php';
require '../../Infraestructure/Security.php';

/* Recepcion de datos */

$action = getInfo('action');
$miligrams = getInfo('miligrams');
$name = getInfo('name');
$description = getInfo('description');
$admissiondate = getInfo('admissiondate');
$expirationdate = getInfo('expirationdate');
$lotecode = getInfo('lotecode');
$quantity = getInfo('quantity');
$price = getInfo('price');
$provider_id = getInfo('provider_id');
$shelf_id = getInfo('shelf_id');
$typeproduct_id = getInfo('typeproduct_id');
$laboratory_id = getInfo('laboratory_id');
$status_id = getInfo('status_id');
$imagen = getInfo('imagen');
$id = getInfo('id');


/* Recepcion del token */

//$token = getInfo('token');
$security = new Security();

//if ($security->validarTokenUser($token)) {
    $obj = new InventoryDTO(
        $id,
        $miligrams,
        $name,
        $description,
        $admissiondate,
        $expirationdate,
        $lotecode,
        $quantity,
        $price,
        $provider_id,
        $shelf_id,
        $typeproduct_id,
        $laboratory_id,
        $status_id,
        $imagen
    );

    $dao = new InventoryDAO();

    /* Control de acciones */
    ExecuteAction($action, $obj, $dao);
//}
