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
        Schema::create('questions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('quizId')->index();
            $table->text('content');
            $table->boolean('isMandatory');
            $table->integer('order');
            $table->timestamp('createdAt', 0)->nullable();
            $table->timestamp('updatedAt', 0)->nullable();
            $table->softDeletes('deletedAt');

            $table->foreign('quizId')
                ->references('id')
                ->on('quizzes')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('questions');
    }
};
