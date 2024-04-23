<?php


use App\Http\Controllers\EnseignantController;
use App\Http\Controllers\TableL3Controller;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FicheController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\SettingsController;
use App\Http\Controllers\TableDelController;
use App\Http\Controllers\AnalyticsController;
use App\Http\Controllers\TableProfController;
use App\Http\Controllers\AuthDelegueController;
use App\Http\Controllers\DashboardProfController;
use App\Http\Controllers\AuthEnseignantController;
use App\Http\Controllers\AuthAdministrateurController;


Route::get('/', function () {
    return view('welcome');
})->name('welcome');

// Routes pour la connexion
Route::get('/signin', function () {
    return view('signin/signindel');
})->name('signin');

Route::get('/signinprof', function () {
    return view('signin/signinprof');
})->name('signinprof');

Route::get('/signinchef', function () {
    return view('signin/signinchef');
})->name('signinchef');

// Routes pour le délégué
Route::post('/delegue', function () {
    return view('delegue/accueil');
})->name('delegue');

// Route::get('/fiche', function () {
//     return view('delegue/fiche');
// })->name('fiche');

Route::get('/accueilDel', function () {
    return view('delegue/accueil');
})->name('accueilDel');

Route::get('contact/delegue', function () {
    return view('');
});

// Routes pour les actions du chef
Route::get('/dashboard', function () {
    return view('chef.index');
})->name('Dashboard_chef');




// Routes pour l'authentification des utilisateurs
Route::post('/delegue/accueil', [AuthDelegueController::class, 'login'])->name('delegue.login');
Route::post('/enseignant/accueil', [AuthEnseignantController::class, 'login'])->name('enseignant.login');
Route::post('/administrateur/accueil', [AuthAdministrateurController::class, 'login'])->name('admin.login');
Route::post('/administrateur/logout', [AuthAdministrateurController::class, 'logout'])->name('admin.logout');

// comptes des identifiants
Route::get('/administrateur/registration', [DashboardProfController::class, 'counterRegister'])->name('counter.register');

// Routes pour les actions sur la fiche de suivi
Route::get('/afficher-formulaire-fiche', [FicheController::class, 'showForm'])->name('afficher-formulaire-fiche');
Route::post('/enregistrer-fiche', [FicheController::class, 'enregistrerFiche'])->name('enregistrer-fiche');
Route::delete('/fiches/{fiche}', [AnalyticsController::class, 'destroy'])->name('fiche.destroy');

// Routes du MenuList
Route::get('/order', [OrderController::class, 'index'])->name('order');
Route::get('/delegue', [AuthDelegueController::class, 'index'])->name('delegue');
Route::get('/settings', [SettingsController::class, 'index'])->name('settings');
Route::get('/analytics', [AnalyticsController::class, 'index'])->name('analytics');

// Route pour afficher les délégués et professeurs
Route::get('/delegues', [TableDelController::class, 'main'])->name('delegues.main');
Route::get('/professeurs', [TableProfController::class, 'main'])->name('professeurs.main');


// Route pour supprimer les délégués et professeurs
Route::delete('/delegues/{delegue}', [TableDelController::class, 'destroy'])->name('delegues.destroy');
Route::delete('/professeurs/{professeur}', [TableProfController::class, 'destroy'])->name('enseignants.destroy');

// Routes pour savegarder les nouveaux profs et délégués
Route::post('/enregistrer-professeur', [AuthEnseignantController::class, 'store'])->name('enregistrer.professeur');
Route::post('/enregistrer-delegue', [AuthDelegueController::class, 'store'])->name('enregistrer.delegue');

// Routes pour les actions de modifications des informations des délégués et professeurs
Route::put('/delegues/{id}', [AuthDelegueController::class, 'update'])->name('delegues.update');
Route::put('/enseignants/{id}', [AuthEnseignantController::class, 'updateProf'])->name('enseignant.update');

// Routes d'accès aux pages
Route::get('/dashboardprof', [EnseignantController::class, 'index'])->name('Dashboard_prof');

// Routes d'accès aux fiches par le chef
Route::get('/fiches_L3', [TableL3Controller::class, 'mainl3'])->name('fichesl3');