<?php


class ProductDAO
{
    private $repository;

    function __construct()
    {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }


    public function Save(ProductDTO $obj)
    {
        $query = $this->repository->buildQuerySimply('saveproduct', array(
            (int) $obj->getTipoProducto_id(), (int) $obj->getInventario_id(),
            (int) $obj->getEstante_id(), (int) $obj->getProveedor_id()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    public function ListAll(ProductDTO $obj, $type)
    {
        $query = $this->repository->buildQuery('listproduct', array((int) $obj->getId()));
        $this->repository->Execute($query);
    }


    public function Search(ProductDTO $obj)
    {
        $query = $this->repository->buildQuery('searchproduct', array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    public function Update(ProductDTO $obj)
    {
        $query = $this->repository->buildQuerySimply('updateproduct', array(
            (int) $obj->getId(),
            (int) $obj->getTipoProducto_id(), (int) $obj->getInventario_id(),
            (int) $obj->getEstante_id(), (int) $obj->getProveedor_id()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    public function Delete(ProductDTO $obj)
    {
        $query = $this->repository->buildQuerySimply('searchproduct', array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }
}
