<?php

class RolDAO
{
    private $repository;

    function __construct()
    {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    public function Save(rolDTO $obj)
    {
        $query = $this->repository->buildQuerySimply('saverol', array(
            (string) $obj->getName(),
            (string) $obj->getDescription()
        ));

        $this->repository->ExecuteTransaction($query);
    }

    public function ListAll(rolDTO $obj, $type)
    {
        $query = $this->repository->buildQuery("listrol", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    public function Search(rolDTO $obj)
    {
        $query = $this->repository->buildQuery("searcrol", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    public function Update(rolDTO $obj)
    {
        $query = $this->repository->buildQuerySimply('updaterol', array(
            (int) $obj->getId(),
            (string) $obj->getName(),
            (string) $obj->getDescription()
        ));

        $this->repository->ExecuteTransaction($query);
    }

    public function Delete(rolDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("deleterol", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }
}
