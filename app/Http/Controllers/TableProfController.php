<?php

namespace App\Http\Controllers;

use App\Models\Enseignant;
use Illuminate\Http\Request;

class TableProfController extends Controller {

    public function main() {
        $enseignants = $this->getEnseignants();

        return view('chef.pages.tables.tableprof', compact('enseignants'));
    }

    private function getEnseignants() {
        // Récupérez tous les délélgués depuis la base de données
        return Enseignant::all();
    }

    public function destroy($id) {
        $enseignants = Enseignant::find($id);

        if (!$enseignants) {
            return redirect()->route('professeurs.main')->with('error', 'Professeur non trouvé.');
        }

        $enseignants->delete();

        return redirect()->route('professeurs.main')->with('success', 'Supprimé avec succès.');
    }

}
