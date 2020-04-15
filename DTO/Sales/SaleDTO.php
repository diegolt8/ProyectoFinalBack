<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once '../../DTO/BaseDTO.php';

class SaleDTO extends BaseDTO {
   private $id;
   private $usuario_id;
   private $rol_id;
   private $factura_id;
   private $saleDate;
   private $quatity;
   private $saleTotal;
   
   function __construct($id, $usuario_id, $rol_id, $factura_id, $saleDate, $quatity, $saleTotal) {
       $this->id = $id;
       $this->usuario_id = $usuario_id;
       $this->rol_id = $rol_id;
       $this->factura_id = $factura_id;
       $this->saleDate = $saleDate;
       $this->quatity = $quatity;
       $this->saleTotal = $saleTotal;
   }
   
   function getId() {
       return $this->id;
   }

   function getUsuario_id() {
       return $this->usuario_id;
   }

   function getRol_id() {
       return $this->rol_id;
   }

   function getFactura_id() {
       return $this->factura_id;
   }

   function getSaleDate() {
       return $this->saleDate;
   }

   function getQuatity() {
       return $this->quatity;
   }

   function getSaleTotal() {
       return $this->saleTotal;
   }

   function setId($id) {
       $this->id = $id;
   }

   function setUsuario_id($usuario_id) {
       $this->usuario_id = $usuario_id;
   }

   function setRol_id($rol_id) {
       $this->rol_id = $rol_id;
   }

   function setFactura_id($factura_id) {
       $this->factura_id = $factura_id;
   }

   function setSaleDate($saleDate) {
       $this->saleDate = $saleDate;
   }

   function setQuatity($quatity) {
       $this->quatity = $quatity;
   }

   function setSaleTotal($saleTotal) {
       $this->saleTotal = $saleTotal;
   }



}

