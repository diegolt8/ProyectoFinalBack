<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once '../../DTO/BaseDTO.php';

class CityDTO extends BaseDTO {

    private $id;
    private $name;
    private $description;
    private $department_id;

    function __construct($id, $name, $description, $department_id) {
        $this->id = $id;
        $this->name = $name;
        $this->description = $description;
        $this->department_id = $department_id;
    }

    function getId() {
        return $this->id;
    }

    function getName() {
        return $this->name;
    }

    function getDescription() {
        return $this->description;
    }

    function getDepartment_id() {
        return $this->department_id;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setName($name) {
        $this->name = $name;
    }

    function setDescription($description) {
        $this->description = $description;
    }

    function setDepartment_id($department_id) {
        $this->department_id = $department_id;
    }

}
