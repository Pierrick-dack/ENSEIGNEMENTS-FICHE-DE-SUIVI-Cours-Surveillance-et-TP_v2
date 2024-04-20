<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Enseignant;
use Illuminate\Support\Facades\Hash;

class EnseignantSeeder extends Seeder {

    public function run(): void {
        Enseignant::create([
            'nomEns' => 'test',
            'emailEns' => 'test@gmail.com',
            'mdpEns' => Hash::make('test2001'),
        ]);
    }
}
