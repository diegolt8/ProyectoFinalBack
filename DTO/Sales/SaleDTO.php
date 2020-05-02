<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once '../../DTO/BaseDTO.php';

class SaleDTO extends BaseDTO {

    private $id;
    private $saledate;
    private $saletotal;
    private $client_id;
    private $employee_id;

    function __construct($id, $saledate, $saletotal, $client_id, $employee_id) {
        $this->id = $id;
        $this->saledate = $saledate;
        $this->saletotal = $saletotal;
        $this->client_id = $client_id;
        $this->employee_id = $employee_id;
    }

    function getId() {
        return $this->id;
    }

    function getSaledate() {
        return $this->saledate;
    }

    function getSaletotal() {
        return $this->saletotal;
    }

    function getClient_id() {
        return $this->client_id;
    }

    function getEmployee_id() {
        return $this->employee_id;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setSaledate($saledate) {
        $this->saledate = $saledate;
    }

    function setSaletotal($saletotal) {
        $this->saletotal = $saletotal;
    }

    function setClient_id($client_id) {
        $this->client_id = $client_id;
    }

    function setEmployee_id($employee_id) {
        $this->employee_id = $employee_id;
    }

}
