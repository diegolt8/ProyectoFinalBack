<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


class DepartmentDAO
{

    private $repository;

    function __construct()
    {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    public function Save(DepartmentDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("savedepartment", array(
            (string) $obj->getName(),
            (string) $obj->getDescription()
        ));

        $this->repository->ExecuteTransaction($query);
    }

    public function ListAll(DepartmentDTO $obj, $type)
    {
        $query = $this->repository->buildQuery("listdepartment", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    public function Search(DepartmentDTO $obj)
    {
        $query = $this->repository->buildQuery("searchdepartment", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    public function Update(DepartmentDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("updatedepartment", array(
            (int) $obj->getId(),
            (string) $obj->getName(),
            (string) $obj->getDescription()
        ));

        $this->repository->ExecuteTransaction($query);
    }

    public function Delete(DepartmentDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("deletedepartment", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }
}
