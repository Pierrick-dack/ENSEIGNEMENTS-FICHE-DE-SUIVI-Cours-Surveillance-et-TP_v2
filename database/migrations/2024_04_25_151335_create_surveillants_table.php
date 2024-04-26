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
        // Migration pour la table 'surveillants'
        Schema::create('surveillants', function (Blueprint $table) {
            $table->id();
            $table->foreignId('fiche_surveillance_id')->constrained()->onDelete('cascade');
            $table->string('nom');
            $table->timestamps();
        });

        // Assurez-vous que la table fiche_surveillances existe déjà
        Schema::table('fiche_surveillances', function (Blueprint $table) {

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('surveillants');
    }
};