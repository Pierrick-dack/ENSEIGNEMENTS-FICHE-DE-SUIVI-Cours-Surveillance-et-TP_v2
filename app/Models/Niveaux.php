<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Niveaux extends Model
{
    protected $table = 'niveaux_etude';

    protected $fillable = [
        'codeNiveau',
        'intituleNiveau',
    ];
    public function cours()
    {
        return $this->hasMany(Cours::class, 'niveau_id');
    }
}
