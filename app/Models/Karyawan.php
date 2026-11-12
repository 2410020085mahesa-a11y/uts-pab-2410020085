<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Karyawan extends Model
{
    use HasFactory;

    protected $table = 'karyawan';
    protected $primaryKey = 'id_kar';
    protected $fillable = ['nama','sex','jabatan','norek','upah','tgl_lahir',
    'kota_lahir','alamat','tgl_masuk','tgl_keluar','status'];
}
