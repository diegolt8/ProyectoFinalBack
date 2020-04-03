<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once ('../../DTO/BaseDTO.php');

class EmployeeDTO extends BaseDTO {

    private $id;
    private $names;
    private $lastNames;
    private $documentType;
    private $documentNumber;
    private $gender;
    private $admissionDate;
    private $age;
    private $rol;

    function __construct($id, $names, $lastNames, $documentType, $documentNumber, $gender, $admissionDate, $age, $rol) {
        $this->id = $id;
        $this->names = $names;
        $this->lastNames = $lastNames;
        $this->documentType = $documentType;
        $this->documentNumber = $documentNumber;
        $this->gender = $gender;
        $this->admissionDate = $admissionDate;
        $this->age = $age;
        $this->rol = $rol;
    }

    function getId() {
        return $this->id;
    }

    function getNames() {
        return $this->names;
    }

    function getLastNames() {
        return $this->lastNames;
    }

    function getDocumentType() {
        return $this->documentType;
    }

    function getDocumentNumber() {
        return $this->documentNumber;
    }

    function getGender() {
        return $this->gender;
    }

    function getAdmissionDate() {
        return $this->admissionDate;
    }

    function getAge() {
        return $this->age;
    }

    function getRol() {
        return $this->rol;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setNames($names) {
        $this->names = $names;
    }

    function setLastNames($lastNames) {
        $this->lastNames = $lastNames;
    }

    function setDocumentType($documentType) {
        $this->documentType = $documentType;
    }

    function setDocumentNumber($documentNumber) {
        $this->documentNumber = $documentNumber;
    }

    function setGender($gender) {
        $this->gender = $gender;
    }

    function setAdmissionDate($admissionDate) {
        $this->admissionDate = $admissionDate;
    }

    function setAge($age) {
        $this->age = $age;
    }

    function setRol($rol) {
        $this->rol = $rol;
    }

}
