<x-layout title="{{ $titulo }}">
    <x-header nomeCompleto="Lucas Lemos" nomeAbreviado="L. Lemos" tipoUsuario="Admin"></x-header>
    <x-aside></x-aside>
    <main id="main" class="main">
        <div class="row d-flex justify-content-start mb-3">

            <!-- Modal -->
            <div class="modal fade" id="profile_image_modal" data-bs-backdrop="static" data-bs-keyboard="false"
            tabindex="-1" aria-labelledby="profile_image_modalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12 h-auto w-auto">
                                    <img id="profileImageCrop" alt="Editar Imagem de Perfil" style="max-width: 100%; display: block;">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Confirmar</button>
                    </div>
                </div>
                </div>
            </div>
            
            <div class="col-md-auto pagetitle align-self-center mb-0 py-3">
                <h1>Perfil</h1>
                <nav>
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="/dashboard">Usuário</a></li>
                    <li class="breadcrumb-item active">Perfil</li>
                </ol>
                </nav>
            </div> {{-- End Page Title --}}
        
            {{-- Mensagem login --}}
            @isset($mensagem)
            <div class="col align-self-center">
                <div class="alert alert-success alert-dismissible fade show mb-0 py-3" role="alert">
                    {!! $mensagem !!}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>
            @endisset
        
        </div>
        <section class="section dashboard">
            <div class="col-xl-8">
                <div class="card">
                    <div class="card-body pt-3">
                    <!-- Bordered Tabs -->
                    <ul class="nav nav-tabs nav-tabs-bordered">
                        <li class="nav-item">
                            <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-edit">Editar Perfil</button>
                        </li>
      
                        <li class="nav-item">
                            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#perfil_mudar_senha">Mudar Senha</button>
                        </li>
      
                    </ul>
                    <div class="tab-content pt-2">
                      <div class="tab-pane fade show active profile-edit pt-3" id="profile-edit">
                        <!-- Profile Edit Form -->
                        <form action="{{ route('usuario.update', Auth::id()) }}" class="row g-3 needs-validation" method="POST"
                        accept-charset="utf-8" autocomplete="on" enctype="multipart/form-data">
                          @method('PUT')
                          @csrf
                          <div class="row mb-3">
                            <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Imagem de Perfil</label>
                            <div class="col-md-auto col-lg-auto">
                                <div>
                                    @if(!is_null(Auth::user()->img_path))
                                    <img id="profileImage" class="img-thumbnail"
                                    src="{{ asset('storage/' . Auth::user()->img_path) }}"alt="Imagem de Perfil"
                                    style="max-width: 100%; display: block; width: 120px; height: 120px;
                                    object-fit: cover; object-position: 25% 25%;">
                                    @else
                                    <img id="profileImage" class="img-thumbnail"
                                    src="{{ Vite::asset('resources/assets/img/perfis/user.png') }}"alt="Imagem de Perfil"
                                    style="max-width: 100%; display: block; width: 120px; height: 120px;
                                    object-fit: cover; object-position: 25% 25%;">
                                    @endif 
                                    <input id="imageUpload" type="file" name="foto_perfil" placeholder="Photo"
                                    accept="image/*" style="display: none;">
                                </div>
                                <div class="pt-2 d-flex justify-content-center">
                                <a id="profile_upload_img" class="btn btn-primary btn-sm m-1" title="Carregar nova imagem de Perfil"><i class="bi bi-upload"></i></a>

                                @if(!is_null(Auth::user()->img_path))
                                <a class="btn btn-danger btn-sm m-1" title="Remover minha imagem de Perfil"><i class="bi bi-trash"></i></a>
                                @endif 

                                </div>
                            </div>
                          </div>
      
                          <div class="row mb-3">
                            <label for="nome_completo" class="col-md-4 col-lg-3 col-form-label">Full Name</label>
                            <div class="col-md-8 col-lg-9">
                              <input name="nome_completo" type="text" class="form-control" id="nome_completo" value="Kevin Anderson">
                            </div>
                          </div>

                          <div class="text-center">
                            <button type="submit" class="btn btn-primary">Salvar Mudanças</button>
                          </div>
                        </form><!-- End Profile Edit Form -->
                      </div>
                            <div class="tab-pane fade pt-3" id="perfil_mudar_senha">
                            <!-- Change Password Form -->
                                <form>
                                    <div class="row mb-3">
                                        <label for="nova_senha" class="col-md-4 col-lg-3 col-form-label">Nova Senha</label>
                                        <div class="col-md-8 col-lg-9">
                                        <input name="nova_senha" type="password" class="form-control" id="nova_senha">
                                        </div>
                                    </div>
                
                                    <div class="row mb-3">
                                        <label for="confirma_senha" class="col-md-4 col-lg-3 col-form-label">Confirme a Senha</label>
                                        <div class="col-md-8 col-lg-9">
                                        <input name="confirma_senha" type="password" class="form-control" id="confirma_senha" required>
                                        </div>
                                    </div>
                
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary">Mudar Senha</button>
                                    </div>
                                </form><!-- End Change Password Form -->
                            </div>
                        </div><!-- End Bordered Tabs -->
                    </div>
                </div>
            </div>
        </section>
    </main>
    <x-scripts></x-scripts>
    <script type="application/javascript">
        $("#profile_upload_img").click(function(e) {
            $("#imageUpload").click();
        });

        function modalInsetImage( uploader ) {
            if ( uploader.files && uploader.files[0] ){
                $('#profileImageCrop').prop('src', 
                    window.URL.createObjectURL(uploader.files[0]) );
            }
            $("#profile_image_modal").modal('show');
            const image = document.getElementById('profileImageCrop');
            if (typeof cropper != "undefined"){
                cropper.replace(image.URL);
            } else {
                const cropper = new Cropper(image, {
                    aspectRatio: 1 / 1,
                    viewMode: 3,
                });
            }
        }

        function fasterPreview( uploader ) {
            if ( uploader.files && uploader.files[0] ){
                $('#profileImage').attr('src', 
                    window.URL.createObjectURL(uploader.files[0]) );
            }
        }

        $("#imageUpload").change(function(){
            // modalInsetImage( this );
            fasterPreview( this );
        });
    </script>
</x-layout>