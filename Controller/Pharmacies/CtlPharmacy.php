<?php

require '../../Infraestructure/CORS.php';
require '../../DTO/Pharmacies/PharmacyDTO.php';
require '../../DAO/Pharmacies/PharmacyDAO.php';
require '../../Helper/Action/Action.php';
require '../../Infraestructure/Security.php';

/* Recepcion de datos */

$action = getInfo('action');
$name = getInfo('name');
$img = getInfo('imagen');
$nameImg = getInfo('nameImg');
$nit = getInfo('nit');
$id = getInfo('id');
$edit = getInfo('edit');

/* Recepcion del token */
$security = new Security();

if ($action === 'save' || $action === 'update') {
    if ($edit === "true") {
        $base_to_php = explode(',', $img);
        $today = getdate();
        $data = base64_decode($base_to_php[1]);
        $filepath = "../../Resource/Img/Pharmacy/" . $today["year"] . "_" . $today["mon"] . "_" . $today["mday"] . "_" . $nameImg;
        $routeimg = "Resource/Img/Pharmacy/" . $today["year"] . '_' . $today["mon"] . '_' . $today["mday"] . '_' . $nameImg;
        file_put_contents($filepath, $data);
        $obj = new PharmacyDTO(
                $id, $name, $routeimg, $nit
        );
    } else {
        $obj = new PharmacyDTO(
                $id, $name, $img, $nit
        );
    }
} else if ($action === 'delete') {
    unlink('../../Resource/Img/Pharmacy/' . $nameImg);
    $obj = new PharmacyDTO(
            $id, $name, $img, $nit
    );
} else {
    $obj = new PharmacyDTO(
            $id, $name, $img, $nit
    );
}

$dao = new PharmacyDAO();

/* Control de acciones */
ExecuteAction($action, $obj, $dao);
//}

