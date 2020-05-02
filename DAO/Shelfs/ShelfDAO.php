<?php

class ShelfDAO
{

    private $repository;

    function __construct()
    {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    public function Save(ShelfDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("saveshelf", array(
            (string) $obj->getName(),
            (string) $obj->getDescription()
        ));

        $this->repository->ExecuteTransaction($query);
    }

    public function ListAll(ShelfDTO $obj, $type)
    {
        $query = $this->repository->buildQuery("listshelf", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    public function Search(ShelfDTO $obj)
    {
        $query = $this->repository->buildQuery("searchshelf", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    public function Update(ShelfDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("updateshelf", array(
            (int) $obj->getId(),
            (string) $obj->getName(),
            (string) $obj->getDescription()
        ));

        $this->repository->ExecuteTransaction($query);
    }

    public function Delete(ShelfDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("deleteshelf", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }
}
