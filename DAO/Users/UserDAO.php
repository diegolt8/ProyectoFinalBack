<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class userDAO {

    private $repository;

    function __construct() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param UserDTO $obj
     */
    public function Save(UserDTO $obj) {
        $query = $this->repository->buildQuerySimply("saveuser", array((string) $obj->getNames(),
            (string) $obj->getLastNames(), (int) $obj->getDocumentType(), (int) $obj->getDocumentNumber(),
            (int) $obj->getGender(), (string) $obj->getAdmissionDate(), (int) $obj->getAge(), (string) $obj->getBirthCity(),
            (string) $obj->getBirthDate(), (int) $obj->getRol(), (int) $obj->getPoint()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param UserDTO $obj
     * @param boolean $type indica si se quiere filtro o no 
     */
    public function ListAll(UserDTO $obj, $type) {
        $query = $this->repository->buildQuery("listuser", array((int) $obj->getIdUser()));
        $this->repository->Execute($query);
    }

    /**
     * ejecuta un buscar en la base de datos
     * @param UserDTO $obj
     */
    public function Search(UserDTO $obj) {
        $query = $this->repository->buildQuery("searchuser", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param UserDTO $obj
     */
    public function Update(UserDTO $obj) {
        $query = $this->repository->buildQuerySimply("updateuser", array((int) $obj->getId(), (string) $obj->getNames(),
            (string) $obj->getLastNames(), (int) $obj->getDocumentType(), (int) $obj->getDocumentNumber(),
            (int) $obj->getGender(), (string) $obj->getAdmissionDate(), (int) $obj->getAge(), (string) $obj->getBirthCity(),
            (string) $obj->getBirthDate(), (int) $obj->getRol(), (int) $obj->getPoint()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param UserDTO $obj
     */
    public function Delete(UserDTO $obj) {
        $query = $this->repository->buildQuery("deleteuser", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
