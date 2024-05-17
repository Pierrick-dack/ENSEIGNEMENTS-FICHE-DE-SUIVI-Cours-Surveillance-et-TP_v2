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
        Schema::create('fiche_travaux_pratiques', function (Blueprint $table) {
            $table->id();
            $table->string('titreSeanceTP');
            $table->string('enseignant');
            $table->string('codeCours');
            $table->time('heureDebut');
            $table->time('heureFin');
            $table->text('objectifsTP');
            $table->text('materielNecessaire');
            $table->text('procedureTP');
            $table->text('observations')->nullable();
            $table->text('resultatsAttendus');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('fiche_travaux_pratiques');
    }
};