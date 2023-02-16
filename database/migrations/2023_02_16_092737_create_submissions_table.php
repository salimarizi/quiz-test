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
        Schema::create('submissions', function (Blueprint $table) {
            $table->id();
            // now it's not relatable because there is no authentication feature for now
            $table->unsignedBigInteger('userId')->index();
            $table->unsignedBigInteger('questionId')->index();
            $table->unsignedBigInteger('answerId')->index();
            $table->timestamp('createdAt', 0)->nullable();
            $table->timestamp('updatedAt', 0)->nullable();
            $table->softDeletes('deletedAt');

            $table->foreign('questionId')
                ->references('id')
                ->on('questions')
                ->onDelete('cascade');

            $table->foreign('answerId')
                ->references('id')
                ->on('answers')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('submissions');
    }
};
