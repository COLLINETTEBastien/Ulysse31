<?php

namespace App\Http\Controllers;
use Request;
use App\Metier\Joueuse;

class JoueuseController extends Controller {
    
    public function getLogin(){
        $erreur = "";
        return view ('formLogin', compact('erreur'));
    }
    
    public function signIn(){
        $login = Request::input('login');
        $pwd = Request::input('pwd');
        $unJoueuse = new Joueuse();
        $connected = $unJoueuse->login($login, $pwd);
        if($connected){
            return view('home');
        }
        else{
            $erreur = "Login ou mot de passe inconnu !";
            return view('formLogin', compact('erreur'));
        }
    }
    
    public function signOut(){
        $unVisiteur = new Joueuse();
        $unVisiteur->logout();
        return view('home');
    }
}