<?php

require '../../Infraestructure/CORS.php';
require '../../DTO/Sales/SaleDTO.php';
require '../../DAO/Sales/SalesDAO.php';
require '../../Helper/Action/Action.php';
require '../../Infraestructure/Security.php';


/* Recepcion de datos */

$action = getInfo('action');
$saledate = getInfo('saledate');
$saletotal = getInfo('saletotal');
$client_id = getInfo('client_id');
$employee_id = getInfo('employee_id');
$id = getInfo('id');


/* Recepcion del token */

//$token = getInfo('token');
$security = new Security();

//if ($security->validarTokenUser($token)) {
    $obj = new SaleDTO(
        $id,
        $saledate,
        $saletotal,
        $client_id,
        $employee_id
    );

    $dao = new SaleDAO();

    /* Control de acciones */
    ExecuteAction($action, $obj, $dao);
//}
