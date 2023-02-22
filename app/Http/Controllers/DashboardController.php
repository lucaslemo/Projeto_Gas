<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Repositories\MainRepository;
use App\Repositories\UserRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function __construct(
        private MainRepository $repository,
        private UserRepository $userRepository
    )
    {
        
    }

    public function index(Request $request)
    {
        $mensagem = $request->session()->get('mensagem.dashboard');

        $qtdVendas = $this->repository->quantidadeVendas();
        $tabelaVendas = $this->repository->tabelaVendas();
        return response(view('dashboard.index')->with('titulo', 'Dashboard')
            ->with('mensagem', $mensagem)
            ->with('userId', Auth::id())
            ->with('qtdVendas', $qtdVendas)
            ->with('tabelaVendas', $tabelaVendas));
    }
}
