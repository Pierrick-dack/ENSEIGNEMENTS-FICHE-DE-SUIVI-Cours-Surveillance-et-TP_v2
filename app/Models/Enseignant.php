<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Model;

class Enseignant extends Authenticatable {
    use Notifiable;

    protected $table = 'enseignants';

    protected $fillable = [
        'nomEns',
        'emailEns',
        'mdpEns',
    ];

    protected $hidden = [

    ];
}