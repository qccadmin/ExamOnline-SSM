/**
 * Created by Weil on 2016/11/16.
 */
var gulp = require('gulp');
var browserSync = require('browser-sync'); // 自动刷新
var plumber = require('gulp-plumber'); // gulp 错误处理

// CSS相关
var postcss = require('gulp-postcss');
var precss = require('precss');
var autoprefixer = require('autoprefixer');
var extend = require('postcss-simple-extend');
var mixins = require('postcss-sassy-mixins');
var comment = require('postcss-inline-comment');
var scss = require('postcss-scss');
var stripInlineComments = require('postcss-strip-inline-comments');


var rename = require('gulp-rename'); // 文件重命名

gulp.task('browserSync', function () {
    browserSync.init({
        port: 2333,
        server: {
            baseDir: './',
            index: 'index.html'
        }
    });

    browserSync.watch('./css/*.css').on('change', browserSync.reload);
    browserSync.watch('./*.html').on('change', browserSync.reload)
});


gulp.task('scss', function () {
    var postCssPlugins = [
        stripInlineComments,
        precss,
        autoprefixer({
            browsers: ['> 1%', 'IE > 8', 'Android >= 1.6', 'iOS >= 1.0']
        })
    ];

    function buildCss() {
        gulp.src('./scss/style.scss')
            .pipe(plumber())
            .pipe(postcss(postCssPlugins, {syntax: scss}))
            .pipe(rename(function (path) {
                path.extname = '.css';
            }))
            .pipe(gulp.dest('./css'));
    }
    buildCss();
    gulp.watch('./scss/*.scss', function () {
        buildCss();
    })
});

gulp.task('default', ['browserSync', 'scss']);