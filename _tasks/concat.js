//======================================//
// Import plugins
import fs from 'graceful-fs';
import gulp from 'gulp'
import concat from 'gulp-concat'
import cssnano from 'gulp-clean-css';
import uglifyes from 'gulp-uglify-es'



gulp.task('concat_css', () => {
	let plugins = JSON.parse(fs.readFileSync('./plugins.json'));
	return gulp.src(plugins.styles)
		.pipe(concat('core.min.css'))
		.pipe(cssnano())
		.pipe(gulp.dest('./dist/css'))
})

gulp.task('concat_js', () => {
	let plugins = JSON.parse(fs.readFileSync('./plugins.json'));
	return gulp.src(plugins.scripts)
		.pipe(concat('core.min.js'))
		.pipe(uglifyes())
		.pipe(gulp.dest('./dist/js'))
})