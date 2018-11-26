<?php
namespace App\metier;

use Illuminate\Support\Facades\Session;
use Illuminate\Database\Eloquent\Model;
use DB;

class Jhumaine extends Model {
    protected $table = 'jhumaine';
    public $timestamps = false;
    protected $fillable = [
        'IDJ',
        'dateCreaJ',
        'couleurJ',
        'nomJH',
        'prenomJH',
        'login',
        'MDPJH'
        
    ];
    
    public function login($login, $pwd){
        $connected = false;
        $jhumaine = DB::table('jhumaine')
                ->select()
                ->where('login', '=', $login)
                ->first();
        if($jhumaine){
            if($jhumaine->MDPJH == $pwd){
                Session::put('id', $jhumaine->IDJ);
                $connected = true;
            }
        }
        return $connected;
    }
    
    public function logout(){
        Session::put('id', 0);
    }
    
}