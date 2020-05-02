<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class CityDAO {

    private $repository;

    function __construct() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    public function Save(CityDTO $obj) {
        $query = $this->repository->buildQuerySimply("savecity", array(
            (string) $obj->getName(),
            (string) $obj->getDescription(),
            (int) $obj->getDepartment_id()
        ));

        $this->repository->ExecuteTransaction($query);
    }

    public function ListAll(CityDTO $obj, $type) {
        $query = $this->repository->buildQuery("listcity", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    public function Search(CityDTO $obj) {
        $query = $this->repository->buildQuery("searchcity", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    public function Update(CityDTO $obj) {
        $query = $this->repository->buildQuerySimply("updatecity", array(
            (int) $obj->getId(),
            (string) $obj->getName(),
            (string) $obj->getDescription(),
            (int) $obj->getDepartment_id()
        ));

        $this->repository->ExecuteTransaction($query);
    }

    public function Delete(CityDTO $obj) {
        $query = $this->repository->buildQuerySimply("deletecity", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
