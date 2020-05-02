<?php

require_once '../../DTO/BaseDTO.php';

class PharmacyDTO extends BaseDTO {

    private $id;
    private $name;
    private $logo;
    private $nit;

    function __construct($id, $name, $logo, $nit) {
        $this->id = $id;
        $this->name = $name;
        $this->logo = $logo;
        $this->nit = $nit;
    }

    function getId() {
        return $this->id;
    }

    function getName() {
        return $this->name;
    }

    function getLogo() {
        return $this->logo;
    }

    function getNit() {
        return $this->nit;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setName($name) {
        $this->name = $name;
    }

    function setLogo($logo) {
        $this->logo = $logo;
    }

    function setNit($nit) {
        $this->nit = $nit;
    }

}
