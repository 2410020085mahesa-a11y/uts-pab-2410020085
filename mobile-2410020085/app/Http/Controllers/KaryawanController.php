<?php

namespace App\Http\Controllers;

use App\Models\Karyawan;
use Illuminate\Http\Request;

class KaryawanController extends Controller
{
    public function index()
    {
        return Karyawan::all();
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama'       => 'required|string|max:30',
            'sex'        => 'required|string|max:12',
            'jabatan'    => 'required|string|max:50',
            'norek'      => 'required|string|max:15',
            'upah'       => 'required|string|max:20',
            'tgl_lahir'  => 'required|date',
            'kota_lahir' => 'required|string|max:30',
            'alamat'     => 'required|string|max:512',
            'tgl_masuk'  => 'required|date',
            'tgl_keluar' => 'nullable|date',
            'status'     => 'required|string|max:30',
        ]);

        return Karyawan::create($request->all());
    }

    public function show($id)
    {
        return Karyawan::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $karyawan = Karyawan::findOrFail($id);
        $karyawan->update($request->all());
        return $karyawan;
    }

    public function destroy($id)
    {
        $karyawan = Karyawan::findOrFail($id);
        $karyawan->delete();
        return response()->noContent();
    }
}