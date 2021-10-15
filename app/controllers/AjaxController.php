<?php

/**
 * Base controller for the application.
 * Add general things in this controller.
 */
class AjaxController extends Controller
{
    public function categorieupdateAction(){
        $nom  = $_GET['cat'];
        $id     = $_GET['id'];
        $alias = Utils::generateSlug($nom);

        $params = [
            'id' => $id,
            'nom' => $nom,
            'slug' => $alias
        ];
        $cat = new Categorie();
        $return = $cat->save($params);
        echo $return;
        die();
    }

    public function searchajaxparcategorieAction(){
        $modelFilm = new Film();
        $categFilm = new Categorie();
        $searchCateg = $this->_getParam('categ', array());

        $films = $modelFilm->searchByCategorie($searchCateg);
        $categs=[];
        foreach($films as $film){
            $categs[$film->id] = $categFilm->categorieFilm($film->id);
        }

        $this->view->films = $films;
        $this->view->categs = $categs;
        $this->view->allCateg = $categFilm->fetchAll('nom asc');
        $this->view->disableLayout();
    }


    public function ajaxpanierAction(){
        $add = $this->_getParam('add');
        $remove = $this->_getParam('remove');

        $modelFilm = new Film();
        $film = $modelFilm->fetchOne(($add)?$add:$remove);

        $quantity = (isset($_SESSION['user']['panier'][$film->id]))?
            $_SESSION['user']['panier'][$film->id]['quantite']:0;

        if($add!='')
            $_SESSION['user']['panier'][$film->id] = [
                'quantite'  => $quantity+1,
                'film'      => $film
            ];

        if($remove!='')
            $_SESSION['user']['panier'][$film->id] = [
                'quantite'  => $quantity-1,
                'film'      => $film
            ];

        if($_SESSION['user']['panier'][$film->id]['quantite']==0)
            unset($_SESSION['user']['panier'][$film->id]);
        die();
    }
}
