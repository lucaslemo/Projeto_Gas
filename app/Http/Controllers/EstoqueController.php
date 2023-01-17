<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class EstoqueController extends Controller
{
    public function index()
    {
        return response(view('estoque.index')->with('titulo', 'Estoque'));
    }
}
