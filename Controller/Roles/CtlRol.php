<?php

require '../../Infraestructure/CORS.php';
require '../../DTO/Roles/RolDTO.php';
require '../../DAO/Roles/RolDAO.php';
require '../../Helper/Action/Action.php';
require '../../Infraestructure/Security.php';


/* Recepcion de datos */

$action = getInfo('action');
$name = getInfo('name');
$description = getInfo('description');
$id = getInfo('id');


/* Recepcion del token */

//$token = getInfo('token');
$security = new Security();

//if ($security->validarTokenUser($token)) {
    $obj = new RolDTO(
        $id,
        $name,
        $description
    );

    $dao = new RolDAO();

    /* Control de acciones */
    ExecuteAction($action, $obj, $dao);
//}
