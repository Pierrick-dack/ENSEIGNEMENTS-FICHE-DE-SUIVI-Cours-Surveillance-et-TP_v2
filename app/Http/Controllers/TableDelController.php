<?php

namespace App\Http\Controllers;

use App\Models\Delegue;
use Illuminate\Http\Request;

class TableDelController extends Controller {

    public function main() {
        $delegues = $this->getDelegues();

        return view('chef.pages.tables.tabledel', compact('delegues'));
    }

    private function getDelegues() {
        // Récupérez tous les délélgués depuis la base de données
        return Delegue::all();
    }

    public function destroy($id) {

        $delegue = Delegue::find($id);

        if (!$delegue) {
            return redirect()->route('delegues.main')->with('error', 'Délégué non trouvé.');
        }
        $delegue->delete();

        return redirect()->route('delegues.main')->with('success', 'Le délégué a été supprimé avec succès.');
    }
}
