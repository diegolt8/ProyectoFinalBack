<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class InventoryDAO
{

    private $repository;

    function __construct()
    {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param InventoryDTO $obj
     * @return void
     */
    public function Save(InventoryDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("saveinventory", array(
            (int) $obj->getMiligrams(),
            (string) $obj->getName(), (string) $obj->getDescription(), (string) $obj->getAdmissionDate(),
            (string) $obj->getExpirationDate(), (string) $obj->getLoteCode(), (int) $obj->getQuantity(),
            (int) $obj->getPrice(), (int) $obj->getProvider_id(), (int) $obj->getShelf_id(), (int) $obj->getTypeproduct_id(),
            (int) $obj->getLaboratory_id(), (int) $obj->getStatus_id(), (string) $obj->getImagen()
        ));
        $this->repository->ExecuteTransaction($query);
    }


    /**
     * Ejecuta un listar en la base de datos
     * @param IventoryDTO $obj
     * @param boolean $type indica si se quiere filtro o no
     * @return void
     */
    public function ListAll(InventoryDTO $obj, $type)
    {
        $query = $this->repository->buildQuery("listinventory", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }
    
    public function total(InventoryDTO $obj, $type)
    {
        $query = $this->repository->buildQuery("totalsale", array((int) $obj->getId(), (int) $obj->getQuantity()));
        $this->repository->Execute($query);
    }


    /**
     * Ejecuta un buscar en la base de datos
     * @param InventoryDTO $obj
     * @return void
     */
    public function Search(InventoryDTO $obj)
    {
        $query = $this->repository->buildQuery("searchinventory", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un update en la base de datos
     * @param InventoryDTO @obj
     * @return void
     */
    public function Update(InventoryDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("updateinventory", array(
            (int) $obj->getId(),
            (int) $obj->getMiligrams(),
            (string) $obj->getName(), (string) $obj->getDescription(), (string) $obj->getAdmissionDate(),
            (string) $obj->getExpirationDate(), (string) $obj->getLoteCode(), (int) $obj->getQuantity(),
            (int) $obj->getPrice(), (int) $obj->getProvider_id(), (int) $obj->getShelf_id(), (int) $obj->getTypeproduct_id(),
            (int) $obj->getLaboratory_id(), (int) $obj->getStatus_id(), (string) $obj->getImagen()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param InventoryDTO $obj
     * @return void
     */
    public function Delete(InventoryDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("deleteinventory", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }
}
