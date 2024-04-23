<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Fiche extends Model
{
    protected $fillable = [
        'semestre',
        'date',
        'codeCours',
        'enseignant',
        'heureDebut',
        'heureFin',
        'salle',
        'typeSeance',
        'titreSeance',
        'niveau',
        'contenu',
        'confidentialite',
    ];

    // Définissez les éventuelles relations avec d'autres modèles ici
}