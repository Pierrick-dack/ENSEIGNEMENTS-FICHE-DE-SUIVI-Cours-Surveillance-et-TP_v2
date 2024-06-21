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
        Schema::create('cours', function (Blueprint $table) {
            $table->id();
            $table->string('codeUE');
            $table->string('intituleUE');
            $table->string('enseignant');
            $table->foreignId('niveau_id')->constrained('niveaux_etude')->onDelete('cascade')->onUpdate('cascade');
            $table->foreignId('semestre_id')->constrained('semestres')->onDelete('cascade')->onUpdate('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cours');
    }
};
