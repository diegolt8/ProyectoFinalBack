<?php

class PharmacyDAO
{
    private $repository;

    function __construct()
    {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }


    public function Save(PharmacyDTO $obj)
    {

        $query = $this->repository->buildQuerySimply("savepharmacy", array(
            (string) $obj->getName(),
            (string) $obj->getLogo(),
            (string) $obj->getNit()
        ));

        $this->repository->ExecuteTransaction($query);
    }

    public function ListAll(PharmacyDTO $obj, $type)
    {
        $query = $this->repository->buildQuery('listpharmacy', array(
            (int) $obj->getId()
        ));

        $this->repository->Execute($query);
    }

    public function search(PharmacyDTO $obj)
    {

        $query = $this->repository->buildQuery("searchpharmacy", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    public function Update(PharmacyDTO $obj)
    {
        $query = $this->repository->buildQuerySimply('updatepharmacy', array(
            (int) $obj->getId(),
            (string) $obj->getName(),
            (string) $obj->getLogo(),
            (string) $obj->getNit()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    public function Delete(PharmacyDTO $obj)
    {
        $query = $this->repository->buildQuerySimply('deletepharmacy', array(
            (int) $obj->getId()
        ));
        $this->repository->ExecuteTransaction($query);
    }
}
