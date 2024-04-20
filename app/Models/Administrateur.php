<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Administrateur extends Model {
    use Notifiable;

    protected $table = 'chefs';

    protected $fillable = [
        'nomCD',
        'emailCD',
    ];

    protected $hidden = [
        'mdpCD',
    ];
}
