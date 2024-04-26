<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('fiche_surveillances', function (Blueprint $table) {
            $table->id();
            $table->string('chefdesalle');
            $table->string('salle');
            $table->date('date');
            $table->string('session');
            $table->string('codeCours');
            $table->string('intituleUE');
            $table->boolean('presence_confirmee')->default(false);
            $table->timestamps();
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('fiche_surveillances');
    }
};