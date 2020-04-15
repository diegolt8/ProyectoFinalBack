<?php

require_once '../../DTO/BaseDTO.php';

class FarmacyDTO extends BaseDTO {

    private $name;
    private $logo;
    private $nit;

    function __construct($name, $logo, $nit) {
        $this->name = $name;
        $this->logo = $logo;
        $this->nit = $nit;
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
