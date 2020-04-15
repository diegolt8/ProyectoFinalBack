<?php

require '../../Infraestructure/CORS.php';
require '../../DTO/Sales/SaleDTO.php';
require '../../DAO/Sales/SalesDAO.php';
require '../../Helper/Action/Action.php';
require '../../Infraestructure/Security.php';


/* Recepcion de datos */

$action = getInfo('action');
$usuario_id = getInfo('usuario_id');
$rol_id = getInfo('rol_id');
$factura_id = getInfo('factura_id');
$saleDate = getInfo('SaleDate');
$quatity = getInfo('quatity');
$saleTotal = getInfo('saletotal');
$id = getInfo('id');


/* Recepcion del token */

$token = getInfo('token');
$security = new Security();

if ($security->validarTokenUser($token)) {
    $obj = new SaleDTO(
        $id,
        $usuario_id,
        $rol_id,
        $factura_id,
        $saleDate,
        $quatity,
        $saleTotal
    );

    $dao = new SaleDAO();

    /* Control de acciones */
    ExecuteAction($action, $obj, $dao);
}
