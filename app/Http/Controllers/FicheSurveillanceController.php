<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\FicheSurveillance;
use App\Models\Cours;
use Barryvdh\DomPDF\Facade\Pdf;


class FicheSurveillanceController extends Controller
{

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'chefdesalle' => 'required',
            'salle' => 'required',
            'date' => 'required|date',
            'session' => 'required',
            'codeCours' => 'required',
            'intituleUE' => 'required',
            'name' => 'array|required',
            'name.*' => 'required|string',
            //'signature' => 'required|string', // validation de la signature en tant que string base64
        ]);

        $fiche = FicheSurveillance::create($validatedData);
        // $fiche->signature = $this->saveBase64Image($validatedData['signature']); // Si nécessaire

        // Enregistrement des surveillants
        foreach ($request->name as $nom) {
            $fiche->surveillants()->create(['nom' => $nom]);
        }

        $fiche->save();

        // return response()->json(['success' => 'Fiche créée avec succès.']);
        return redirect()->route('VoirFicheSurvey')->with('success', 'Fiche de surveillance créée avec succès');
    }

    public function destroy($id)
    {

        $fichesSurveillance = FicheSurveillance::find($id);

        if (!$fichesSurveillance) {
            return redirect()->route('VoirFicheSurvey')->with('error', 'Fiche non trouvée.');
        }
        $fichesSurveillance->delete();

        return redirect()->route('VoirFicheSurvey')->with('success', 'La fiche a été supprimée avec succès.');
    }


    public function getFiche($id)
    {
        $fiche = FicheSurveillance::with('surveillants')->findOrFail($id);
        return response()->json($fiche);
    }

    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'chefdesalle' => 'required|string',
            'salle' => 'required|string',
            'date' => 'required|date',
            'session' => 'required|string',
            'codeCours' => 'required|string',
            'intituleUE' => 'required|string',
            'name' => 'array|required',
            'name.*' => 'required|string',

        ]);

        $fiches = FicheSurveillance::findOrFail($id);
        $fiches->update($validatedData);
        $fiches->surveillants()->delete();

        // Ajouter ou mettre à jour les surveillants
        foreach ($validatedData['name'] as $name) {
            $fiches->surveillants()->create(['nom' => $name]);
        }

        // Sauvegarder la signature si elle est présente
        if (isset($validatedData['signature'])) {
            $fiches->signature = $validatedData['signature'];
            $fiches->save();
        }

        return redirect()->route('VoirFicheSurvey')->with('success', 'Fiche mise à jour avec succès');
    }




}
