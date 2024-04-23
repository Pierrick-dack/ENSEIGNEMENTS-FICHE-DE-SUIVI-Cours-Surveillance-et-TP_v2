<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class NiveauxSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $niveauxEtude = [
            [
                'codeNiveau' => 'L1',
                'intituleNiveau' => 'Licence 1',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'codeNiveau' => 'L2',
                'intituleNiveau' => 'Licence 2',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'codeNiveau' => 'L3',
                'intituleNiveau' => 'Licence 3',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'codeNiveau' => 'M1',
                'intituleNiveau' => 'Master 1',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'codeNiveau' => 'M2',
                'intituleNiveau' => 'Master 2',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ];

        // Insérer les données dans la table niveaux_etude
        DB::table('niveaux_etude')->insert($niveauxEtude);
    }
}