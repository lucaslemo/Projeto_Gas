<?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.layout','data' => ['title' => ''.e($titulo).'']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('layout'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['title' => ''.e($titulo).'']); ?>
    <main>
        <div class="container">

            <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">

                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                            <div class="d-flex justify-content-center py-4">
                                <div class="d-flex align-items-center w-auto">
                                    <img src="<?php echo e(Vite::asset('resources/assets/img/logos/MARCA_DAGUA_2.png')); ?>" alt="Logo Poligas"
                                    style="max-height: 80px;">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <div class="card mb-3">

                                        <div class="card-body">

                                            <div class="pt-4 pb-2">
                                                <h5 class="card-title text-center pb-0 fs-4">Login</h5>
                                            </div>

                                            <form action="<?php echo e(route('login.store')); ?>" class="row g-3 needs-validation" method="POST"
                                            accept-charset="utf-8" autocomplete="on" enctype="multipart/form-data">

                                                
                                                <?php if(isset($mensagem)): ?>
                                                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                                    <?php echo e($mensagem); ?>

                                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                </div>
                                                <?php endif; ?>
                                                
                                                <?php echo csrf_field(); ?>
                                                <div class="col-12">
                                                    <label for="yourUsername" class="form-label">Nome de Usuário</label>
                                                    <div class="input-group has-validation">
                                                        <span class="input-group-text" id="inputGroupPrepend">@</span>
                                                        <input type="text" name="login" class="form-control" id="yourUsername" required>
                                                        <div class="invalid-feedback">Digite o seu nome de Usuário!</div>
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <label for="yourPassword" class="form-label">Senha</label>
                                                    <input type="password" name="senha" class="form-control" id="yourPassword" required>
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
                                                    <p class="small mb-0">Esqueceu sua senha? <a href="#">Redefinir Senha</a></p>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </section>

        </div>
    </main>
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
<?php endif; ?><?php /**PATH D:\Projetos\Web\Projeto_Gas\resources\views/login/index.blade.php ENDPATH**/ ?>