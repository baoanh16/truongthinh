import gulp from 'gulp';
import pug from 'gulp-pug';
import gulpif from 'gulp-if';


gulp.task('html', () => {
	return gulp.src([
		'./views/templates/*.pug',
		'!./views/templates/\_*.pug',
	])
		.pipe(pug({ pretty: '\t' }))
		.pipe(gulp.dest('./dist'));
})