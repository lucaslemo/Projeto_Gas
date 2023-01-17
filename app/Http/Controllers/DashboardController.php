<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $mensagem = $request->session()->get('mensagem.dashboard');
        return response(view('dashboard.index')->with('titulo', 'Dashboard')
            ->with('mensagem', $mensagem));
    }

}
