<?php

namespace App\Http\Controllers;

use App\Models\Fiche;
use Illuminate\Http\Request;

class TableL2Controller extends Controller
{
    public function mainl2()
    {
        $fichesl2 = $this->getFichesL2();

        return view('chef.pages.tables.tableFicheL2', compact('fichesl2'));
    }

    private function getFichesL2()
    {
        // Récupérez toutes les fiches depuis la base de données
        return Fiche::where('niveau', 2)->get();
    }

    public function destroy($id)
    {

        $fichesl2 = Fiche::find($id);

        if (!$fichesl2) {
            return redirect()->route('fichescoursl2')->with('error', 'Délégué non trouvé.');
        }
        $fichesl2->delete();

        return redirect()->route('fichescoursl2')->with('success', 'La fiche a été supprimée avec succès.');
    }
}