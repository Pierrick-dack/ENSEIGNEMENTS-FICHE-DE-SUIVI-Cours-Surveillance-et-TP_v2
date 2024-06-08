<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateDelRequest;
use App\Models\Delegue;
use Illuminate\Http\Request;
use App\Http\Requests\LogDelRequest;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class AuthDelegueController extends Controller {
    public function index() {
        return view('delegue/accueil');
    }

    public function login(LogDelRequest $request) {
        $credentials = $request -> validated();

        $delegue = Delegue::where([
            'emailDel' => $credentials['emailDel'],
        ])->first();

        if ($delegue && Hash::check($credentials['mdpDel'], $delegue -> mdpDel)) {

            $request->session()->regenerate();
            toastr()->success("Connexion réussie !");

            $username = $delegue->nameDel;

            return redirect()->route('accueilDel')->with('username', $username);
        }

        toastr()->error('Identifiants invalides !!');
        return back()->withInput()->withErrors(['matDel' => 'Identifiants invalides']);
    }

    public function store(CreateDelRequest $request) {
        $data = $request->validated();

        // Vérifier si le matricule existe déjà dans la base de données
        $matriculeExiste = Delegue::where('matDel', $data['matDel'])->exists();
        $emailExiste = Delegue::where('emailDel', $data['emailDel'])->exists();

        if ($matriculeExiste || $emailExiste) {
            return redirect()->route('delegues.main')->with('error', 'Le matricule existe déjà.');
        }

        // Créer un nouveau délégué
        $delegue = new Delegue();
        $delegue->nameDel = $data['nameDel'];
        $delegue->matDel = $data['matDel'];
        $delegue->emailDel = $data['emailDel'];
        $delegue->mdpDel = Hash::make($data['mdpDel']);
        $delegue->save();

        // Rediriger vers une page de confirmation ou une autre vue
        return redirect()->route('delegues.main')->with('success', 'Enregistré avec succès.');
    }


    public function update(LogDelRequest $request, $id) {
        $delegue = Delegue::findOrFail($id);
        $data = $request->validated();

        // Si un nouveau mot de passe est fourni, le hashé avant de l'ajouter aux données à mettre à jour
        if (!empty($data['mdpDel'])) {
            $data['mdpDel'] = Hash::make($data['mdpDel']);
        } else {
            // Si aucun nouveau mot de passe n'est fourni, retirez-le des données à mettre à jour
            unset($data['mdpDel']);
        }

        $delegue->update($data);

        return redirect()->route('delegues.main')->with('success', 'Délégué modifié avec succès.');
    }



}
