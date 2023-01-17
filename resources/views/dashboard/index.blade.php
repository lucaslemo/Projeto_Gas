<x-layout title="{{ $titulo }}">
  <x-header nomeCompleto="Lucas Lemos" nomeAbreviado="L. Lemos" tipoUsuario="Admin"></x-header>
  <x-aside></x-aside>

  <main id="main" class="main">
    <div class="row d-flex justify-content-start mb-3">
    
      <div class="col-md-auto pagetitle align-self-center mb-0 py-3">
        <h1>Dashboard</h1>
        <nav>
          <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a href="/dashboard">Home</a></li>
            <li class="breadcrumb-item active">Dashboard</li>
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
          <div class="row">
    
            <!-- Left side columns -->
            <div class="col-lg-8">
              <div class="row">
    
                <!-- Sales Card -->
                <div class="col-xxl-4 col-md-6">
                  <div class="card info-card sales-card">
    
                    <div class="filter">
                      <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                      <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                        <li class="dropdown-header text-start">
                          <h6>Filtro</h6>
                        </li>
    
                        <li><a class="dropdown-item" href="#">Hoje</a></li>
                        <li><a class="dropdown-item" href="#">Esse Mês</a></li>
                        <li><a class="dropdown-item" href="#">Esse Ano</a></li>
                      </ul>
                    </div>
    
                    <div class="card-body">
                      <h5 class="card-title">Vendas <span>| Hoje</span></h5>
    
                      <div class="d-flex align-items-center">
                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                          <i class="bi bi-cart"></i>
                        </div>
                        <div class="ps-3">
                          <h6>145</h6>
                          <span class="text-success small pt-1 fw-bold">+12%</span>
    
                        </div>
                      </div>
                    </div>
    
                  </div>
                </div><!-- End Sales Card -->
    
                <!-- Revenue Card -->
                <div class="col-xxl-4 col-md-6">
                  <div class="card info-card revenue-card">
    
                    <div class="filter">
                      <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                      <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                        <li class="dropdown-header text-start">
                          <h6>Filtro</h6>
                        </li>
    
                        <li><a class="dropdown-item" href="#">Hoje</a></li>
                        <li><a class="dropdown-item" href="#">Esse Mês</a></li>
                        <li><a class="dropdown-item" href="#">Esse Ano</a></li>
                      </ul>
                    </div>
    
                    <div class="card-body">
                      <h5 class="card-title">Receita <span>| Esse Mês</span></h5>
    
                      <div class="d-flex align-items-center">
                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                          <i class="bi bi-currency-dollar"></i>
                        </div>
                        <div class="ps-3">
                          <h6>$3,264</h6>
                          <span class="text-success small pt-1 fw-bold">+8%</span>
    
                        </div>
                      </div>
                    </div>
    
                  </div>
                </div><!-- End Revenue Card -->
    
                <!-- Customers Card -->
                <div class="col-xxl-4 col-xl-12">
    
                  <div class="card info-card customers-card">
    
                    <div class="filter">
                      <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                      <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                        <li class="dropdown-header text-start">
                          <h6>Filtro</h6>
                        </li>
    
                        <li><a class="dropdown-item" href="#">Hoje</a></li>
                        <li><a class="dropdown-item" href="#">Esse Mês</a></li>
                        <li><a class="dropdown-item" href="#">Esse Ano</a></li>
                      </ul>
                    </div>
    
                    <div class="card-body">
                      <h5 class="card-title">Estoque <span>| Esse Mês</span></h5>
    
                      <div class="d-flex align-items-center">
                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                          <i class="bi bi-currency-dollar"></i>
                        </div>
                        <div class="ps-3">
                          <h6>$6,264</h6>
                          <span class="text-danger small pt-1 fw-bold">+12%</span>
    
                        </div>
                      </div>
    
                    </div>
                  </div>
    
                </div><!-- End Customers Card -->
    
                <!-- Reports -->
                <div class="col-12">
                  <div class="card">
    
                    <div class="filter">
                      <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                      <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                        <li class="dropdown-header text-start">
                          <h6>Filtro</h6>
                        </li>
    
                        <li><a class="dropdown-item" href="#">Hoje</a></li>
                        <li><a class="dropdown-item" href="#">Esse Mês</a></li>
                        <li><a class="dropdown-item" href="#">Esse Ano</a></li>
                      </ul>
                    </div>
    
                    <div class="card-body">
                      <h5 class="card-title">Relatório <span>/Hoje</span></h5>
                      <!-- Line Chart -->
                      <div id="reportsChart"></div>
                    </div>
    
                  </div>
                </div><!-- End Reports -->
    
                <!-- Recent Sales -->
                <div class="col-12">
                  <div class="card recent-sales overflow-auto">
    
                    <div class="filter">
                      <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                      <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                        <li class="dropdown-header text-start">
                          <h6>Filtro</h6>
                        </li>
    
                        <li><a class="dropdown-item" href="#">Hoje</a></li>
                        <li><a class="dropdown-item" href="#">Esse Mês</a></li>
                        <li><a class="dropdown-item" href="#">Esse Ano</a></li>
                      </ul>
                    </div>
    
                    <div class="card-body">
                      <h5 class="card-title">Vendas Recentes <span>| Hoje</span></h5>
    
                      <table class="table table-borderless datatable">
                        <thead>
                          <tr>
                            <th scope="col">#Ordem</th>
                            <th scope="col">Usuário</th>
                            <th scope="col">Produto</th>
                            <th scope="col">Valor</th>
                            <th scope="col">Status</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <th scope="row"><a href="#">#2457</a></th>
                            <td>Brandon Jacob</td>
                            <td><a href="#" class="text-primary">At praesentium minu</a></td>
                            <td>$64</td>
                            <td><span class="badge bg-success">Approved</span></td>
                          </tr>
                          <tr>
                            <th scope="row"><a href="#">#2147</a></th>
                            <td>Bridie Kessler</td>
                            <td><a href="#" class="text-primary">Blanditiis dolor omnis similique</a></td>
                            <td>$47</td>
                            <td><span class="badge bg-warning">Pending</span></td>
                          </tr>
                          <tr>
                            <th scope="row"><a href="#">#2049</a></th>
                            <td>Ashleigh Langosh</td>
                            <td><a href="#" class="text-primary">At recusandae consectetur</a></td>
                            <td>$147</td>
                            <td><span class="badge bg-success">Approved</span></td>
                          </tr>
                          <tr>
                            <th scope="row"><a href="#">#2644</a></th>
                            <td>Angus Grady</td>
                            <td><a href="#" class="text-primar">Ut voluptatem id earum et</a></td>
                            <td>$67</td>
                            <td><span class="badge bg-danger">Rejected</span></td>
                          </tr>
                          <tr>
                            <th scope="row"><a href="#">#2644</a></th>
                            <td>Raheem Lehner</td>
                            <td><a href="#" class="text-primary">Sunt similique distinctio</a></td>
                            <td>$165</td>
                            <td><span class="badge bg-success">Approved</span></td>
                          </tr>
                        </tbody>
                      </table>
    
                    </div>
    
                  </div>
                </div><!-- End Recent Sales -->
    
              </div>
            </div><!-- End Left side columns -->
    
            <!-- Right side columns -->
            <div class="col-lg-4">
    
              <!-- Recent Activity -->
              <div class="card">
                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filtro</h6>
                    </li>
    
                    <li><a class="dropdown-item" href="#">Hoje</a></li>
                    <li><a class="dropdown-item" href="#">Esse Mês</a></li>
                    <li><a class="dropdown-item" href="#">Esse Ano</a></li>
                  </ul>
                </div>
    
                <div class="card-body">
                  <h5 class="card-title">Atividade Recente <span>| Hoje</span></h5>
    
                  <div class="activity">
    
                    <div class="activity-item d-flex">
                      <div class="activite-label">32 min</div>
                      <i class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
                      <div class="activity-content">
                        Quia quae rerum <a href="#" class="fw-bold text-dark">explicabo officiis</a> beatae
                      </div>
                    </div><!-- End activity item-->
    
                    <div class="activity-item d-flex">
                      <div class="activite-label">56 min</div>
                      <i class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
                      <div class="activity-content">
                        Voluptatem blanditiis blanditiis eveniet
                      </div>
                    </div><!-- End activity item-->
    
                    <div class="activity-item d-flex">
                      <div class="activite-label">2 hrs</div>
                      <i class='bi bi-circle-fill activity-badge text-primary align-self-start'></i>
                      <div class="activity-content">
                        Voluptates corrupti molestias voluptatem
                      </div>
                    </div><!-- End activity item-->
    
                    <div class="activity-item d-flex">
                      <div class="activite-label">1 day</div>
                      <i class='bi bi-circle-fill activity-badge text-info align-self-start'></i>
                      <div class="activity-content">
                        Tempore autem saepe <a href="#" class="fw-bold text-dark">occaecati voluptatem</a> tempore
                      </div>
                    </div><!-- End activity item-->
    
                    <div class="activity-item d-flex">
                      <div class="activite-label">2 days</div>
                      <i class='bi bi-circle-fill activity-badge text-warning align-self-start'></i>
                      <div class="activity-content">
                        Est sit eum reiciendis exercitationem
                      </div>
                    </div><!-- End activity item-->
    
                    <div class="activity-item d-flex">
                      <div class="activite-label">4 weeks</div>
                      <i class='bi bi-circle-fill activity-badge text-muted align-self-start'></i>
                      <div class="activity-content">
                        Dicta dolorem harum nulla eius. Ut quidem quidem sit quas
                      </div>
                    </div><!-- End activity item-->
    
                  </div>
    
                </div>
              </div><!-- End Recent Activity -->
    
              <!-- Website Traffic -->
              <div class="card">
                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filtro</h6>
                    </li>
    
                    <li><a class="dropdown-item" href="#">Hoje</a></li>
                    <li><a class="dropdown-item" href="#">Esse Mês</a></li>
                    <li><a class="dropdown-item" href="#">Esse Ano</a></li>
                  </ul>
                </div>
    
                <div class="card-body pb-0">
                  <h5 class="card-title">Formas de Pagamento <span>| Hoje</span></h5>
                  <div id="trafficChart" style="min-height: 400px;" class="echart"></div>
                </div>

              </div><!-- End Website Traffic -->
    
            </div><!-- End Right side columns -->
          </div>
        </section>
    </main><!-- End #main -->

  <x-footer></x-footer>
</x-layout>