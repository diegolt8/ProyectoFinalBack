<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class userDAO
{

    private $repository;

    function __construct()
    {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param UserDTO $obj
     */
    public function Save(UserDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("saveuser", array(
            (string) $obj->getName(),
            (string) $obj->getLastnames(),
            (string) $obj->getDocumentType(),
            (string) $obj->getDocumentNumber(),
            (string) $obj->getGender(),
            (int) $obj->getAge(),
            (string) $obj->getBirhdate(),
            (int) $obj->getPoints(),
            (string) $obj->getPassword(),
            (int) $obj->getRol_id(),
            (int) $obj->getCity_id(),
            (string) $obj->getAdmissionDate()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param UserDTO $obj
     * @param boolean $type indica si se quiere filtro o no 
     */
    public function ListAll(UserDTO $obj, $type)
    {
        $query = $this->repository->buildQuery("listuser", array((int) $obj->getIdUser()));
        $this->repository->Execute($query);
    }
    
    public function ListEmployee(UserDTO $obj, $type)
    {
        $query = $this->repository->buildQuery("listemployee", array((int) $obj->getIdUser()));
        $this->repository->Execute($query);
    }
    
     public function ListClient(UserDTO $obj, $type)
    {
        $query = $this->repository->buildQuery("listclient", array((int) $obj->getIdUser()));
        $this->repository->Execute($query);
    }

    /**
     * ejecuta un buscar en la base de datos
     * @param UserDTO $obj
     */
    public function Search(UserDTO $obj)
    {
        $query = $this->repository->buildQuery("searchuser", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param UserDTO $obj
     */
    public function Update(UserDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("updateuser", array(
            (int) $obj->getId(), (string) $obj->getName(),
            (string) $obj->getLastnames(),
            (string) $obj->getDocumentType(),
            (string) $obj->getDocumentNumber(),
            (string) $obj->getGender(),
            (int) $obj->getAge(),
            (string) $obj->getBirhdate(),
            (int) $obj->getPoints(),
            (string) $obj->getPassword(),
            (int) $obj->getRol_id(),
            (int) $obj->getCity_id(),
            (string) $obj->getAdmissionDate()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param UserDTO $obj
     */
    public function Delete(UserDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("deleteuser", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }
}