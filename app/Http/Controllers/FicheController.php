<?php

namespace App\Http\Controllers;

use App\Models\Fiche;
use App\Models\Cours;
use App\Models\Enseignant;
use Illuminate\Http\Request;
use App\Models\Administrateur;
use App\Http\Controllers\Controller;
use App\Notifications\NouvelleFicheCoursNotification;


class ficheController extends Controller {

    public function enregistrerFiche(Request $request) {
        // Validez les données du formulaire
        $request->validate([
            'semestre' => 'required',
            'date' => 'required',
            'codeCours' => 'required',
            'enseignant' => 'required',
            'heureDebut' => 'required',
            'heureFin' => 'required',
            'salle' => 'required',
            'typeSeance' => 'required',
            'titreSeance' => 'required',
            'contenu' => 'required',
            'confidentialite' => 'accepted',
        ]);

        // Créez une nouvelle instance du modèle Fiche
        $fiche = new Fiche();

        // Attribuez les valeurs des champs du formulaire à l'instance de Fiche
        $fiche->semestre = $request->input('semestre');
        $fiche->date = $request->input('date');
        $fiche->codeCours = $request->input('codeCours');
        $fiche->enseignant = $request->input('enseignant');
        $fiche->heureDebut = $request->input('heureDebut');
        $fiche->heureFin = $request->input('heureFin');
        $fiche->salle = $request->input('salle');
        $fiche->typeSeance = $request->input('typeSeance');
        $fiche->titreSeance = $request->input('titreSeance');
        $fiche->contenu = $request->input('contenu');
        $fiche->confidentialite = true;


        // Sauvegarder les signatures
        // Sauvegarder les signatures
        // $fiche->signatureDelegue = $this->saveSignature(new SignatureDelegueBox(), 'signatureDelegueBox');
        // $fiche->signatureProf = $this->saveSignature(new SignatureProfBox(), 'signatureProfBox');

        // Enregistrez la fiche dans la base de données

        $fiche->save();
        toastr()->success("Sauvegarde Réussie !");

        //$chefId = auth()->user()->id;
        $chefId = 1;

        // Déclenchez la notification
        $chef = Enseignant::find($chefId);

        // Vérifiez si l'administrateur a été trouvé
        if ($chef) {
            $chef->notify(new NouvelleFicheCoursNotification());
        }

        return redirect()->route('analytics');

    }

    public function showForm() {
        $enseignants = Enseignant::all();
        $cours = Cours::all();

        return view('delegue.fiche' , compact('enseignants', 'cours'));
    }

}