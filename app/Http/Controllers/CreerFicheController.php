<?php

namespace App\Http\Controllers;

use App\Models\Cours;
use Illuminate\Http\Request;

class CreerFicheController extends Controller
{
    public function PageCreerFiche() {
        $codes = $this->getCodeUE();
        return view('enseignant.creer_fiche', compact('codes'));
    }
    private function getCodeUE()
    {
        // Récupérez toutes les fiches depuis la base de données
        return Cours::all();
    }
}
