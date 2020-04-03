<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class EmployeeDAO {

    private $repository;

    function __construct() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param EmployeeDTO $obj
     */
    public function Save(EmployeeDTO $obj) {
        $query = $this->repository->buildQuerySimply("saveemployee", array((string) $obj->getNames(),
            (string) $obj->getLastNames(), (int) $obj->getDocumentType(), (int) $obj->getDocumentNumber(),
            (int) $obj->getGender(), (string) $obj->getAdmissionDate(), (int) $obj->getAge(), (int) $obj->getRol()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param EmployeeDTO $obj
     * @param boolean $type indica si se quiere filtro o no 
     */
    public function ListAll(EmployeeDTO $obj, $type) {
        $query = $this->repository->buildQuery("listemployee", array((int) $obj->getIdUser()));
        $this->repository->Execute($query);
    }

    /**
     * ejecuta un buscar en la base de datos
     * @param EmployeeDTO $obj
     */
    public function Search(EmployeeDTO $obj) {
        $query = $this->repository->buildQuery("searchemployee", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param EmployeeDTO $obj
     */
    public function Update(EmployeeDTO $obj) {
        $query = $this->repository->buildQuerySimply("updateemployee", array((int) $obj->getId(), (string) $obj->getNames(),
            (string) $obj->getLastNames(), (int) $obj->getDocumentType(), (int) $obj->getDocumentNumber(),
            (int) $obj->getGender(), (string) $obj->getAdmissionDate(), (int) $obj->getAge(), (int) $obj->getRol()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param EmployeeDTO $obj
     */
    public function Delete(EmployeeDTO $obj) {
        $query = $this->repository->buildQuery("deleteemployee", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
