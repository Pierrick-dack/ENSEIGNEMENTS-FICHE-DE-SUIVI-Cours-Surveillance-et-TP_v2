<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Administrateur;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\LogAdminRequest;
use Illuminate\Support\Facades\Session;


class AuthAdministrateurController extends Controller {
    public function login(LogAdminRequest $request) {
        $credentials = $request->validated();

        $admin = Administrateur::where('emailCD', $credentials['emailCD'])->first();

        if ($admin && Hash::check($credentials['mdpCD'], $admin->mdpCD)) {
            $request->session()->regenerate();
            toastr()->success("Connexion réussie !");

            $username = $admin->nomCD;

            return redirect()->route('Dashboard_chef')->with('username', $username);
            // return redirect()->route('dashboardChef');
        }

        toastr()->error('Identifiants invalides !!');
        return back()->withInput()->withErrors(['emailCD' => 'Identifiants invalides']);
    }

    public function logout(Request $request) {

        $request->session()->invalidate(); // Invalider la session actuelle
        $request->session()->regenerateToken(); // Régénérer le jeton de session
        toastr()->success('Déconnexion réussie !');
        return redirect()->route('welcome'); // Redirection vers la page d'accueil
    }
}
