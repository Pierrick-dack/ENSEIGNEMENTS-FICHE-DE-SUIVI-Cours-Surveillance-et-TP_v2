<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Fiche;

class AnalyticsController extends Controller {

    public function index() {
        $fiches = $this->getFiches();

        return view('delegue.analytics', compact('fiches'));
    }

    private function getFiches() {
        // Récupérez toutes les fiches depuis la base de données
        return Fiche::all();
    }

    // Supperimer une fiche de suivi dans la base de données
    public function destroy(Fiche $fiche){
        $fiche->delete();

        return redirect()->route('analytics')->with('success', 'La fiche a été supprimée avec succès.');
    }

}
