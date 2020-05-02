<?php

class TypeproductDAO
{

    private $repository;

    function __construct()
    {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    public function Save(TypeProductDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("savetypeproduct", array(
            (string) $obj->getName(),
            (string) $obj->getDescription()
        ));

        $this->repository->ExecuteTransaction($query);
    }

    public function ListAll(TypeProductDTO $obj, $type)
    {
        $query = $this->repository->buildQuery("listtypeproduct", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    public function Search(TypeProductDTO $obj)
    {
        $query = $this->repository->buildQuery("searchtypeproduct", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    public function Update(TypeProductDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("updatetypeproduct", array(
            (int) $obj->getId(),
            (string) $obj->getName(),
            (string) $obj->getDescription()
        ));

        $this->repository->ExecuteTransaction($query);
    }

    public function Delete(TypeProductDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("deletetypeproduct", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }
}
