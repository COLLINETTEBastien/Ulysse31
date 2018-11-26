<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/*Route::get('/', function () {
    return view('welcome');
});*/

Route::get('/', function () {
    return view('home');
});

Route::get('/formLogin', function () {
    return view('formLogin');
});

// Afficher le formulaire d'authentification
Route::get('/getLogin', 'JhumaineController@getLogin');

// Authentifie la Joueuse à partir du login et mdp saisis
Route::post('/login', 'JhumaineController@signIn');

// Déloguer la Joueuse
Route::get('/getLogout', 'JhumaineController@signOut');