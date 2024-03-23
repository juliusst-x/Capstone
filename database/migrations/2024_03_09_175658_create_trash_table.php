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

        Schema::create('trash', function (Blueprint $table) {
            $table->increments('id');
            $table->geometry('location');
            $table->string('type');
            $table->integer('qty');
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
        Schema::dropIfExists('trash');
    }
};
