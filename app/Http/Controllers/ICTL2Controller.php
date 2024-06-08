<?php

namespace App\Http\Controllers;

use App\Models\Cours;
use App\Models\Fiche;
use Illuminate\Http\Request;

class ICTL2Controller extends Controller
{
    public function index() {
        $coursSemestre1 = Cours::where('niveau_id', 2)->where('semestre_id', 1)->get();
        $coursSemestre2 = Cours::where('niveau_id', 2)->where('semestre_id', 2)->get();

        return view('chef.pages.pages_niveau.ictl2', compact('coursSemestre1', 'coursSemestre2'));
    }

    public function destroy($id) {

        $coursl2 = Cours::find($id);

        if (!$coursl2) {
            return redirect()->route('ictl2')->with('error', 'Cours non trouvé.');
        }
        $coursl2->delete();

        return redirect()->route('ictl2')->with('success', 'Le cours a été supprimé avec succès.');
    }


}
