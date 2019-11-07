
import gulp from "gulp";



gulp.task('copy_img', () => {
	return gulp.src('./img/**/*.{png,jpg,jpeg,svg,gif}')
		.pipe(gulp.dest('./dist/img'))
})

gulp.task('copy_fonts_1', () => {
	return gulp.src('./fonts/**/*')
		.pipe(gulp.dest('./dist/fonts'))
		.pipe(gulp.dest('./dist/css/fonts'))
})
gulp.task('copy_fonts_2', () => {
	return gulp.src('./webfonts/**/*')
		.pipe(gulp.dest('./dist/webfonts'))
})
gulp.task('copy_files', () => {
	return gulp.src('./file/**/*')
		.pipe(gulp.dest('./dist/file'))
})