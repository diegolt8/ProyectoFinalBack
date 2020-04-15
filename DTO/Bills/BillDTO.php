<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once '../../DTO/BaseDTO.php';

class BillDTO extends BaseDTO {

    private $id;
    private $rol_id;
    private $farmacia_id;

    function __construct($id, $rol_id, $farmacia_id) {
        $this->id = $id;
        $this->rol_id = $rol_id;
        $this->farmacia_id = $farmacia_id;
    }

    function getId() {
        return $this->id;
    }

    function getRol_id() {
        return $this->rol_id;
    }

    function getFarmacia_id() {
        return $this->farmacia_id;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setRol_id($rol_id) {
        $this->rol_id = $rol_id;
    }

    function setFarmacia_id($farmacia_id) {
        $this->farmacia_id = $farmacia_id;
    }

}
