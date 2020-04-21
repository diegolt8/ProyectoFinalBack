<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once '../../DTO/BaseDTO.php';

class SaleDetailDTO extends BaseDTO {

    private $id;
    private $venta_id;
    private $usuario_id;
    private $rol_id;
    private $inventario_id;
    private $laboratorio_id;
    private $proveedor_id;
    private $tipoProducto_id;

    function __construct($id, $venta_id, $usuario_id, $rol_id, $inventario_id, $laboratorio_id, $proveedor_id, $tipoProducto_id) {
        $this->id = $id;
        $this->venta_id = $venta_id;
        $this->usuario_id = $usuario_id;
        $this->rol_id = $rol_id;
        $this->inventario_id = $inventario_id;
        $this->laboratorio_id = $laboratorio_id;
        $this->proveedor_id = $proveedor_id;
        $this->tipoProducto_id = $tipoProducto_id;
    }

    function getId() {
        return $this->id;
    }

    function getVenta_id() {
        return $this->venta_id;
    }

    function getUsuario_id() {
        return $this->usuario_id;
    }

    function getRol_id() {
        return $this->rol_id;
    }

    function getInventario_id() {
        return $this->inventario_id;
    }

    function getLaboratorio_id() {
        return $this->laboratorio_id;
    }

    function getProveedor_id() {
        return $this->proveedor_id;
    }

    function getTipoProducto_id() {
        return $this->tipoProducto_id;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setVenta_id($venta_id) {
        $this->venta_id = $venta_id;
    }

    function setUsuario_id($usuario_id) {
        $this->usuario_id = $usuario_id;
    }

    function setRol_id($rol_id) {
        $this->rol_id = $rol_id;
    }

    function setInventario_id($inventario_id) {
        $this->inventario_id = $inventario_id;
    }

    function setLaboratorio_id($laboratorio_id) {
        $this->laboratorio_id = $laboratorio_id;
    }

    function setProveedor_id($proveedor_id) {
        $this->proveedor_id = $proveedor_id;
    }

    function setTipoProducto_id($tipoProducto_id) {
        $this->tipoProducto_id = $tipoProducto_id;
    }

}
