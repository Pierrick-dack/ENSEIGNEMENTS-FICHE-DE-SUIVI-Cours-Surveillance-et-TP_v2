<?php

namespace App\Http\Controllers;

use App\Models\Cours;
use App\Models\Fiche;
use Illuminate\Http\Request;

class ICTL1Controller extends Controller {

    public function index() {
        $coursSemestre1 = Cours::where('niveau_id', 1)->where('semestre_id', 1)->get();
        $coursSemestre2 = Cours::where('niveau_id', 1)->where('semestre_id', 2)->get();

        return view('chef.pages.pages_niveau.ictl1', compact('coursSemestre1', 'coursSemestre2'));
    }

    public function destroy($id) {

        $coursl1 = Cours::find($id);

        if (!$coursl1) {
            return redirect()->route('ictl1')->with('error', 'Cour non trouvé.');
        }
        $coursl1->delete();

        return redirect()->route('ictl1')->with('success', 'Le cours a été supprimé avec succès.');
    }
}
