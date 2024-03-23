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
        Schema::disableForeignKeyConstraints();

        Schema::create('concern_report', function (Blueprint $table) {
            $table->increments('id')->foreign('user.id');
            $table->string('concern');
            $table->string('pict');
            $table->string('desc');
            $table->integer('user_id');
            $table->foreign('user_id')->references('id')->on('user');
        });

        Schema::enableForeignKeyConstraints();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('concern_report');
    }
};
