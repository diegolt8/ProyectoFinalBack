<?php

require '../../Infraestructure/CORS.php';
require '../../DTO/Cities/CityDTO.php';
require '../../DAO/Cities/CityDAO.php';
require '../../Helper/Action/Action.php';
require '../../Infraestructure/Security.php';


$action = getInfo("action");
$name = getInfo("name");
$description = getInfo("description");
$department_id = getInfo("department_id");
$id = getInfo("id");


/* Recepcion del token */

//$token = getInfo("token");
$security = new Security();


//if ($security->validarTokenUser($token)) {
    $obj = new CityDTO(
        $id,
        $name,
        $description,
        $department_id
    );

    $dao = new CityDAO();

    /* Control de acciones */
    ExecuteAction($action, $obj, $dao);
//}
