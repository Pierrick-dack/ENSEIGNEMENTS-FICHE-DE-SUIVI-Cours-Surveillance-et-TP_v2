<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Database\Seeders\CoursSeeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void {
        $this->call(CoursSeeder::class);
        $this->call(DelegueSeeder::class);
        $this->call(NiveauxSeeder::class);
        $this->call(EnseignantSeeder::class);
        $this->call(AdministrateurSeeder::class);
    }
}