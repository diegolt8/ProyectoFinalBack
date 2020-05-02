<?php

class StatusDAO
{
    private $repository;

    function __construct()
    {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    public function Save(StatusDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("savestate", array(
            (string) $obj->getName()
        ));

        $this->repository->ExecuteTransaction($query);
    }

    public function ListAll(StatusDTO $obj, $type)
    {
        $query = $this->repository->buildQuery("liststate", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    public function Search(StatusDTO $obj)
    {
        $query = $this->repository->buildQuery("searchstate", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    public function Update(StatusDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("updatestate", array(
            (int) $obj->getId(),
            (string) $obj->getName()
        ));

        $this->repository->ExecuteTransaction($query);
    }

    public function Delete(StatusDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("deletestate", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }
}
