<?php

namespace App\Http\Controllers;

use App\Models\Enseignant;
use Illuminate\Http\Request;
use App\Http\Requests\LogEnsRequest;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class AuthEnseignantController extends Controller {

    public function login(LogEnsRequest $request) {

        $credentials = $request -> validated();

        $enseignant = Enseignant::where([
            'emailEns' => $credentials['emailEns'],
        ])->first();

        if ($enseignant && Hash::check($credentials['mdpEns'], $enseignant -> mdpEns)) {
            $request->session()->regenerate();
            toastr()->success("Connexion réussie !");

            $username = $enseignant->nomEns;

            return redirect()->route('Dashboard_prof');
        } else {
            toastr()->error('Identifiants invalides !!');
            return back()->withInput()->withErrors(['nomEns' => 'Identifiants invalides']);
        }

    }

    public function store(LogEnsRequest $request) {

        $data = $request -> validated();

        // Vérifier si le matricule existe déjà dans la base de données
        $emailExiste = Enseignant::where('emailEns', $data['emailEns'])->exists();

        if ($emailExiste) {
            return redirect()->route('professeurs.main')->with('error', 'L\'email existe déjà.');
        }

        // Créer un nouveau enseignant
        $enseignant = new Enseignant();
        $enseignant->nomEns = $data['nomEns'];
        $enseignant->emailEns = $data['emailEns'];
        $enseignant->mdpEns = Hash::make($data['mdpEns']);
        // dd($enseignant);
        $enseignant->save();

        // Rediriger vers une page de confirmation ou une autre vue
        return redirect()->route('Dashboard_chef')->with('success', 'L\'enseignant a été enregistré avec succès.');
    }

    public function updateProf (LogEnsRequest $request, $id){
        $enseignant = Enseignant::findOrFail($id);
        $data = $request -> validated();

        if (!empty($data['mdpEns'])) {
            $data['mdpEns'] = Hash::make($data['mdpEns']);
        } else {
            unset($data['mdpEns']);
        }

        $enseignant->update($data);
        return redirect()->route('professeurs.main')->with('success', 'Enseignant modifié avec succès.');
    }
}
