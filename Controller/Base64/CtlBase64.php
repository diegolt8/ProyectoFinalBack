<?php

/* IMPORTS */
require '../../Infraestructure/CORS.php';
require '../../Helper/Action/Action.php';
require '../../Infraestructure/Security.php';



/* RECEPCION DE DATOS */

$json = file_get_contents('php://input');
$params = json_decode($json);

$objeto = array();

for ($i = 0; $i < count($params); ++$i) {
    $base_to_php = explode('/', $params[$i]->imagen);

    $imgDefi = $base_to_php[6] . '/' . $base_to_php[7];


    $path = '../../Resource/Img/' . $imgDefi;
    $type = pathinfo($path, PATHINFO_EXTENSION);
    $data = file_get_contents($path);
    $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);



    $objeto[$i] = array("id" => $params[$i]->id, "milligrams" => $params[$i]->milligrams,
        "name" => $params[$i]->name, "description" => $params[$i]->description,
        "admissiondate"=>$params[$i]->addmissiondate, "expirationdate" => $params[$i]->expirationdate,
        "lotecode"=>$params[$i]->lotecode, "quantity"=>$params[$i]->quantity, "price"=>$params[$i]->price,
        "provider_id"=>$params[$id]->provider_id, "shelf_id"=>$params[$i]->shelf_id, "typeproduct_id"=>$params[$i]->typeproduct_id,
        "laboratory_id"=>$params[$i]->laboratory_id, "status_id"=>$params[$i]->status_id,"imagen" => $base64);
}

$object = new stdClass();

$object->code = 1;
$object->data = $objeto;
echo json_encode($object);


