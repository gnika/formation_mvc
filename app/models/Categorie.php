<?php

/**
 * Created by PhpStorm.
 * User: Joachim
 * Date: 25/01/2017
 * Time: 10:29
 */
class Categorie extends Model
{
    public function __construct()
    {
        parent::__construct();
        $this->_setTable('categorie');
    }

    public function findById($id){
        return $this->fetchOne($id);
    }

    public function categorieFilm($idFilm, $fetchType=PDO::FETCH_OBJ){
        $sql ='select categorie.id, categorie.nom from categorie  
                inner join films_categs ON categorie.id = films_categs.id_categorie 
                where films_categs.id_film='.$idFilm;

        $statement = $this->_dbh->prepare($sql);
        $statement->execute();
        return $statement->fetchAll($fetchType);
    }


}