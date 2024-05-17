<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\FicheTravauxPratiques;

class TableFichesTravauxPratiquesController extends Controller
{
    public function mainFichesTravauxPratiques()
    {
        $fichesTP = $this->getFichesTP();

        return view('chef.pages.tables.tableFicheTravauxPratiques', compact('fichesTP'));
    }

    private function getFichesTP()
    {
        // Récupérez toutes les fiches depuis la base de données
        return FicheTravauxPratiques::all();
    }

    public function destroy($id)
    {

        $fichesTP = FicheTravauxPratiques::find($id);

        if (!$fichesTP) {
            return redirect()->route('fiches_surveillances')->with('error', 'Délégué non trouvé.');
        }
        $fichesTP->delete();

        return redirect()->route('fichescoursl3')->with('success', 'La fiche a été supprimée avec succès.');
    }
}