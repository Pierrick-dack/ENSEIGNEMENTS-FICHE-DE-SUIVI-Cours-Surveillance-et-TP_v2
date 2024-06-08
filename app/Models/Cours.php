<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cours extends Model
{
    use HasFactory;

    protected $fillable = ['codeUE', 'intituleUE', 'niveau_id', 'semestre_id'];

    public function niveau()
    {
        return $this->belongsTo(Niveaux::class, 'niveau_id');
    }

    public function semestre()
    {
        return $this->belongsTo(Semestre::class, 'semestre_id');
    }
}

