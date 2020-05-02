<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once '../../DTO/BaseDTO.php';

class InventoryDTO extends BaseDTO {

    private $id;
    private $miligrams;
    private $name;
    private $description;
    private $admissiondate;
    private $expirationdate;
    private $lotecode;
    private $quantity;
    private $price;
    private $provider_id;
    private $shelf_id;
    private $typeproduct_id;
    private $laboratory_id;
    private $status_id;
    private $imagen;

    function __construct($id, $miligrams, $name, $description, $admissiondate, $expirationdate, $lotecode, $quantity, $price, $provider_id, $shelf_id, $typeproduct_id, $laboratory_id, $status_id, $imagen) {
        $this->id = $id;
        $this->miligrams = $miligrams;
        $this->name = $name;
        $this->description = $description;
        $this->admissiondate = $admissiondate;
        $this->expirationdate = $expirationdate;
        $this->lotecode = $lotecode;
        $this->quantity = $quantity;
        $this->price = $price;
        $this->provider_id = $provider_id;
        $this->shelf_id = $shelf_id;
        $this->typeproduct_id = $typeproduct_id;
        $this->laboratory_id = $laboratory_id;
        $this->status_id = $status_id;
        $this->imagen = $imagen;
    }

    function getId() {
        return $this->id;
    }

    function getMiligrams() {
        return $this->miligrams;
    }

    function getName() {
        return $this->name;
    }

    function getDescription() {
        return $this->description;
    }

    function getAdmissiondate() {
        return $this->admissiondate;
    }

    function getExpirationdate() {
        return $this->expirationdate;
    }

    function getLotecode() {
        return $this->lotecode;
    }

    function getQuantity() {
        return $this->quantity;
    }

    function getPrice() {
        return $this->price;
    }

    function getProvider_id() {
        return $this->provider_id;
    }

    function getShelf_id() {
        return $this->shelf_id;
    }

    function getTypeproduct_id() {
        return $this->typeproduct_id;
    }

    function getLaboratory_id() {
        return $this->laboratory_id;
    }

    function getStatus_id() {
        return $this->status_id;
    }

    function getImagen() {
        return $this->imagen;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setMiligrams($miligrams) {
        $this->miligrams = $miligrams;
    }

    function setName($name) {
        $this->name = $name;
    }

    function setDescription($description) {
        $this->description = $description;
    }

    function setAdmissiondate($admissiondate) {
        $this->admissiondate = $admissiondate;
    }

    function setExpirationdate($expirationdate) {
        $this->expirationdate = $expirationdate;
    }

    function setLotecode($lotecode) {
        $this->lotecode = $lotecode;
    }

    function setQuantity($quantity) {
        $this->quantity = $quantity;
    }

    function setPrice($price) {
        $this->price = $price;
    }

    function setProvider_id($provider_id) {
        $this->provider_id = $provider_id;
    }

    function setShelf_id($shelf_id) {
        $this->shelf_id = $shelf_id;
    }

    function setTypeproduct_id($typeproduct_id) {
        $this->typeproduct_id = $typeproduct_id;
    }

    function setLaboratory_id($laboratory_id) {
        $this->laboratory_id = $laboratory_id;
    }

    function setStatus_id($status_id) {
        $this->status_id = $status_id;
    }

    function setImagen($imagen) {
        $this->imagen = $imagen;
    }

}
