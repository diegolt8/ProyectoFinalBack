<?php

class SaleDAO
{
    private $repository;

    function __construct()
    {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param UserDTO $obj
     */
    public function Save(SaleDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("savesale", array(
            (int) $obj->getUsuario_id(), (int) $obj->getRol_id(),
            (int) $obj->getFactura_id(), (string) $obj->getSaleDate(),
            (int) $obj->getQuatity(), (int) $obj->getSaleTotal()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param UserDTO $obj
     * @param boolean $type indica si se quiere filtro o no 
     */
    public function ListAll(SaleDTO $obj, $type)
    {

        $query = $this->repository->buildQuery("listsale", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * ejecuta un buscar en la base de datos
     * @param UserDTO $obj
     */
    public function Search(SaleDTO $obj)
    {
        $query = $this->repository->buildQuery("searchsale", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param UserDTO $obj
     */
    public function Update(SaleDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("savesale", array(
            (int) $obj->getId(),
            (int) $obj->getUsuario_id(), (int) $obj->getRol_id(),
            (int) $obj->getFactura_id(), (string) $obj->getSaleDate(),
            (int) $obj->getQuatity(), (int) $obj->getSaleTotal()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param UserDTO $obj
     */
    public function Delete(SaleDTO $obj)
    {
        $query = $this->repository->buildQuerySimply("deletesale", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }
}
