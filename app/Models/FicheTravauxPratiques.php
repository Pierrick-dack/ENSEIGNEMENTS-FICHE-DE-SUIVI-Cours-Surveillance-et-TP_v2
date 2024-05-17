<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FicheTravauxPratiques extends Model
{
    protected $fillable = [
        'titreSeanceTP',
        'enseignant',
        'codeCours',
        'heureDebut',
        'heureFin',
        'objectifsTP',
        'materielNecessaire',
        'procedureTP',
        'observations',
        'resultatsAttendus',
    ];
}