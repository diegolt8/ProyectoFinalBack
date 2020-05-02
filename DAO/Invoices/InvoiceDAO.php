<?php

class invoiceDAO
{
    private $repository;

    function __construct()
    {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    public function Save(InvoiceDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("saveinvoice", array(
            (int) $obj->getPharmacy_id(),
            (int) $obj->getUser_id(),
            (int) $obj->getSale_id()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    public function ListAll(InvoiceDTO $obj, $type)
    {
        $query = $this->repository->buildQuery('listinvoice', array(
            (int) $obj->getId()
        ));

        $this->repository->Execute($query);
    }

    public function search(InvoiceDTO $obj)
    {

        $query = $this->repository->buildQuery("searchinvoice", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    public function Update(InvoiceDTO $obj)
    {
        $query = $this->repository->buildQuerySimply('updateinvoice', array(
            (int) $obj->getId(),
            (int) $obj->getPharmacy_id(),
            (int) $obj->getUser_id(),
            (int) $obj->getSale_id()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    public function Delete(InvoiceDTO $obj)
    {
        $query = $this->repository->buildQuerySimply('deleteinvoice', array(
            (int) $obj->getId()
        ));
        $this->repository->ExecuteTransaction($query);
    }
}
