<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateContractServiceTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contract_service', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('contract_id');
            $table->foreign('contract_id')->on('contracts')->references('id')->onDelete('cascade');
            $table->unsignedBigInteger('service_id');
            $table->foreign('service_id')->on('services')->references('id')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('contract_service');
    }
}
