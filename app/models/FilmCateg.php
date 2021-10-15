<?php

/**
 * Created by PhpStorm.
 * User: Joachim
 * Date: 25/01/2017
 * Time: 10:29
 */
class FilmCateg extends Model
{
    public function __construct()
    {
        parent::__construct();
        $this->_setTable('films_categs');
    }

    public function saveCateg($params){

        $this->_setTable('films_categs');
        $this->save($params);
    }

    public function deleteCategFilm($id){
        $sql ='delete from films_categs  where id_film='.$id;

        $statement = $this->_dbh->prepare($sql);
        $statement->execute();

    }
}