<?php

class ProviderDAO
{
    private $repository;

    function __construct()
    {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }


    public function Save(ProviderDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("saveprovider", array(
            (string) $obj->getName(),
            (string) $obj->getNit(), (string) $obj->getAddress(), (int) $obj->getCity_id()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    public function ListAll(ProviderDTO $obj, $type)
    {
        $query = $this->repository->buildQuery("listprovider", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    public function Search(ProviderDTO $obj)
    {
        $query = $this->repository->buildQuery("searchprovider", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    public function Update(ProviderDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("updateprovider", array(
            (int) $obj->getId(),
            (string) $obj->getName(),
            (string) $obj->getNit(), (string) $obj->getAddress(), (int) $obj->getCity_id()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    public function Delete(ProviderDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("deleteprovider", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }
}
