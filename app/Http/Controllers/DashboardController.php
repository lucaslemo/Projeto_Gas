<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Repositories\MainRepository;
use App\Repositories\MainRepositoryInterface;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function __construct(private MainRepository $repository)
    {
        
    }

    public function index(Request $request)
    {
        $mensagem = $request->session()->get('mensagem.dashboard');
        $tabelaVendas = $this->repository->tabelaVendas();

        return response(view('dashboard.index')->with('titulo', 'Dashboard')
            ->with('mensagem', $mensagem)
            ->with('tabelaVendas', $tabelaVendas));
    }
}
