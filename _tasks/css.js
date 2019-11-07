import gulp from 'gulp';
import sass from 'gulp-sass';
import smap from 'gulp-sourcemaps';
import cssnano from 'gulp-clean-css';
import rename from 'gulp-rename';
import postcss from 'gulp-postcss';
import autoprefixer from 'autoprefixer';

gulp.task('css_dev', () => {
	return gulp.src([
		'./views/lib/*.sass',
		'!./views/lib/\_*.sass',
	])
		.pipe(smap.init({ loadMaps: true }))
		.pipe(sass().on('error', sass.logError))
		.pipe(cssnano())
		.pipe(postcss([autoprefixer({
			browsers: ['last 4 version', "IE 10"],
			cascade: false
		})]))
		.pipe(rename({
			suffix: '.min'
		}))
		.pipe(smap.write('.'))
		.pipe(gulp.dest('./dist/css'))
})