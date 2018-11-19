<?php

namespace App\Http\Controllers;
use Request;
use App\Metier\Jhumaine;

class JhumaineController extends Controller {
    
    public function getLogin(){
        $erreur = "";
        return view ('formLogin', compact('erreur'));
    }
    
    public function signIn(){
        $login = Request::input('login');
        $pwd = Request::input('pwd');
        $uneJoueuse = new Jhumaine();
        $connected = $uneJoueuse->login($login, $pwd);
        if($connected){
            return view('home');
        }
        else{
            $erreur = "Login ou mot de passe inconnu !";
            return view('formLogin', compact('erreur'));
        }
    }
    
    public function signOut(){
        $unVisiteur = new Jhumaine();
        $unVisiteur->logout();
        return view('home');
    }
}