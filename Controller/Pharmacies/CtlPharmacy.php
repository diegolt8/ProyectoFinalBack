<?php


require '../../Infraestructure/CORS.php';
require '../../DTO/Pharmacies/PharmacyDTO.php';
require '../../DAO/Pharmacies/PharmacyDAO.php';
require '../../Helper/Action/Action.php';
require '../../Infraestructure/Security.php';

/* Recepcion de datos */

$action = getInfo('action');
$name = getInfo('name');
$logo = getInfo('logo');
$nit = getInfo('nit');
$id = getInfo('id');

/* Recepcion del token */
$token = getInfo('token');
$security = new Security();

if ($security->validarTokenUser($token)) {
    $obj = new PharmacyDTO(
        $id,
        $name,
        $logo,
        $nit
    );

    $dao = new PharmacyDAO();

    /* Control de acciones */
    ExecuteAction($action, $obj, $dao);
}
