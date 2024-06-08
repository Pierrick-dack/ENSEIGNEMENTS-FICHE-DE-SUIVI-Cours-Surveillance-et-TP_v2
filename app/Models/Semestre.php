<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Semestre extends Model
{
    use HasFactory;

    protected $fillable = ['numSemestre'];

    public function cours()
    {
        return $this->hasMany(Cours::class, 'semestre_id');
    }
}
