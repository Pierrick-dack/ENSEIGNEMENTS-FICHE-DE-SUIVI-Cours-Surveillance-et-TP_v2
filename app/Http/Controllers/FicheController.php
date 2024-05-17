<?php

namespace App\Http\Controllers;

use App\Models\Fiche;
use App\Models\FicheTravauxPratiques;
use App\Models\Cours;
use App\Models\Enseignant;
use App\Models\Niveaux;
use Illuminate\Http\Request;
// use App\Models\Administrateur;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Notification;
use App\Notifications\NouvelleFicheCoursNotification;


class FicheController extends Controller {

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
            'niveau' => 'required',
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
        $fiche->niveau = $request->input('niveau');
        $fiche->contenu = $request->input('contenu');
        $fiche->confidentialite = true;


        // Sauvegarder les signatures
        // Sauvegarder les signatures
        // $fiche->signatureDelegue = $this->saveSignature(new SignatureDelegueBox(), 'signatureDelegueBox');
        // $fiche->signatureProf = $this->saveSignature(new SignatureProfBox(), 'signatureProfBox');

        // Enregistrez la fiche dans la base de données

        $fiche->save();
        toastr()->success("Sauvegarde Réussie !");
        return redirect()->route('analytics');

    }

    public function enregistrerFicheTP(Request $request)
    {
        // Validez les données du formulaire
        $request->validate([
            'titreSeanceTP' => 'required|string|max:255',
            'enseignant' => 'required|string|max:255',
            'codeCours' => 'required|string|max:255',
            'heureDebut' => 'required|date_format:H:i',
            'heureFin' => 'required|date_format:H:i',
            'totalHeures' => 'required|string|max:255',
            'objectifsTP' => 'required|string',
            'materielNecessaire' => 'required|string',
            'procedureTP' => 'required|string',
            'observations' => 'required|string',
            'resultatsAttendus' => 'required|string',
        ]);

        // Créez une nouvelle instance du modèle FicheTP
        $ficheTP = new FicheTravauxPratiques();  // Assurez-vous d'avoir un modèle approprié

        // Attribuez les valeurs des champs du formulaire à l'instance de FicheTP
        $ficheTP->titreSeanceTP = $request->input('titreSeanceTP');
        $ficheTP->enseignant = $request->input('enseignant');
        $ficheTP->codeCours = $request->input('codeCours');
        $ficheTP->heureDebut = $request->input('heureDebut');
        $ficheTP->heureFin = $request->input('heureFin');
        $ficheTP->objectifsTP = $request->input('objectifsTP');
        $ficheTP->materielNecessaire = $request->input('materielNecessaire');
        $ficheTP->procedureTP = $request->input('procedureTP');
        $ficheTP->observations = $request->input('observations');
        $ficheTP->resultatsAttendus = $request->input('resultatsAttendus');

        // Enregistrez la fiche TP dans la base de données
        $ficheTP->save();
        toastr()->success("Fiche TP enregistrée avec succès!");

        // Redirection après enregistrement avec un message de succès
        return redirect()->route('analytics');
    }


    public function showForm() {
        $enseignants = Enseignant::all();
        $cours = Cours::all();
        $niveaux = Niveaux::all();

        return view('delegue.fiche', compact('enseignants', 'cours', 'niveaux'));
    }

    public function showFicheTP()
    {
        $enseignants = Enseignant::all();
        $cours = Cours::all();
        $niveaux = Niveaux::all();

        return view('delegue.fiche_tp', compact('enseignants', 'cours', 'niveaux'));
    }

}