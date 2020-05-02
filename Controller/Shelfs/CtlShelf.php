<?php

require '../../Infraestructure/CORS.php';
require '../../DTO/Shelfs/ShelfDTO.php';
require '../../DAO/Shelfs/ShelfDAO.php';
require '../../Helper/Action/Action.php';
require '../../Infraestructure/Security.php';


/* Recepcion de datos */

$action = getInfo('action');
$name = getInfo('name');
$description = getInfo('description');
$id = getInfo('id');


/* Recepcion de token */
//$token = getInfo('token');
$security = new Security();

//if ($security->validarTokenUser($token)) {
    $obj = new ShelfDTO(
        $id,
        $name,
        $description
    );

    $dao = new ShelfDAO();

    /* Control de acciones */
    ExecuteAction($action, $obj, $dao);
//}
