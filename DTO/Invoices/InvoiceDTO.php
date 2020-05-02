<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once '../../DTO/BaseDTO.php';

class InvoiceDTO extends BaseDTO {

    private $id;
    private $pharmacy_id;
    private $user_id;
    private $sale_id;

    function __construct($id, $pharmacy_id, $user_id, $sale_id) {
        $this->id = $id;
        $this->pharmacy_id = $pharmacy_id;
        $this->user_id = $user_id;
        $this->sale_id = $sale_id;
    }

    function getId() {
        return $this->id;
    }

    function getPharmacy_id() {
        return $this->pharmacy_id;
    }

    function getUser_id() {
        return $this->user_id;
    }

    function getSale_id() {
        return $this->sale_id;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setPharmacy_id($pharmacy_id) {
        $this->pharmacy_id = $pharmacy_id;
    }

    function setUser_id($user_id) {
        $this->user_id = $user_id;
    }

    function setSale_id($sale_id) {
        $this->sale_id = $sale_id;
    }

}
