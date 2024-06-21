<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class NiveauController extends Controller
{
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'className' => 'required|string|max:255',
            'classDescription' => 'required|string|max:255',
        ]);

        $classe = Classe::create([
            'name' => $validatedData['className'],
            'description' => $validatedData['classDescription'],
        ]);

        return response()->json(['success' => true, 'class' => $classe]);
    }
}
