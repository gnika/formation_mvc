<?php

/**
 * Created by PhpStorm.
 * User: Joachim
 * Date: 25/01/2017
 * Time: 10:29
 */
class User extends Model
{
    public function __construct()
    {
        parent::__construct();
        $this->_setTable('user');
    }

    public function login($login, $password){

        $sql = 'select * from ' . $this->_table;
        $sql .= ' where login = ? and password = ?';

        $statement = $this->_dbh->prepare($sql);
        $statement->execute(array($login, md5($password)));

        return $statement->fetch(PDO::FETCH_OBJ);
    }
}