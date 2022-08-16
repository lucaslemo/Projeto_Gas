<?php require __DIR__ . '/../inicio-html.php'; ?>
<main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
              <a href="/login" class="logo d-flex align-items-center w-auto">
                <img src="assets/img/logos/MARCA_DAGUA_2.png" alt="">
              </a>
                <!-- <a href="index.html" class="logo d-flex align-items-center w-auto">
                  <img src="assets/img/logos/SIMBOLO.png" alt="">
                  <span class="d-none d-lg-block">PoliGás</span>
                </a> -->
              </div>

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Login</h5>
                  </div>

                  <form class="row g-3 needs-validation" action="/valida-login" method="post" accept-charset="utf-8" autocomplete="on" enctype="multipart/form-data">

                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Nome de Usuário</label>
                      <div class="input-group has-validation">
                        <span class="input-group-text" id="inputGroupPrepend">@</span>
                        <input type="text" name="username" class="form-control" id="yourUsername" required>
                        <div class="invalid-feedback">Digite o seu nome de Usuário!</div>
                      </div>
                    </div>

                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Senha</label>
                      <input type="password" name="password" class="form-control" id="yourPassword" required>
                      <div class="invalid-feedback">Digite sua senha!</div>
                    </div>

                    <div class="col-12">
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="remember" value="true" id="rememberMe">
                        <label class="form-check-label" for="rememberMe">Manter-me Conectado</label>
                      </div>
                    </div>
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">Entrar</button>
                    </div>
                    <div class="col-12">
                      <p class="small mb-0">Esqueceu sua senha? <a href="pages-register.html">Redefinir Senha</a></p>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>

      </section>

    </div>
</main><!-- End #main -->
<?php require __DIR__ . '/../fim-html.php'; ?>