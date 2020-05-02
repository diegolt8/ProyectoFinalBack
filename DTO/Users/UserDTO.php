<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once ('../../DTO/BaseDTO.php');

class UserDTO extends BaseDTO {

    private $id;
    private $name;
    private $lastnames;
    private $documenttype;
    private $documentnumber;
    private $gender;
    private $age;
    private $birhdate;
    private $points;
    private $password;
    private $rol_id;
    private $city_id;
    private $admissiondate;

    function __construct($id, $name, $lastnames, $documenttype, $documentnumber, $gender, $age, $birhdate, $points, $password, $rol_id, $city_id, $admissiondate) {
        $this->id = $id;
        $this->name = $name;
        $this->lastnames = $lastnames;
        $this->documenttype = $documenttype;
        $this->documentnumber = $documentnumber;
        $this->gender = $gender;
        $this->age = $age;
        $this->birhdate = $birhdate;
        $this->points = $points;
        $this->password = $password;
        $this->rol_id = $rol_id;
        $this->city_id = $city_id;
        $this->admissiondate = $admissiondate;
    }

    function getId() {
        return $this->id;
    }

    function getName() {
        return $this->name;
    }

    function getLastnames() {
        return $this->lastnames;
    }

    function getDocumenttype() {
        return $this->documenttype;
    }

    function getDocumentnumber() {
        return $this->documentnumber;
    }

    function getGender() {
        return $this->gender;
    }

    function getAge() {
        return $this->age;
    }

    function getBirhdate() {
        return $this->birhdate;
    }

    function getPoints() {
        return $this->points;
    }

    function getPassword() {
        return $this->password;
    }

    function getRol_id() {
        return $this->rol_id;
    }

    function getCity_id() {
        return $this->city_id;
    }

    function getAdmissiondate() {
        return $this->admissiondate;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setName($name) {
        $this->name = $name;
    }

    function setLastnames($lastnames) {
        $this->lastnames = $lastnames;
    }

    function setDocumenttype($documenttype) {
        $this->documenttype = $documenttype;
    }

    function setDocumentnumber($documentnumber) {
        $this->documentnumber = $documentnumber;
    }

    function setGender($gender) {
        $this->gender = $gender;
    }

    function setAge($age) {
        $this->age = $age;
    }

    function setBirhdate($birhdate) {
        $this->birhdate = $birhdate;
    }

    function setPoints($points) {
        $this->points = $points;
    }

    function setPassword($password) {
        $this->password = $password;
    }

    function setRol_id($rol_id) {
        $this->rol_id = $rol_id;
    }

    function setCity_id($city_id) {
        $this->city_id = $city_id;
    }

    function setAdmissiondate($admissiondate) {
        $this->admissiondate = $admissiondate;
    }

}
