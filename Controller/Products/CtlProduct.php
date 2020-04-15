<?php

require '../../Infraestructure/CORS.php';
require '../../DTO/Products/ProductDTO.php';
require '../../DAO/Products/ProductDAO.php';
require '../../Helper/Action/Action.php';
require '../../Infraestructure/Security.php';


/* Recepcion de datos */
$action = getInfo('action');
$tipo_producto = getInfo('tipoProducto_id');
$inventario_id = getInfo('inventari_id');
$estante_id = getInfo('estante_id');
$proveedor_id = getInfo('proveedor_id');
$id = getInfo('id');


/* Recepcion del token */
$token = getInfo('token');
$security = new Security();

if ($security->validarTokenUser($token)) {
    $obj = new ProductDTO(
        $id,
        $tipo_producto,
        $inventario_id,
        $estante_id,
        $proveedor_id,
    );

    $dao = new ProductDAO();

    /* Control de acciones */
    ExecuteAction($action, $obj, $dao);
}
