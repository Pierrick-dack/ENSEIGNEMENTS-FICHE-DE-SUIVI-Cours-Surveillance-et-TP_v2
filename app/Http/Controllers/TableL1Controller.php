<?php

namespace App\Http\Controllers;

use App\Models\Fiche;
use Illuminate\Http\Request;

class TableL1Controller extends Controller
{
    public function mainl1()
    {
        $fichesl1 = $this->getFichesL1();

        return view('chef.pages.tables.tableFicheL1', compact('fichesl1'));
    }

    private function getFichesL1()
    {
        // Récupérez toutes les fiches depuis la base de données
        return Fiche::where('niveau', 1)->get();
    }

    public function destroy($id)
    {

        $fichesl1 = Fiche::find($id);

        if (!$fichesl1) {
            return redirect()->route('fichescoursl1')->with('error', 'Délégué non trouvé.');
        }
        $fichesl1->delete();

        return redirect()->route('fichescoursl1')->with('success', 'La fiche a été supprimée avec succès.');
    }
}
