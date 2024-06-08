<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SemestreSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $semestre = [
            [
                'numSemestre' => '1',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'numSemestre' => '2',
                'created_at' => now(),
                'updated_at' => now(),
            ]
        ];
        DB::table('semestres')->insert($semestre);
    }
}
