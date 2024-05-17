<?php

namespace App\Http\Controllers;

use App\Models\FicheSurveillance;
use Illuminate\Http\Request;
use App\Models\FicheTravauxPratiques;

class TableFichesSurveillancesController extends Controller
{
    public function mainFichesSurveillances()
    {
        $fichesSurvey = $this->getFichesTP();

        return view('chef.pages.tables.tableFicheSurveillances', compact('fichesSurvey'));
    }

    private function getFichesTP()
    {
        // Récupérez toutes les fiches depuis la base de données
        return FicheSurveillance::all();
    }

    public function destroy($id)
    {

        $fichesTP = FicheTravauxPratiques::find($id);

        if (!$fichesTP) {
            return redirect()->route('fiches_surveillances')->with('error', 'Délégué non trouvé.');
        }
        $fichesTP->delete();

        return redirect()->route('fiches_surveillances')->with('success', 'La fiche a été supprimée avec succès.');
    }
}