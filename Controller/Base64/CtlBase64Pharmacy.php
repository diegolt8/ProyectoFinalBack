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



    $objeto[$i] = array("id" => $params[$i]->id, "name" => $params[$i]->name,
        "imagen" => $base64, "nit" => $params[$i]->nit);
}

$object = new stdClass();

$object->code = 1;
$object->data = $objeto;
echo json_encode($object);


