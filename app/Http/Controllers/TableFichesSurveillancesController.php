<?php

namespace App\Http\Controllers;

use App\Models\FicheSurveillance;
use Illuminate\Http\Request;
use App\Models\FicheTravauxPratiques;

class TableFichesSurveillancesController extends Controller
{
    public function mainFichesSurveillances()
    {
        $fichesSurvey = $this->getFichesSurveillance();

        return view('chef.pages.tables.tableFicheSurveillances', compact('fichesSurvey'));
    }

    private function getFichesSurveillance()
    {
        // Récupérez toutes les fiches depuis la base de données
        return FicheSurveillance::all();
    }

    public function destroy($id)
    {

        $fichesSurvey = FicheSurveillance::find($id);

        if (!$fichesSurvey) {
            return redirect()->route('fiches_surveillances')->with('error', 'Délégué non trouvé.');
        }
        $fichesSurvey->delete();

        return redirect()->route('fiches_surveillances')->with('success', 'La fiche a été supprimée avec succès.');
    }
}
