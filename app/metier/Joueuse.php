<?php
namespace App\metier;

use Illuminate\Support\Facades\Session;
use Illuminate\Database\Eloquent\Model;
use DB;

class Joueuse extends Model {
    protected $table = 'joueuse';
    public $timestamps = false;
    protected $fillable = [
        'idJ',
		'dateCreaJ',
		'login',
		'pwd'
        
    ];
    
    public function login($login, $pwd){
        $connected = false;
        $joueuse = DB::table('joueuse')
                ->select()
                ->where('login_joueuse', '=', $login)
                ->first();
        if($joueuse){
            if($joueuse->pwd_joueuse == $pwd){
                Session::put('id', $joueuse->id_joueuse);
                $connected = true;
            }
        }
        return $connected;
    }
    
    public function logout(){
        Session::put('id', 0);
    }
    
}