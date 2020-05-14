<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require '../../Infraestructure/CORS.php';
require '../../Helper/Action/Action.php';
require '../../Infraestructure/Security.php';

$json = file_get_contents('php://input');
$params = json_decode($json);

$pass = password_verify($params->passwordLogin, $params->password);

if($pass){
    echo 'true';
}else{
    echo 'false';
}

