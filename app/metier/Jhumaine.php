<?php
namespace App\metier;

use Illuminate\Support\Facades\Session;
use Illuminate\Database\Eloquent\Model;
use DB;

class Jhumaine extends Model {
    protected $table = 'jhumaine';
    public $timestamps = false;
    protected $fillable = [
        'idJ',
		'dateCreaJ',
		'couleurJ',
		'nomJH',
		'prenomJH',
		'login',
		'mdpJH'
        
    ];
    
    public function login($login, $pwd){
        $connected = false;
        $jhumaine = DB::table('jhumaine')
                ->select()
                ->where('login', '=', $login)
                ->first();
        if($jhumaine){
            if($jhumaine->pwd_jhumaine == $pwd){
                Session::put('id', $jhumaine->id_jhumaine);
                $connected = true;
            }
        }
        return $connected;
    }
    
    public function logout(){
        Session::put('id', 0);
    }
    
}