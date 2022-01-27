<?php

/**
 * Base controller for the application.
 * Add general things in this controller.
 */
class UserController extends Controller
{
    public function inscriptionAction(){
        $login           = $this->_getParam('login');
        $email           = $this->_getParam('email');
        $password     = $this->_getParam('password');

        if($_FILES['image']['name']!='') {
            $titleImg = md5(uniqid(rand(), true));
            $extensions_valides = array('jpg', 'jpeg', 'gif', 'png');
            $extension_upload = strtolower
			(substr(strrchr($_FILES['image']['name'], '.'), 1));
            $titleImg = $titleImg . '.' . $extension_upload;
            Utils::upload('image', 'images/user/' .$titleImg , FALSE, false);
        }else
            $titleImg="default.jpg";

        if($login!='' && $email!='' && $password!=''){
            $userParam = [
                'login' => $login,
                'email' => $email,
                'password' => md5($password),
                'avatar' =>$titleImg,
                'role' => 1
            ];

            $user = new User();
            $this->view->inscription = $user->save($userParam);
        }
    }

    public function deconnexionAction(){

        if($this->_getParam('submit')) {
            unset($_SESSION['user']);
//            unset($_SESSION['panier']);
            $this->view->deconnect = 1;
        }
    }

    public function loginAction(){
        $login           = $this->_getParam('login');
        $password     = $this->_getParam('password');

        if($login!='' && $password!=''){
            $user = new User();
            $loginAct = $user->login($login, $password);

            if($loginAct->id>0){
                $_SESSION['user']['profil'] = $loginAct;
                $this->view->login=1;
            }else
                $this->view->login=false;
        }
    }

    public function panierAction(){
        if($_SESSION['user']['profil']->id=='')
            header('Location: films');

        $this->view->panier = ($_SESSION['user']['panier'])?
            $_SESSION['user']['panier']:array();
    }

    public function pdfAction(){
        $this->view->disableLayout();

        require(ROOT_PATH.'/lib/html2pdf/html2pdf.class.php');
        $this->view->panier = $_SESSION['user']['panier'];
        unset($_SESSION['user']['panier']);
    }
}
