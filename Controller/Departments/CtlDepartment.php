<?php

require '../../Infraestructure/CORS.php';
require '../../DTO/Departments/DepartmentDTO.php';
require '../../DAO/Departments/DepartmentDAO.php';
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
    $obj = new DepartmentDTO(
        $id,
        $name,
        $description
    );

    $dao = new DepartmentDAO();

    /* Control de acciones */
    ExecuteAction($action, $obj, $dao);
//}
