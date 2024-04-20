<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CoursSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('cours')->insert([
            [
                'codeUE' => 'INFO101',
                'intituleUE' => 'Introduction à l\'informatique',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'codeUE' => 'MATH202',
                'intituleUE' => 'Algèbre Linéaire',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
}