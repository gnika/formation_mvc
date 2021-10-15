<?php

/**
 * Created by PhpStorm.
 * User: Joachim
 * Date: 25/01/2017
 * Time: 10:29
 */
class Commentaire extends Model
{
    public function __construct()
    {
        parent::__construct();
        $this->_setTable('commentaire');
    }

    public function searchByFilm($idFilm, $fetchType=PDO::FETCH_OBJ){
        $sql ='select * from commentaire com  
                inner join user ON user.id = com.id_user where com.id_film='.$idFilm;

        $statement = $this->_dbh->prepare($sql);
        $statement->execute();
        return $statement->fetchAll($fetchType);
    }


}