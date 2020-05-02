<?php

require '../../Infraestructure/CORS.php';
require '../../DTO/Users/UserDTO.php';
require '../../DAO/Users/UserDAO.php';
require '../../Helper/Action/Action.php';
require '../../Infraestructure/Security.php';
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$action = getInfo('action');
$name = getInfo('name');
$lastname = getInfo('lastname');
$documenttype = getInfo('documenttype');
$documentnumber = getInfo('documentnumber');
$gender = getInfo('gender');
$age = getInfo('age');
$birthdate = getInfo('birthdate');
$points = getInfo('points');
$password = getInfo('password');
$rol_id = getInfo('rol_id');
$city_id = getInfo('city_id');
$admissiondate = getInfo('admissiondate');
$id = getInfo('id');


$obj = new UserDTO(
    $id,
    $name,
    $lastname,
    $documenttype,
    $documentnumber,
    $gender,
    $age,
    $birthdate,
    $points,
    $password,
    $rol_id,
    $city_id,
    $admissiondate
);
$dao = new userDAO();

ExecuteAction($action, $obj, $dao);
