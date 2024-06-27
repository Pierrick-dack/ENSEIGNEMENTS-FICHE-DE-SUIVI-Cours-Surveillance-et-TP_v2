<?php

namespace App\Http\Controllers;

use App\Models\Cours;
use Illuminate\Http\Request;

class ICTL3Controller extends Controller
{
    public function index() {
        $coursSemestre1 = Cours::where('niveau_id', 3)->where('semestre_id', 1)->get();
        $coursSemestre2 = Cours::where('niveau_id', 3)->where('semestre_id', 2)->get();

        return view('chef.pages.pages_niveau.ictl3', compact('coursSemestre1', 'coursSemestre2'));
    }

    public function destroy($id) {

        $coursl3 = Cours::find($id);

        if (!$coursl3) {
            return redirect()->route('ictl3')->with('error', 'Cours non trouvé.');
        }
        $coursl3->delete();

        return redirect()->route('ictl3')->with('success', 'Le cours a été supprimé avec succès.');
    }
}
