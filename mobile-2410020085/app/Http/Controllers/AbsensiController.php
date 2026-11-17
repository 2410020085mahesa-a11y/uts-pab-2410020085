<?php

namespace App\Http\Controllers;

use App\Models\Absensi;
use Illuminate\Http\Request;

class AbsensiController extends Controller
{
    public function index()
    {
        return Absensi::all();
    }

    public function store(Request $request)
    {
        $request->validate([
            'id_kar'   => 'required|integer',
            'nama_kar' => 'required|string',
            'absen'    => 'required|date',
        ]);

        return Absensi::create($request->all());
    }

    public function show($id)
    {
        return Absensi::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $absensi = Absensi::findOrFail($id);
        $absensi->update($request->all());
        return $absensi;
    }

    public function destroy($id)
    {
        $absensi = Absensi::findOrFail($id);
        $absensi->delete();
        return response()->noContent();
    }
}