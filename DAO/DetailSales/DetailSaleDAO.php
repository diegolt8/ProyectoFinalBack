<?php


class DetailSaleDAO
{
    private $repository;

    function __construct()
    {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    public function Save(DetailSaleDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("savedetailsale", array(
            (int) $obj->getInventory_id(),
            (int) $obj->getSale_id(),
            (int) $obj->getQuantity()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    public function ListAll(DetailSaleDTO $obj, $type)
    {
        $query = $this->repository->buildQuery("listdetailsale", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    public function Search(DetailSaleDTO $obj)
    {
        $query = $this->repository->buildQuery("searchdetailsale", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    public function Update(DetailSaleDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("updatedetailsale", array(
            (int) $obj->getId(),
            (int) $obj->getInventory_id(),
            (int) $obj->getSale_id(),
            (int) $obj->getQuantity()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    public function Delete(DetailSaleDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("deletedetailsale", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }
}
