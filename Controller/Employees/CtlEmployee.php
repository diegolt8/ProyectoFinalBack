<?php

require '../../Infraestructure/CORS.php';
require '../../DTO/Employees/EmployeeDTO.php';
require '../../DAO/Employees/EmployeeDAO.php';
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
$rol = getInfo('rol');
$id = getInfo('id');


$obj = new EmployeeDTO($id, $names, $lastNames, $documentType, $documentNumber, $gender, $admissionDate, $age, $rol);
$dao = new EmployeeDAO();

ExecuteAction($action, $obj, $dao);