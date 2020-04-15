<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once '../../DTO/BaseDTO.php';

class InventoryDTO extends BaseDTO {

    private $id;
    private $miligramos;
    private $names;
    private $description;
    private $admissionDate;
    private $expirationDate;
    private $loteCode;
    private $quantity;
    private $price;
    private $laboratory_id;

    function __construct($id, $miligramos, $names, $description, $admissionDate, $expirationDate, $loteCode, $quantity, $price, $laboratory_id) {
        $this->id = $id;
        $this->miligramos = $miligramos;
        $this->names = $names;
        $this->description = $description;
        $this->admissionDate = $admissionDate;
        $this->expirationDate = $expirationDate;
        $this->loteCode = $loteCode;
        $this->quantity = $quantity;
        $this->price = $price;
        $this->laboratory_id = $laboratory_id;
    }

    function getId() {
        return $this->id;
    }

    function getMiligramos() {
        return $this->miligramos;
    }

    function getNames() {
        return $this->names;
    }

    function getDescription() {
        return $this->description;
    }

    function getAdmissionDate() {
        return $this->admissionDate;
    }

    function getExpirationDate() {
        return $this->expirationDate;
    }

    function getLoteCode() {
        return $this->loteCode;
    }

    function getQuantity() {
        return $this->quantity;
    }

    function getPrice() {
        return $this->price;
    }

    function getLaboratory_id() {
        return $this->laboratory_id;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setMiligramos($miligramos) {
        $this->miligramos = $miligramos;
    }

    function setNames($names) {
        $this->names = $names;
    }

    function setDescription($description) {
        $this->description = $description;
    }

    function setAdmissionDate($admissionDate) {
        $this->admissionDate = $admissionDate;
    }

    function setExpirationDate($expirationDate) {
        $this->expirationDate = $expirationDate;
    }

    function setLoteCode($loteCode) {
        $this->loteCode = $loteCode;
    }

    function setQuantity($quantity) {
        $this->quantity = $quantity;
    }

    function setPrice($price) {
        $this->price = $price;
    }

    function setLaboratory_id($laboratory_id) {
        $this->laboratory_id = $laboratory_id;
    }

}
