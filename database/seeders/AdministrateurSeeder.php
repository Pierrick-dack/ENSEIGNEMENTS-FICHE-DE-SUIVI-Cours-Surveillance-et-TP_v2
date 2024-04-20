<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Administrateur;
use Illuminate\Support\Facades\Hash;

class AdministrateurSeeder extends Seeder {

    public function run(): void {

        Administrateur::create([
            'nomCD' => 'Chef',
            'emailCD' => 'chef@gmail.com',
            'mdpCD' => Hash::make('rnbking2001'),
        ]);
    }
}
