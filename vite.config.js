import { viteStaticCopy } from 'vite-plugin-static-copy'
import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
    plugins: [
        laravel({
            input: ['resources/css/app.css',
                'resources/js/app.js'
            ],
            refresh: true,
        }),
        viteStaticCopy({
            targets: [
                {
                    src: 'resources/assets/vendor/apexcharts/apexcharts.min.js',
                    dest: 'assets'
                },
                {
                    src: 'resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js',
                    dest: 'assets'
                },
                {
                    src: 'resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js.map',
                    dest: 'assets'
                },
                {
                    src: 'resources/assets/vendor/chart.js/chart.min.js',
                    dest: 'assets'
                },
                {
                    src: 'resources/assets/vendor/echarts/echarts.min.js',
                    dest: 'assets'
                },
                {
                    src: 'resources/assets/vendor/echarts/echarts.min.js',
                    dest: 'assets'
                },
                {
                    src: 'resources/assets/vendor/quill/quill.min.js',
                    dest: 'assets'
                },{
                    src: 'resources/assets/vendor/quill/quill.min.js.map',
                    dest: 'assets'
                },
                {
                    src: 'resources/assets/vendor/simple-datatables/simple-datatables.js',
                    dest: 'assets'
                },
                {
                    src: 'resources/assets/vendor/tinymce/tinymce.min.js',
                    dest: 'assets'
                },
                {
                    src: 'resources/assets/vendor/php-email-form/validate.js',
                    dest: 'assets'
                },
                {
                    src: 'node_modules/cropperjs/dist/cropper.common.js',
                    dest: 'assets'
                },
                {
                    src: 'node_modules/cropperjs/dist/cropper.esm.js',
                    dest: 'assets'
                },
                {
                    src: 'node_modules/cropperjs/dist/cropper.min.js',
                    dest: 'assets'
                },
                {
                    src: 'resources/assets/js/main.js',
                    dest: 'assets'
                }
            ]
        })
    ],
    build: {
        chunkSizeWarningLimit: 1024,
    },
});
