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
$names = getInfo('names');
$lastNames = getInfo('lastNames');
$documentType = getInfo('documentType');
$documentNumer = getInfo('documentNumer');
$gender = getInfo('gender');
$admissionDate = getInfo('admissionDate');
$age = getInfo('age');
$birthCity = getInfo('birthCity');
$birthDate = getInfo('birthDate');
$rol = getInfo('rol');
$point = getInfo('point');
$id = getInfo('id');


$obj = new UserDTO($id, $names, $lastNames, $documentType, $documentNumber, $gender, $admissionDate, $age, $birthCity, $birthDate, $rol, $point);
$dao = new userDAO();

ExecuteAction($action, $obj, $dao);