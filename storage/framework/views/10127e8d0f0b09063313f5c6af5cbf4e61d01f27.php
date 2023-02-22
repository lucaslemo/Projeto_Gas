<?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.layout','data' => ['title' => ''.e($titulo).'']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('layout'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['title' => ''.e($titulo).'']); ?>
  <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.header','data' => ['nomeCompleto' => 'Lucas Lemos','nomeAbreviado' => 'L. Lemos','tipoUsuario' => 'Admin']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('header'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['nomeCompleto' => 'Lucas Lemos','nomeAbreviado' => 'L. Lemos','tipoUsuario' => 'Admin']); ?> <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
  <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.aside','data' => []] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('aside'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?> <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>

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
      </div> 

      
      <?php if(isset($mensagem)): ?>
      <div class="col align-self-center">
        <div class="alert alert-success alert-dismissible fade show mb-0 py-3" role="alert">
            <?php echo $mensagem; ?>

            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
      </div>
      <?php endif; ?>
    
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

                          <h6><?php echo e($qtdVendas['qtdHoje']); ?></h6>
                          <?php if($qtdVendas['taxaCrecimento'] > 0): ?>
                          <span class="text-success small pt-1 fw-bold">+<?php echo e($qtdVendas['taxaCrecimento']); ?>%</span>
                          <?php elseif($qtdVendas['taxaCrecimento'] < 0): ?>
                          <span class="text-danger small pt-1 fw-bold"><?php echo e($qtdVendas['taxaCrecimento']); ?>%</span>
                          <?php else: ?>
                          <span class="text-secondary small pt-1 fw-bold"><?php echo e($qtdVendas['taxaCrecimento']); ?>%</span>
                          <?php endif; ?>

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
                      <script>
                        document.addEventListener("DOMContentLoaded", () => {
                          new ApexCharts(document.querySelector("#reportsChart"), {
                            series: [{
                              name: 'Sales',
                              data: [31, 40, 28, 51, 42, 82, 56],
                            }, {
                              name: 'Revenue',
                              data: [11, 32, 45, 32, 34, 52, 41]
                            }, {
                              name: 'Customers',
                              data: [15, 11, 32, 18, 9, 24, 11]
                            }],
                            chart: {
                              height: 350,
                              type: 'area',
                              toolbar: {
                                show: false
                              },
                            },
                            markers: {
                              size: 4
                            },
                            colors: ['#4154f1', '#2eca6a', '#ff771d'],
                            fill: {
                              type: "gradient",
                              gradient: {
                                shadeIntensity: 1,
                                opacityFrom: 0.3,
                                opacityTo: 0.4,
                                stops: [0, 90, 100]
                              }
                            },
                            dataLabels: {
                              enabled: false
                            },
                            stroke: {
                              curve: 'smooth',
                              width: 2
                            },
                            xaxis: {
                              type: 'datetime',
                              categories: [
                                "2018-09-19T08:00:00.000Z",
                                "2018-09-19T10:00:00.000Z",
                                "2018-09-19T12:00:00.000Z",
                                "2018-09-19T14:00:00.000Z",
                                "2018-09-19T16:00:00.000Z",
                                "2018-09-19T18:00:00.000Z",
                                "2018-09-19T20:00:00.000Z"
                              ]
                            },
                            tooltip: {
                              x: {
                                format: 'dd/MM/yy HH:mm'
                              },
                            }
                          }).render();
                        });
                      </script>
                      <!-- End Line Chart -->
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
                            <th scope="col">Cliente</th>
                            <th scope="col">Data da Venda</th>
                            <th scope="col">Valor</th>
                            <th scope="col">Tipo de Pagamento</th>
                            <th scope="col">Detalhes e Status</th>
                          </tr>
                        </thead>
                        <tbody>
                          <?php $__currentLoopData = $tabelaVendas; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $venda): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                          <tr>
                            <th scope="row"><?php echo e($venda->cliente); ?></th>
                            <td><?php echo e(date('d/m/Y', strtotime($venda->data_da_venda))); ?></td>
                            <td class="text-primary">R$ <?php echo e($venda->valor_total); ?></td>
                            <td><?php echo e(ucfirst($venda->tipo_pagamento)); ?></td>
                            <td>
                              <div class="d-flex">
                                <?php if(is_null($venda->data_do_pagamento)): ?>
                                <span class="badge bg-warning me-1">Aguardando Pagamento</span>
                                <?php else: ?>
                                <span class="badge bg-success me-1">Paga</span>
                                <?php endif; ?>
                                <?php if(!is_null($venda->entregador)): ?>
                                <span class="badge bg-primary">Entregue</span>
                                <?php endif; ?>
                              </div>
                            </td>
                          </tr>
                          <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                          <?php unset($tabelaVendas); ?>
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

              <!-- Budget Report -->
              <div class="card">
                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div>

                <div class="card-body pb-0">
                  <h5 class="card-title">Budget Report <span>| This Month</span></h5>

                  <div id="budgetChart" style="min-height: 400px;" class="echart"></div>

                  <script>
                    document.addEventListener("DOMContentLoaded", () => {
                      var budgetChart = echarts.init(document.querySelector("#budgetChart")).setOption({
                        legend: {
                          data: ['Allocated Budget', 'Actual Spending']
                        },
                        radar: {
                          // shape: 'circle',
                          indicator: [{
                              name: 'Sales',
                              max: 6500
                            },
                            {
                              name: 'Administration',
                              max: 16000
                            },
                            {
                              name: 'Information Technology',
                              max: 30000
                            },
                            {
                              name: 'Customer Support',
                              max: 38000
                            },
                            {
                              name: 'Development',
                              max: 52000
                            },
                            {
                              name: 'Marketing',
                              max: 25000
                            }
                          ]
                        },
                        series: [{
                          name: 'Budget vs spending',
                          type: 'radar',
                          data: [{
                              value: [4200, 3000, 20000, 35000, 50000, 18000],
                              name: 'Allocated Budget'
                            },
                            {
                              value: [5000, 14000, 28000, 26000, 42000, 21000],
                              name: 'Actual Spending'
                            }
                          ]
                        }]
                      });
                    });
                  </script>

                </div>
              </div><!-- End Budget Report -->
    
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
                  <script>
                    document.addEventListener("DOMContentLoaded", () => {
                      echarts.init(document.querySelector("#trafficChart")).setOption({
                        tooltip: {
                          trigger: 'item'
                        },
                        legend: {
                          top: '5%',
                          left: 'center'
                        },
                        series: [{
                          name: 'Access From',
                          type: 'pie',
                          radius: ['40%', '70%'],
                          avoidLabelOverlap: false,
                          label: {
                            show: false,
                            position: 'center'
                          },
                          emphasis: {
                            label: {
                              show: true,
                              fontSize: '18',
                              fontWeight: 'bold'
                            }
                          },
                          labelLine: {
                            show: false
                          },
                          data: [{
                              value: 1048,
                              name: 'Search Engine'
                            },
                            {
                              value: 735,
                              name: 'Direct'
                            },
                            {
                              value: 580,
                              name: 'Email'
                            },
                            {
                              value: 484,
                              name: 'Union Ads'
                            },
                            {
                              value: 300,
                              name: 'Video Ads'
                            }
                          ]
                        }]
                      });
                    });
                  </script>
                </div>

              </div><!-- End Website Traffic -->
    
            </div><!-- End Right side columns -->
          </div>
        </section>
    </main><!-- End #main -->

  <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.footer','data' => []] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('footer'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?> <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
  <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.scripts','data' => []] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('scripts'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?> <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
 <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?><?php /**PATH D:\Projetos\Web\Projeto_Gas\resources\views/dashboard/index.blade.php ENDPATH**/ ?>