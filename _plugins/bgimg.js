function bgimg() {
	if ($(window).outerWidth() >= 992) {
		$('[bg-img]').each(function () {
			var bgimg = $(this).attr('bg-img');
			$(this).css({
				"background-position": "center center",
				"background-size": "cover",
				"background-repeat": "no-repeat",
				"background-image": "url(" + bgimg + ")"
			});
		});
	} else {
		$('[bg-img-mobile]').each(function () {
			var bgimg = $(this).attr('bg-img-mobile');
			$(this).css({
				"background-position": "center center",
				"background-size": "cover",
				"background-repeat": "no-repeat",
				"background-image": "url(" + bgimg + ")"
			});
		});
	}
};
$(document).ready(function () {
	bgimg();
});