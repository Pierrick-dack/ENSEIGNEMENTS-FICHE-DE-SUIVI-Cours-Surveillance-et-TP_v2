<?php

namespace App\Http\Controllers;

use App\Models\Fiche;
use Illuminate\Http\Request;

class TableL3Controller extends Controller
{
    public function mainl3()
    {
        $fichesl3 = $this->getFichesL3();

        return view('chef.pages.tables.tableFicheL3', compact('fichesl3'));
    }

    private function getFichesL3()
    {
        // Récupérez toutes les fiches depuis la base de données
        return Fiche::where('niveau', 3)->get();
    }

    public function destroy($id)
    {

        $fichesl3 = Fiche::find($id);

        if (!$fichesl3) {
            return redirect()->route('fichescoursl3')->with('error', 'Délégué non trouvé.');
        }
        $fichesl3->delete();

        return redirect()->route('fichescoursl3')->with('success', 'La fiche a été supprimée avec succès.');
    }
}