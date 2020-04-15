<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once ('../../DTO/BaseDTO.php');

class UserDTO extends BaseDTO {

    private $id;
    private $names;
    private $lastNames;
    private $documentType;
    private $documentNumber;
    private $gender;
    private $admissionDate;
    private $age;
    private $birthCity;
    private $birthDate;
    private $rol;
    private $point;

    function __construct($id, $names, $lastNames, $documentType, $documentNumber, $gender, $admissionDate, $age, $birthCity, $birthDate, $rol, $point) {
        $this->id = $id;
        $this->names = $names;
        $this->lastNames = $lastNames;
        $this->documentType = $documentType;
        $this->documentNumber = $documentNumber;
        $this->gender = $gender;
        $this->admissionDate = $admissionDate;
        $this->age = $age;
        $this->birthCity = $birthCity;
        $this->birthDate = $birthDate;
        $this->rol = $rol;
        $this->point = $point;
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

    function getBirthCity() {
        return $this->birthCity;
    }

    function getBirthDate() {
        return $this->birthDate;
    }

    function getRol() {
        return $this->rol;
    }

    function getPoint() {
        return $this->point;
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

    function setBirthCity($birthCity) {
        $this->birthCity = $birthCity;
    }

    function setBirthDate($birthDate) {
        $this->birthDate = $birthDate;
    }

    function setRol($rol) {
        $this->rol = $rol;
    }

    function setPoint($point) {
        $this->point = $point;
    }

}
