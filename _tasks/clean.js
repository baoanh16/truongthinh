import gulp from 'gulp';
import del from 'del';

gulp.task('del', () => {
	return del('./dist')
})
gulp.task('del_img', () => {
	return del('./dist/img')
})