<?php

require '../../Infraestructure/CORS.php';
require '../../DTO/Status/StatusDTO.php';
require '../../DAO/Status/StatusDAO.php';
require '../../Helper/Action/Action.php';
require '../../Infraestructure/Security.php';


/* Recepcion de datos */

$action = getInfo('action');
$name = getInfo('name');
$id = getInfo('id');


/* Recepcion de token */
//$token = getInfo('token');
$security = new Security();

//if ($security->validarTokenUser($token)) {
    $obj = new StatusDTO(
        $id,
        $name
    );

    $dao = new StatusDAO();

    /* Control de acciones */
    ExecuteAction($action, $obj, $dao);
//}
