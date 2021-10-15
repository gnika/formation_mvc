<?php

/**
 * Created by PhpStorm.
 * User: Joachim
 * Date: 25/01/2017
 * Time: 10:29
 */
class Film extends Model
{
    public function __construct()
    {
        parent::__construct();
        $this->_setTable('film');
    }

    public function searchByTitre($title)
    {
        $sql = 'select * from ' . $this->_table;
        $sql .= ' where titre like  ? ';

        $statement = $this->_dbh->prepare($sql);
        $statement->execute(array('%'.$title. '%'));

        return $statement->fetchAll(PDO::FETCH_OBJ);
    }

    public function searchByCategorie(array $categ)
    {
        $where='';
        if(count($categ)>0){
            foreach($categ as $key=>$categs)
                $where.=' inner join films_categs fc'.$key.' on
                 ( fc'.$key.'.id_film = film.id and fc'.$key.'.id_categorie ='.$categs.') ';
        }
echo $where;
        $sql = 'select ' . $this->_table.'.id,
        ' . $this->_table.'.image,
        ' . $this->_table.'.titre,
        ' . $this->_table.'.prix,
         ' . $this->_table.'.date_sortie,
          ' . $this->_table.'.description 
         from ' . $this->_table;
        $sql .= ' '.$where;

        $statement = $this->_dbh->prepare($sql);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_OBJ);
    }
}