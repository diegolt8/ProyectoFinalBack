<?php

require '../../Infraestructure/CORS.php';
require '../../DTO/Providers/ProviderDTO.php';
require '../../DAO/Providers/ProviderDAO.php';
require '../../Helper/Action/Action.php';
require '../../Infraestructure/Security.php';


/* Recepcion de datos */

$action = getInfo('action');
$name = getInfo('name');
$nit = getInfo('nit');
$address = getInfo('address');
$city = getInfo('city');
$id = getInfo('id');


/* Recepcion del token */

$token = getInfo('token');
$security = new Security();

if ($security->validarTokenUser($token)) {
    $obj = new ProductDTO(
        $id,
        $name,
        $nit,
        $address,
        $city
    );

    $dao = new ProviderDAO();

    /* Control de acciones */
    ExecuteAction($action, $obj, $dao);
}
