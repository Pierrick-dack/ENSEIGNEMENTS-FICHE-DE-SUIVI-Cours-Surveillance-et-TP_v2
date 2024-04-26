<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Enseignant;
use App\Models\Cours;

class EnseignantController extends Controller
{
    public function index(){
        $codes = $this->getCodeUE();
        return view('enseignant.index', compact('codes'));
    }
    private function getCodeUE()
    {
        // Récupérez toutes les fiches depuis la base de données
        return Cours::all();
    }
}