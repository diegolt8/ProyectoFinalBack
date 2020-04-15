<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once '../../DTO/BaseDTO.php';

class ProductDTO extends BaseDTO {

    private $id;
    private $tipoProducto_id;
    private $inventario_id;
    private $estante_id;
    private $proveedor_id;

    function __construct($id, $tipoProducto_id, $inventario_id, $estante_id, $proveedor_id) {
        $this->id = $id;
        $this->tipoProducto_id = $tipoProducto_id;
        $this->inventario_id = $inventario_id;
        $this->estante_id = $estante_id;
        $this->proveedor_id = $proveedor_id;
    }

    function getId() {
        return $this->id;
    }

    function getTipoProducto_id() {
        return $this->tipoProducto_id;
    }

    function getInventario_id() {
        return $this->inventario_id;
    }

    function getEstante_id() {
        return $this->estante_id;
    }

    function getProveedor_id() {
        return $this->proveedor_id;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setTipoProducto_id($tipoProducto_id) {
        $this->tipoProducto_id = $tipoProducto_id;
    }

    function setInventario_id($inventario_id) {
        $this->inventario_id = $inventario_id;
    }

    function setEstante_id($estante_id) {
        $this->estante_id = $estante_id;
    }

    function setProveedor_id($proveedor_id) {
        $this->proveedor_id = $proveedor_id;
    }

}
