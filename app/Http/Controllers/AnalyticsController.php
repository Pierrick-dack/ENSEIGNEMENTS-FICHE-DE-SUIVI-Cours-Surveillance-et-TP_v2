<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Fiche;
use App\Models\FicheTravauxPratiques;

class AnalyticsController extends Controller {

    public function index() {
        $fiches = Fiche::all();
        $fichesTP = FicheTravauxPratiques::all();

        return view('delegue.analytics', compact('fiches', 'fichesTP'));
    }


    // Supperimer une fiche de suivi dans la base de données
    public function destroy(Fiche $fiche){
        $fiche->delete();

        return redirect()->route('analytics')->with('success', 'La fiche a été supprimée avec succès.');
    }

    public function destroyFicheTP(Fiche $fiche)
    {
        $fiche->delete();

        return redirect()->route('analytics')->with('success', 'La fiche a été supprimée avec succès.');
    }

}
