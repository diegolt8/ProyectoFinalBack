<?php

class LaboratoryDAO
{

    private $repository;

    function __construct()
    {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    public function Save(LaboratoryDTO $obj)
    {
        $query = $this->repository->buildQuerySimply('savelaboratory', array(
            (string) $obj->getName(),
            (string) $obj->getDescription()
        ));

        $this->repository->ExecuteTransaction($query);
    }

    public function ListAll(LaboratoryDTO $obj, $type)
    {
        $query = $this->repository->buildQuery("listlaboratory", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    public function Search(LaboratoryDTO $obj)
    {
        $query = $this->repository->buildQuery("searchinventory", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    public function Update(LaboratoryDTO $obj)
    {
        $query = $this->repository->buildQuerySimply('savelaboratory', array(
            (int) $obj->getId(),
            (string) $obj->getName(),
            (string) $obj->getDescription()
        ));

        $this->repository->ExecuteTransaction($query);
    }

    public function Delete(LaboratoryDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("deletelaboratory", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }
}
