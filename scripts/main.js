$(document).ready(function () {
	objectFitPolyfill();

	//Header
	toolNavMapping();
	zoneNavMapping();
	toggleSearchOnClick();
	toggleMobileHeader();
	onBackdropClick();
	dropdownMenuClick();
	mobileHeaderNavigation();
	//Home
	if ($(window).width() < 992) {
		bannerHomeInit();
	}
	projectHomeSliderInit();
	fullpageInit();

	//Global
	languageMapping();
	toggleTab();
	sidenavMapping();
	sidenavToggle();
	sidenavParentLinkClick();
	downloadDocumentClick();
	selectNavNavigation();
	navLinksDropdown();
	headerNavLinksDropdownPositioning1();
	headerNavLinksDropdownPositioning2();
	toggleSelect();
	customOptionClicked();
	backToTop()
	//Product detail
	activeFirstTab();
	productDetailSliderInit();
	productDetailSliderFancybox();

	//Project
	projectDetailSliderInit();
	projectDetailSliderFancybox();
	projectDetailSliderInit2();

	//FAQs
	faqsToggle();

	//Contact
	onContactMapItemClick();

	//Fields
	otherFieldsMapping();

	$('[fancybox-gallery]').fancybox({
		thumbs: {
			autoStart: true,
			axis: "x"
		}
	});
	$('[fancybox-form]').fancybox({
		parentEl: 'form'
	});
	$('[tuyendung-form]').fancybox({
		parentEl: 'form',
		baseClass: 'tuyendung-form-popup'
	});

	if ($('.duan-ct').length && $(window).outerWidth() < 992) {
		$('.banner-trangrieng').css('display', 'none');
	}

	if ($('.product-detail-page').length) {
		$('body').addClass('has-sidebar');
	}

	$('#tab-99').html($('.pcommentpanel').detach())

	// $('.nav-headers .nav-link').click(function (e) {
	// 	e.preventDefault();
	// 	$(this).addClass('active')
	// 	$(this).siblings().removeClass('active')
	// 	$.get($(this).attr('href'), function (response) {
	// 		$('.Module-198').siblings().remove()
	// 		$('.Module-198').after($(response).find('.Module-198').siblings())
	// 	});
	// });
	if ($(window).scrollTop() > 0) {
		$('.backtotop').fadeIn(function () {
			$('.backtotop').css({
				'display': 'flex'
			})
		})
	} else {
		$('.backtotop').fadeOut()
	}

	$(window).scroll(function () {
		if ($(window).scrollTop() > 0) {
			$('.backtotop').fadeIn(function () {
				$('.backtotop').css({
					'display': 'flex'
				})
			})
		} else {
			$('.backtotop').fadeOut()
		}
	});
});



function toolNavMapping() {
	try {
		return new MappingListener({
			selector: ".canhcam-header-1 .tool-nav",
			mobileWrapper: ".canhcam-header-1 .mobile-header",
			mobileMethod: "appendTo",
			desktopWrapper: ".canhcam-header-1 .desktop-header .custom-nav",
			desktopMethod: "appendTo",
			breakpoint: 992
		}).watch()
	} catch (e) {}
}

function languageMapping() {
	try {
		return new MappingListener({
			selector: ".canhcam-header-1 .language",
			mobileWrapper: ".canhcam-header-1 .mobile-header-toggle",
			mobileMethod: "insertBefore",
			desktopWrapper: ".canhcam-header-1 .search",
			desktopMethod: "insertAfter",
			breakpoint: 992
		}).watch()
	} catch (e) {}
}

function zoneNavMapping() {
	try {
		return new MappingListener({
			selector: ".canhcam-header-1 .zone-nav",
			mobileWrapper: ".canhcam-header-1 .mobile-header",
			mobileMethod: "appendTo",
			desktopWrapper: ".canhcam-header-1 .desktop-header .custom-nav",
			desktopMethod: "appendTo",
			breakpoint: 992
		}).watch()
	} catch (e) {}
}

function phoneMapping() {
	try {
		return new MappingListener({
			selector: ".canhcam-header-1 .phone",
			mobileWrapper: ".canhcam-header-1 .mobile-sup-header",
			mobileMethod: "appendTo",
			desktopWrapper: ".canhcam-header-1 .divider",
			desktopMethod: "insertBefore",
			breakpoint: 992
		}).watch()
	} catch (e) {}
}

let dividerMapping = new MappingListener({
	selector: ".canhcam-header-1 .divider",
	mobileWrapper: ".canhcam-header-1 .search",
	mobileMethod: "insertBefore",
	desktopWrapper: ".canhcam-header-1 .Module-142",
	desktopMethod: "insertBefore",
	breakpoint: 992
}).watch()

function toggleSearchOnClick() {
	$("body").on("click", ".search-toggle", function () {
		$(this).parent(".search").toggleClass("active")
	})
}

function toggleMobileHeader() {
	$("body").on("click", ".mobile-header-toggle", function () {
		$(".mobile-header").toggleClass("active"),
			$(".backdrop").toggleClass("active")
	})
}

function onBackdropClick() {
	$("body").on("click", ".backdrop", function () {
		$(this).removeClass("active");
		$(".mobile-header").removeClass("active");
		$('.sub-menu-1').removeClass("active");
		$('.sub-menu-2').removeClass("active");
	})
}

function bannerHomeInit() {
	return new Swiper(".banner-trangchu .swiper-container", {
		slidesPerView: 1,
		spaceBetween: 10,
		speed: 1000,
		loop: !0,
		autoplay: !0,
		// navigation: {
		//     nextEl: ".banner-trangchu .swiper-button-next",
		//     prevEl: ".banner-trangchu .swiper-button-prev"
		// },
		pagination: {
			el: ".banner-trangchu .swiper-pagination",
			type: "bullets",
			clickable: !0
		}
	})
}

function toggleTab() {
	$("body").on("click", ".tab-link", function () {
		const tabId = '#' + $(this).attr('data-tab');

		//Toggle tab-link active state
		$(this).siblings().removeClass('active');
		$(this).addClass('active');

		//Fade the corresponding tab content in
		$(tabId).siblings().fadeOut(0);
		$(tabId).fadeIn(250);
	})
}

function activeFirstTab() {
	if ($('.tab-headers').length) {
		$('.tab-headers').each(function (index, element) {
			$(element).children().last().children().first().click();
		})
	}
}

function projectHomeSliderInit() {
	return new Swiper(".home-4 .swiper-container", {
		spaceBetween: 40,
		speed: 1000,
		centeredSlides: !0,
		slidesPerView: 1.5,
		initialSlide: 1,
		loop: !0,
		loopAdditionalSlides: 2,
		autoplay: true,
		navigation: {
			nextEl: ".home-4 .swiper-button-next",
			prevEl: ".home-4 .swiper-button-prev"
		},
		pagination: {
			el: ".home-4 .swiper-pagination",
			type: "fraction",
			clickable: !0
		},
		breakpoints: {
			480: {
				slidesPerView: 1
			}
		},
	})
}

function objectFitPolyfill() {
	// Internet Explorer 6-11
	const isIE = /*@cc_on!@*/ false || !!document.documentMode;

	// Edge 20+
	const isEdge = !isIE && !!window.StyleMedia;

	if (isIE === true || isEdge === true) {
		$('[data-object-fit-cover]').each(function (index, element) {
			let src = $(element).attr('data-src');
			if (src === undefined) {
				src = $(element).attr('src')
			}
			$(element).css('display', 'none');
			$(element).parent().css({
				'background-image': "url('" + src + "')",
				'background-repear': 'no-repeat',
				'background-size': 'cover',
				'background-position': 'center center'
			});
		});
	}
}

function customPopupV1(element) {
	const dataSrc = $(element).attr('data-src');
	$.fancybox.open({
		src: dataSrc,
		type: 'inline',
		opts: {
			baseClass: 'popup-chungnhan',
		}
	});
}

function selectNavNavigation() {
	$('body').on('change', '.selectNav', function () {
		var url = $(this).val();
		if (url === undefined || url === null) {
			url = "/";
		}
		window.location.href = url;
	});
	$('body').on('change', '.selectNavWithNewTab', function () {
		var url = $(this).val();
		if (url === undefined || url === null) {
			url = "/";
		}
		$('<a href="' + url + '" target="_blank"></a>')[0].click();
	});
}

function dropdownMenuClick() {
	$('body').on('click', 'header div[data-href]', function (e) {
		e.preventDefault();
		e.stopPropagation();
		var url = $(this).attr('data-href');
		if (url === undefined || url === null) {
			url = "/";
		}
		window.location.href = url;
	});
}

var productDetailSliderInit = function () {
	try {
		var productThumbs = new Swiper('.product-thumbs .swiper-container', {
			slidesPerView: 3,
			spaceBetween: 10,
			centeredSlides: true,
			slideToClickedSlide: true
		});
		var productImages = new Swiper('.product-images .swiper-container', {
			slidesPerView: 1,
			spaceBetween: 0,
			visibilityFullFit: true,
			autoResize: false,
			navigation: {
				nextEl: '.product-images .btn-next',
				prevEl: '.product-images .btn-prev',
			},
		});

		productImages.controller.control = productThumbs;
		productThumbs.controller.control = productImages;
	} catch (error) {

	}
}

var projectDetailSliderInit = function () {
	try {
		var projectThumbs = new Swiper('.project-thumbs .swiper-container', {
			slidesPerView: 4,
			spaceBetween: 10,
			centeredSlides: true,
			slideToClickedSlide: true,
			initialSlide: 1
		});
		var projectImages = new Swiper('.project-images .swiper-container', {
			slidesPerView: 1,
			spaceBetween: 0,
			initialSlide: 1,
			navigation: {
				nextEl: '.project-images .btn-next',
				prevEl: '.project-images .btn-prev',
			},
		});

		projectImages.controller.control = projectThumbs;
		projectThumbs.controller.control = projectImages;
	} catch (error) {

	}
}

function projectDetailSliderInit2() {
	return new Swiper(".duan-ct .other-news .swiper-container", {
		spaceBetween: 30,
		speed: 1000,
		slidesPerView: 3,
		autoplay: !0,
		navigation: {
			nextEl: ".other-news .btn-other-next",
			prevEl: ".other-news .btn-other-prev"
		},
		breakpoints: {
			992: {
				slidesPerView: 2
			},
			768: {
				slidesPerView: 1
			}
		}
	})
}

function ShowMoreProductDetails(id) {
	if ($(id).length) {
		var $id = $(id);
		$id.css({
			'opacity': '0'
		});
		setTimeout(function () {
			$id.css({
				'height': 'auto',
				'opacity': '1',
				'padding-bottom': '50px'
			});
			$id.children('.btn-viewmore').remove();
		}, 250);
	}
}

function sidenavMapping() {
	if ($('.sidenav').length) {
		$('.sidenav').detach().insertBefore('.sidebar');
	}
}

function sidenavToggle() {
	$('body').on('click', '.zone-parent', function (e) {
		e.preventDefault();
		if (!$(this).hasClass('active')) {
			$('.sidenav .zone-parent').removeClass('active');
			$('.sidenav .zone-list').removeClass('active');
			$(this).toggleClass('active');
			$(this).next().toggleClass('active');
		} else {
			$('.sidenav .zone-parent').removeClass('active');
			$('.sidenav .zone-list').removeClass('active');
		}
	});
}

function sidenavParentLinkClick() {
	$('body').on('click', '.zone-parent>a>span', function () {
		window.location.href = $(this).parent().attr('href');
	});
}

function projectDetailSliderFancybox() {
	$('body').on('click', '.project-images a', function (e) {
		var fancyboxRel = e.currentTarget.dataset.fancybox;
		var fancyboxSelector = "[data-fancybox='" + fancyboxRel + "']";
		var swiperSelector = e.currentTarget.parentElement.parentElement.parentElement.swiper
		$(fancyboxSelector).fancybox({
			beforeClose: function (e) {
				swiperSelector.slideTo(e.currIndex)
			}
		});
	});
}

function productDetailSliderFancybox() {
	$('body').on('click', '.product-images a', function (e) {
		var fancyboxRel = e.currentTarget.dataset.fancybox;
		var fancyboxSelector = "[data-fancybox='" + fancyboxRel + "']";
		var swiperSelector = e.currentTarget.parentElement.parentElement.parentElement.swiper
		$(fancyboxSelector).fancybox({
			beforeClose: function (e) {
				swiperSelector.slideTo(e.currIndex)
			}
		});
	});
}

function faqsToggle() {
	$('body').on('click', '.question', function () {
		var questionParent = $(this).parent();
		var questionNextElement = $(this).next();

		if (questionParent.hasClass('active')) {
			questionParent.removeClass('active');
			questionNextElement.slideUp(250);
		} else {
			$('.question').each(function (index, element) {
				$(element).parent().removeClass('active');
				$(element).next().slideUp(250);
			});
			questionParent.addClass('active');
			questionNextElement.slideDown(250);
		}
	});
}

function downloadDocumentClick() {
	$('body').on('click', '.download_document', function (e) {

		var target = e.currentTarget;
		var url = target.dataset.href;
		var mimeType = target.dataset.mimetype;
		var fileName = target.dataset.filename;

		var request = new XMLHttpRequest();
		request.open("GET", url, true);
		request.responseType = "blob";
		request.onload = function (e) {
			download(e.target.response, fileName + '.' + mimeType, mimeType);
		};
		request.send();
	});
}

function onContactMapItemClick() {
	$('body').on('click', '.contact-map .item', function () {
		var mapHtml = $(this).children('.map-iframe').html();
		$('#contactMap').html(mapHtml);

		$('.contact-map .item').removeClass('active');
		$(this).addClass('active');
		if ($(window).outerWidth() < 992) {
			$.fancybox.open({
				src: '#contactMap',
				type: "inline",
				opts: {
					baseClass: "contact-map-popup"
				}
			});
		}
	});
}

function navLinksDropdown() {
	if ($(window).outerWidth() > 992) {
		$('body').on('click', '.nav-links-wrapper>.nav-links>.icon', function () {
			$(this).toggleClass('active');
			$(this).parent().next().toggleClass('active');
		})
	}
}

function headerNavLinksDropdownPositioning1() {
	var _dropdownWidth = 300,
		_dropdownHalfWidth = 150,
		_windowWidth = $(window).outerWidth();
	if (_windowWidth >= 992) {
		var elements_1 = $('header .has-sub-1').get(),
			element_1 = null,
			isOverflow = false;
		for (var i = 0, length = elements_1.length; i < length; i++) {
			element_1 = elements_1[i];
			//The dropdown, by default is placed in center of the parent element. So the X position of 'overflow' part to the right is equal to the formula below.
			isOverflow = element_1.clientWidth / 2 + element_1.offsetLeft + _dropdownHalfWidth <= _windowWidth ? false : true;

			if (isOverflow) {
				$(element_1).children('.sub-menu-1').css({
					'transform': 'translateX(0%)',
					'right': '0px',
					'left': 'auto'
				});
				$(element_1).children('.sub-menu-1').children().eq(1).addClass('isOverflow');
			}
		}
	}
}

function headerNavLinksDropdownPositioning2() {
	var _dropdownWidth = 300,
		_dropdownHalfWidth = 150,
		_windowWidth = $(window).outerWidth();
	if (_windowWidth >= 992) {
		var elements_2 = $('header .has-sub-2').get(),
			element_2 = null,
			isOverflow2 = false,
			parentElement;
		for (var i = 0, length = elements_2.length; i < length; i++) {
			element_2 = elements_2[i];
			parentElement = $(element_2).parent().parent()[0];
			//The dropdown, by default is placed in center of the parent element. So the X position of 'overflow' part to the right is equal to the formula below.
			isOverflow2 = parentElement.clientWidth / 2 + parentElement.offsetLeft + _dropdownHalfWidth + _dropdownWidth <= _windowWidth ? false : true;

			if (isOverflow2) {
				$(element_2).children('.sub-menu-2').css({
					'right': 'auto',
					'left': '-303px' //303 px is 300px include 3px of border left of the .has-sub-2 element
				});
			}
		}
	}
}

function mobileHeaderNavigation() {
	if ($(window).outerWidth() < 992) {
		$('body').on('click', 'header .has-sub-1>.parent-link-1>em', function (e) {
			e.preventDefault();
			$(e.currentTarget).parent().next().slideToggle();
		});
		$('body').on('click', 'header .previous-link-1', function (e) {
			e.preventDefault();
			$(e.currentTarget).parent().removeClass('active');
		});

		$('body').on('click', 'header .has-sub-2>.parent-link-2>em', function (e) {
			e.preventDefault();
			$(e.currentTarget).parent().next().slideToggle();
		});
		$('body').on('click', 'header .previous-link-2', function (e) {
			e.preventDefault();
			$(e.currentTarget).parent().removeClass('active');
		});
	}
}

function fullpageInit() {
	if ($('.home-page').length && $(window).outerWidth() > 992) {
		var footerHtml = $('footer').detach()[0].outerHTML;
		$(footerHtml).insertAfter('.home-6');
		$('#fullpage').fullpage({
			licenseKey: 'A3DA879C-B1254377-8A906973-AAE812EA',
			navigation: true,
			navigationPosition: 'right',
			paddingBottom: 0,
			paddingTop: 0,
			scrollingSpeed: 800,
			sectionSelector: '.fullpage-section',
			afterRender: function () {
				var bannerHeight = $('.banner-trangchu').outerHeight();
				var windowHeight = $(window).outerHeight();
				var headerHeight = $('header').outerHeight();
				var footerHeight = $('footer').outerHeight();

				$('.Module-210>.ModuleContent>.row').css('height', windowHeight - headerHeight - bannerHeight);
				$('.home-6').css('height', windowHeight - footerHeight - headerHeight);

				$('.backtotop').click(function () {
					fullpage_api.moveTo(1)
				})
				bannerHomeInit()
			},
			onLeave: function () {
				$('.backtotop').fadeIn(function () {
					$('.backtotop').css({
						'display': 'flex'
					})
				})
			}
		});
	}
}

function otherFieldsMapping() {
	if ($('.linhvuc-page').length && $('.other-fields-wrapper').length) {
		var otherFieldsHtml = $('.other-fields-wrapper').detach()[0].outerHTML;
		$(otherFieldsHtml).appendTo('.linhvuc .row.items');
	}
}

function toggleSelect() {
	$("body").on("click", ".current-option", function () {
		$(this).toggleClass("active"), $(this).parent(".custom-select").find(".options").toggleClass("active")
	})
}

function customOptionClicked() {
	$("body").on("click", ".custom-option", function () {
		$(this).parent().parent().find(".current-option span").html($(this).html()), $(this).parent().removeClass("active"), $(this).parent().parent().find(".current-option").removeClass("active")
	})
}

function backToTop() {
	$('.backtotop').click(function () {
		$('html,body').animate({
			scrollTop: 0
		}, 1200)
	})
}