<?php require __DIR__ . '/../inicio-html.php'; ?>
<main>
    <div class="container">
        <section class="section error-404 min-vh-100 d-flex flex-column align-items-center justify-content-center">
            <h1>404</h1>
            <h2>A página que você está procurando não existe.</h2>
            <p><?= $pagina ?></p>
            <a class="btn" href="javascript:history.back()">Voltar</a>
            <img src="/assets/img/not-found.svg" class="img-fluid py-5" alt="Page Not Found">
        </section>
    </div>
</main><!-- End #main -->
<?php require __DIR__ . '/../fim-html.php'; ?>