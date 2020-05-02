<?php

require '../../Infraestructure/CORS.php';
require '../../DTO/Detailsales/DetailSaleDTO.php';
require '../../DAO/DetailSales/DetailSaleDAO.php';
require '../../Helper/Action/Action.php';
require '../../Infraestructure/Security.php';

/* Recepcion de datos */


$action = getInfo('action');
$inventory_id = getInfo('inventory_id');
$sale_id = getInfo('sale_id');
$quantity = getInfo('quantity');
$id = getInfo('id');


/* Recepcion del token */

$token = getInfo('token');
$security = new Security();

if ($security->validarTokenUser($token)) {
    $obj = new DetailSaleDTO(
        $id,
        $inventory_id,
        $sale_id,
        $quantity
    );

    $dao = new DetailSaleDAO();

    /* Control de acciones */
    ExecuteAction($action, $obj, $dao);
}
