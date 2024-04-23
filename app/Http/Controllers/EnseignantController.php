<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Enseignant;

class EnseignantController extends Controller
{
    public function index(){
        return view('enseignant.index');
    }
}