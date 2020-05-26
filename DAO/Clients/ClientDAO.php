<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class clientDAO
{

    private $repository;

    function __construct()
    {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }
    
     public function ListAll(UserDTO $obj, $type)
    {
        $query = $this->repository->buildQuery("listclient", array((int) $obj->getIdUser()));
        $this->repository->Execute($query);
    }
    
    public function History(UserDTO $obj, $type)
    {
        $query = $this->repository->buildQuery("history", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }
}