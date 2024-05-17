<?php

namespace App\Http\Controllers;

use App\Models\FicheSurveillance;
use App\Models\Cours;
use Illuminate\Http\Request;

class VoirFicheController extends Controller
{
    public function voirFicheSurvey(){
        $fichesSurvey = $this->getFicheSurvey();
        $codes = Cours::all();
        return view('enseignant.voirfiche', compact('fichesSurvey', 'codes'));
    }
    private function getFicheSurvey()
    {

        return FicheSurveillance::with('surveillants')->get();
    }

}
