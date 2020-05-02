<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once '../../DTO/BaseDTO.php';

class ProviderDTO extends BaseDTO {

    private $id;
    private $name;
    private $nit;
    private $address;
    private $city_id;

    function __construct($id, $name, $nit, $address, $city_id) {
        $this->id = $id;
        $this->name = $name;
        $this->nit = $nit;
        $this->address = $address;
        $this->city_id = $city_id;
    }

    function getId() {
        return $this->id;
    }

    function getName() {
        return $this->name;
    }

    function getNit() {
        return $this->nit;
    }

    function getAddress() {
        return $this->address;
    }

    function getCity_id() {
        return $this->city_id;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setName($name) {
        $this->name = $name;
    }

    function setNit($nit) {
        $this->nit = $nit;
    }

    function setAddress($address) {
        $this->address = $address;
    }

    function setCity_id($city_id) {
        $this->city_id = $city_id;
    }

}
