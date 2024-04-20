<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Model;

class Delegue extends Authenticatable {

    protected $table = 'delegues';

    protected $fillable = [
        'nameDel',
        'matDel',
        'mdpDel',
    ];

}

