<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function store(Request $request)
    {
        $login = $request->input('login');
        $senha = $request->input('senha');
        if(! Auth::attempt(['login_usuario' => $login, 'password' => $senha, 'status_usuario' => 1])){
            return response()->json('Unauthorized', 401);
        }
        $user = Auth::user();
        $user->tokens()->delete();
        $token = $user->createToken('login');
        return response()->json($token->plainTextToken);
    }
}
