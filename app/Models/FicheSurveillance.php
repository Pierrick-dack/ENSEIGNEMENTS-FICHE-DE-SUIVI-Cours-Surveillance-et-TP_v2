<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FicheSurveillance extends Model
{
    use HasFactory;

    // Liste des champs assignables en masse
    protected $fillable = [
        'chefdesalle', 'salle', 'date', 'session', 'codeCours', 'intituleUE',
        'presence_confirmee'
    ];

    public function surveillants()
    {
        return $this->hasMany(Surveillant::class);
    }


}
class Surveillant extends Model
{
    protected $fillable = ['nom'];

    public function ficheSurveillance()
    {
        return $this->belongsTo(FicheSurveillance::class);
    }

}