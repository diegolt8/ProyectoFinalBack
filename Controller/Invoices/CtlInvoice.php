<?php

require '../../Infraestructure/CORS.php';
require '../../DTO/Invoices/InvoiceDTO.php';
require '../../DAO/Invoices/InvoiceDAO.php';
require '../../Helper/Action/Action.php';
require '../../Infraestructure/Security.php';

/* Recepcion de datos */

$action = getInfo('action');
$pharmacy_id = getInfo('pharmacy_id');
$user_id = getInfo('user_id');
$sale_id = getInfo('sale_id');
$id = getInfo('id');


/* Recepcion del token */

$token = getInfo('token');
$security = new Security();


if ($security->validarTokenUser($token)) {
    $obj = new InvoiceDTO(
        $id,
        $pharmacy_id,
        $user_id,
        $sale_id
    );

    $dao = new invoiceDAO();

    /* Control de acciones */
    ExecuteAction($action, $obj, $dao);
}
