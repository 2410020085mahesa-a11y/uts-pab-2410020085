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
    Schema::create('karyawan', function (Blueprint $table) {
        $table->id('id_kar');
        $table->string('nama', 30);
        $table->string('sex', 12);
        $table->string('jabatan', 50);
        $table->string('norek', 15);
        $table->string('upah', 20);
        $table->date('tgl_lahir');
        $table->string('kota_lahir', 30);
        $table->string('alamat', 512);
        $table->date('tgl_masuk');
        $table->date('tgl_keluar')->nullable();
        $table->string('status', 30);
        $table->timestamps();
    });
}

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('karyawans');
    }
};
