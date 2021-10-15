<?php 

/**
 * Used to define the routes in the system.
 * 
 * A route should be defined with a key matching the URL and an
 * controller#action-to-call method. E.g.:
 * 
 * '/' => 'index#index',
 * '/calendar' => 'calendar#index'
 */
$routes = array(
	'/test' => 'test#index',
	'/' => 'application#index',
	'/add/categorie' => 'application#addcateg',
	'/add/film' => 'application#addfilm',
	'/film' => 'application#film',
	'/categories' => 'application#categories',
	'/categorie-update' => 'application#categorie',
    '/updatecategorie' => 'ajax#categorieupdate',
    '/films' => 'application#films',
    '/inscription' => 'user#inscription',
    '/deconnexion' => 'user#deconnexion',
    '/login' => 'user#login',
    '/panier' => 'user#panier',
    '/ajaxpanier' => 'ajax#ajaxpanier',
    '/searchajaxparcategorie' => 'ajax#searchajaxparcategorie',
    '/pdf' => 'user#pdf',
    '/' => 'application#index',
);
