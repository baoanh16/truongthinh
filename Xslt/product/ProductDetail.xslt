<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="sanpham-ct">
			<div class="row brief-info">
				<div class="col-xl-7 product-slider">
					<div class="product-images">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<xsl:apply-templates select="/ProductDetail/ProductImages"></xsl:apply-templates>
							</div>
							<div class="btn-prev">
								<em class="mdi mdi-chevron-left"></em>
							</div>
							<div class="btn-next">
								<em class="mdi mdi-chevron-right"></em>
							</div>
						</div>
					</div>
					<div class="product-thumbs">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<xsl:apply-templates select="/ProductDetail/ProductImages"></xsl:apply-templates>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-5">
					<h2 class="title">
						<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/Title"></xsl:value-of>
						<xsl:value-of select="/ProductDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
					</h2>
					<table class="info">
						<tr class="code">
							<td>
								<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/ProductCodeText">
								</xsl:value-of>
							</td>
							<td>
								<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/Code"></xsl:value-of>
							</td>
						</tr>
						<tr class="price">
							<td>
								<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/PriceText">
								</xsl:value-of>
							</td>
							<td>
								<div class="social-links">
									<xsl:value-of select='/ProductDetail/FullContent' disable-output-escaping='yes'>
									</xsl:value-of>
									<!-- <a class="btn-skype" href="#">
										<img src="/Data/Sites/1/media/default/img/_global/skype.png" alt="" />
									</a>
									<a class="btn-zalo" href="#">
										<img src="/Data/Sites/1/media/default/img/_global/zalo.png" alt="" />
									</a> -->
								</div>
							</td>
						</tr>
					</table>
					<div class="separator"></div>
					<xsl:if test="/ProductDetail/BriefContent != '' ">
						<div class="brief-content">
							<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/BriefContent">
							</xsl:value-of>
						</div>
						<div class="separator"></div>
					</xsl:if>
					<div class="tools">
						<div class="btn-share" href="javascript:void(0)">
							<em class="mdi mdi-share-variant"></em>
							<div class="share-wrapper">
								<a target="_blank">
									<xsl:attribute name="href">
										<xsl:text>https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
										<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/FullUrl">
										</xsl:value-of>
									</xsl:attribute>
									<em class="mdi mdi-facebook"></em>
								</a>
								<a target="_blank">
									<xsl:attribute name="href">
										<xsl:text>https://twitter.com/home?status=</xsl:text>
										<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/FullUrl">
										</xsl:value-of>
									</xsl:attribute>
									<em class="mdi mdi-twitter"></em>
								</a>
							</div>
						</div>
						<a class="btn-print" href="javascript:void(0)" onclick="window.print()">
							<em class="mdi mdi-printer"></em>
						</a>
						<a class="btn-download" href="javascript:void(0)">
							<xsl:attribute name='href'>
								<xsl:value-of disable-output-escaping='yes' select='/ProductDetail/FileUrl'>
								</xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name='target'>
								<xsl:text>_blank</xsl:text>
							</xsl:attribute>
							<em class="mdi mdi-cloud-download"></em>
						</a>
					</div>
				</div>
			</div>

			<div class="full-info">
				<div class="tab-headers">
					<select class="tab-links-mobile">
						<xsl:apply-templates select="/ProductDetail/ProductAttributes" mode="TabHeaders-Mobile">
						</xsl:apply-templates>
					</select>
					<div class="tab-links">
						<xsl:if test="count(/ProductDetail/ProductAttributes) > 0">
							<xsl:apply-templates select="/ProductDetail/ProductAttributes" mode="TabHeaders-Desktop">
							</xsl:apply-templates>
						</xsl:if>
						<a class="tab-link">
							<xsl:if test="count(/ProductDetail/ProductAttributes) > 0">
								<xsl:attribute name='class'>
									<xsl:text>tab-link active</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:attribute name="data-tab">
								<xsl:text>tab-99</xsl:text>
							</xsl:attribute>
							<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/ReviewText">
							</xsl:value-of>
						</a>
					</div>
				</div>
				<div class="tabs">
					<xsl:if test="count(/ProductDetail/ProductAttributes) > 0">
						<xsl:apply-templates select="/ProductDetail/ProductAttributes" mode="TabContent">
						</xsl:apply-templates>
					</xsl:if>
					<div class="tab" id="tab-99"></div>
				</div>
			</div>
			<xsl:if test="count(/ProductDetail/ProductRelated) > 0">
				<div class="other-products">
					<h2><xsl:value-of select='/ProductDetail/ProductRelatedText'></xsl:value-of></h2>
					<div class="row truongthinh-items">
						<xsl:apply-templates select="/ProductDetail/ProductRelated"></xsl:apply-templates>
					</div>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<xsl:template match="ProductImages">
		<div class="swiper-slide">
			<a data-fancybox="gallery-1">
				<xsl:attribute name="href">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<div class="img">
					<img class="lazyload blur-up" data-object-fit-cover="">
					<xsl:attribute name="data-src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					</img>
				</div>
			</a>
		</div>
	</xsl:template>
	<xsl:template match="ProductRelated">
		<xsl:if test="position() &lt; 7">
			<div class="col-md-6 col-xl-4">
				<a class="truongthinh-item">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="target">
						<xsl:value-of select="Target"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<div class="img">
						<img class="lazyload blur-up" data-object-fit-cover="">
						<xsl:attribute name="data-src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						</img>
					</div>
					<div class="content">
						<h3>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</h3>
					</div>
					<div class="cover">
						<h4>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</h4>
					</div>
				</a>
				<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="ProductAttributes" mode="TabHeaders-Mobile">
		<option>
			<xsl:if test="position() = 1">
				<xsl:attribute name="selected"></xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:text>tab-</xsl:text>
				<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
		</option>
	</xsl:template>
	<xsl:template match="ProductAttributes" mode="TabHeaders-Desktop">
		<a class="tab-link">
			<xsl:if test="position() = 1">
				<xsl:attribute name="class">
					<xsl:text>tab-link active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="data-tab">
				<xsl:text>tab-</xsl:text>
				<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
		</a>
	</xsl:template>
	<xsl:template match="ProductAttributes" mode="TabContent">
		<div class="tab">
			<xsl:attribute name="id">
				<xsl:text>tab-</xsl:text>
				<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of disable-output-escaping="yes" select="Content"></xsl:value-of>
			<div class="btn-viewmore">
				<a href="javascript:void(0)" onclick="ShowMoreProductDetails('#tab-1')">
					<xsl:attribute name="onclick">
						<xsl:text>ShowMoreProductDetails('#tab-</xsl:text>
						<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
						<xsl:text>')</xsl:text>
					</xsl:attribute>
					Xem thêm
				</a>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>