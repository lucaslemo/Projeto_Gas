<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
        <div class="d-flex align-items-center">
            <img src="{{ Vite::asset('resources/assets/img/logos/MARCA_DAGUA_2.png') }}"
            style="max-height: 40px;">
        </div>
        <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->
    
    <div class="search-bar">
        <form class="search-form d-flex align-items-center" method="POST" action="#">
            <input type="text" name="query" placeholder="Search" title="Enter search keyword">
            <button type="submit" title="Search"><i class="bi bi-search"></i></button>
        </form>
    </div><!-- End Search Bar -->
    
    <nav class="header-nav ms-auto">
        <ul class="d-flex align-items-center">
    
        <li class="nav-item d-block d-lg-none">
            <a class="nav-link nav-icon search-bar-toggle " href="#">
                <i class="bi bi-search"></i>
            </a>
        </li><!-- End Search Icon-->
    
        <li class="nav-item dropdown pe-3">
    
            <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                @if(!is_null(Auth::user()->img_path))
                <img class="border rounded-circle" src="{{ asset('storage/' . Auth::user()->img_path) }}">
                @else
                <img class="border rounded-circle" src="{{ Vite::asset('resources/assets/img/perfis/user.png') }}">
                @endif 
                <span class="d-none d-md-block dropdown-toggle ps-2"><?= $nomeAbreviado; ?></span>
            </a><!-- End Profile Iamge Icon -->
    
            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
                <h6><?= $nomeCompleto; ?></h6>
                <span><?= $tipoUsuario; ?></span>
            </li>
            <li>
                <hr class="dropdown-divider">
            </li>
    
            <li>
                <a class="dropdown-item d-flex align-items-center" href="{{ route('usuario.show', Auth::id()) }}">
                <i class="bi bi-person"></i>
                <span>Meu Perfil</span>
                </a>
            </li>
            <li>
                <hr class="dropdown-divider">
            </li>
    
            <li>
                <div class="dropdown-item d-flex align-items-center justify-content-center">
                    <form action="{{ route('login.destroy', 1) }}"  class="row g-3 needs-validation" method="POST"
                        accept-charset="utf-8" autocomplete="on" enctype="multipart/form-data">
                        @csrf
                        @method('DELETE')
                        <button class="btn btn-sm btn-outline-danger">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-box-arrow-right"></i>
                                Sair
                            </div>
                        </button>
                    </form>
                </div>
            </li>
    
            </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->
    
        </ul>
    </nav><!-- End Icons Navigation -->

</header><!-- End Header -->