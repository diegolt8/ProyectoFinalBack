<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once '../../DTO/BaseDTO.php';

class DetailSaleDTO extends BaseDTO {

    private $id;
    private $inventory_id;
    private $sale_id;
    private $quantity;

    function __construct($id, $inventory_id, $sale_id, $quantity) {
        $this->id = $id;
        $this->inventory_id = $inventory_id;
        $this->sale_id = $sale_id;
        $this->quantity = $quantity;
    }

    function getId() {
        return $this->id;
    }

    function getInventory_id() {
        return $this->inventory_id;
    }

    function getSale_id() {
        return $this->sale_id;
    }

    function getQuantity() {
        return $this->quantity;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setInventory_id($inventory_id) {
        $this->inventory_id = $inventory_id;
    }

    function setSale_id($sale_id) {
        $this->sale_id = $sale_id;
    }

    function setQuantity($quantity) {
        $this->quantity = $quantity;
    }

}
