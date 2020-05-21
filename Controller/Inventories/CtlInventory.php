<?php

require '../../Infraestructure/CORS.php';
require '../../DTO/Inventories/InventoryDTO.php';
require '../../DAO/Inventories/InventoryDAO.php';
require '../../Helper/Action/Action.php';
require '../../Infraestructure/Security.php';

/* Recepcion de datos */

$action = getInfo('action');
$milligrams = getInfo('milligrams');
$name = getInfo('name');
$description = getInfo('description');
$admissiondate = getInfo('admissiondate');
$expirationdate = getInfo('expirationdate');
$lotecode = getInfo('lotecode');
$quantity = getInfo('quantity');
$price = getInfo('price');
$provider_id = getInfo('provider_id');
$shelf_id = getInfo('shelf_id');
$typeproduct_id = getInfo('typeproduct_id');
$laboratory_id = getInfo('laboratory_id');
$status_id = getInfo('status_id');
$nameImg = getInfo('nameImg');
$img = getInfo('imagen');
$id = getInfo('id');
$edit = getInfo('edit');


/* Recepcion del token */

//$token = getInfo('token');
$security = new Security();

//if ($security->validarTokenUser($token)) {

if ($action === 'save' || $action === 'update') {
    if ($edit === "true") {
        $base_to_php = explode(',', $img);
        $today = getdate();
        $data = base64_decode($base_to_php[1]);
        $filepath = "../../Resource/Img/Inventory/" . $today["year"] . "_" . $today["mon"] . "_" . $today["mday"] . "_" . $nameImg;
        $routeimg = "Resource/Img/Inventory/" . $today["year"] . '_' . $today["mon"] . '_' . $today["mday"] . '_' . $nameImg;
        file_put_contents($filepath, $data);
        $obj = new InventoryDTO(
                $id, $milligrams, $name, $description, $admissiondate, $expirationdate, $lotecode,
                $quantity, $price, $provider_id, $shelf_id, $typeproduct_id, $laboratory_id, $status_id, $routeimg
        );
    } else {
        $obj = new InventoryDTO(
                $id, $milligrams, $name, $description, $admissiondate, $expirationdate, $lotecode,
                $quantity, $price, $provider_id, $shelf_id, $typeproduct_id, $laboratory_id, $status_id, $img
        );
    }
} else if ($action === 'delete') {
    unlink('../../Resource/Img/Inventory/' . $nameImg);
    $obj = new InventoryDTO(
            $id, $milligrams, $name, $description, $admissiondate, $expirationdate, $lotecode,
            $quantity, $price, $provider_id, $shelf_id, $typeproduct_id, $laboratory_id, $status_id, $img
    );
} else {
    $obj = new InventoryDTO(
            $id, $milligrams, $name, $description, $admissiondate, $expirationdate, $lotecode,
            $quantity, $price, $provider_id, $shelf_id, $typeproduct_id, $laboratory_id, $status_id, $img
    );
}

$dao = new InventoryDAO();

/* Control de acciones */
ExecuteAction($action, $obj, $dao);
//}
