<?php

namespace App\Http\Controllers;

use App\Models\FicheSurveillance;
use Illuminate\Http\Request;

class VoirFicheController extends Controller
{
    public function voirFicheSurvey(){
        $fichesSurvey = $this->getFicheSurvey();
        return view('enseignant.voirfiche', compact('fichesSurvey'));
    }
    private function getFicheSurvey()
    {
        // Récupérez toutes les fiches depuis la base de données
        return FicheSurveillance::with('surveillants')->get();
    }

}