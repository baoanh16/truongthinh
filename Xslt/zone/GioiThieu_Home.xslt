<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
	xmlns:msxsl='urn:schemas-microsoft-com:xslt' exclude-result-prefixes='msxsl'>
	<xsl:output method='html' indent='yes' />
	<xsl:template match='/'>
		<xsl:apply-templates select='/ZoneList/Zone' mode="Zone1"></xsl:apply-templates>
	</xsl:template>

	<xsl:template match='Zone' mode="Zone1">
		<div class="row">
			<div class="col">
				<h2 class="tagline-home">
					<xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
				</h2>
			</div>
		</div>
		<div class="tab-headers">
			<div class="tab-links">
				<xsl:apply-templates select='Zone' mode="Zone2_desktop"></xsl:apply-templates>
			</div>
		</div>
		<div class="nav-links-mobile">
			<div class="custom-select">
				<div class="current-option">
					<span>
						<xsl:value-of disable-output-escaping='yes' select='/ZoneList/MenuText'></xsl:value-of>
					</span>
					<em class="mdi mdi-chevron-down"></em>
				</div>
				<div class="options">
					<xsl:apply-templates select="Zone" mode="Zone3_mobile"></xsl:apply-templates>
				</div>
			</div>
		</div>
		<div class="tabs">
			<xsl:apply-templates select='Zone' mode="Zone2_content"></xsl:apply-templates>
		</div>
	</xsl:template>

	<xsl:template match='Zone' mode="Zone2_desktop">
		<a class="tab-link">
			<xsl:attribute name='data-tab'>
				<xsl:text>tab-</xsl:text>
				<xsl:value-of disable-output-escaping='yes' select='ZoneId'></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
		</a>
	</xsl:template>

	<xsl:template match='Zone' mode="Zone2_content">
		<div class="tab">
			<xsl:attribute name='id'>
				<xsl:text>tab-</xsl:text>
				<xsl:value-of disable-output-escaping='yes' select='ZoneId'></xsl:value-of>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="position() = 1">
					<div class="content">
						<h3 class="title">
							<xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
						</h3>
						<xsl:value-of disable-output-escaping='yes' select='Description'></xsl:value-of>
					</div>
					<div class="image">
						<img class='lazyload blur-up'>
						<xsl:attribute name='data-src'>
							<xsl:value-of select='ImageUrl'></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name='alt'>
							<xsl:value-of select='Title'></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name='title'>
							<xsl:value-of select='Title'></xsl:value-of>
						</xsl:attribute>
						</img>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div class="content">
						<h3 class="title">
							<xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
						</h3>
						<div class="full-content">
							<xsl:value-of disable-output-escaping='yes' select='Description'></xsl:value-of>
						</div>
						<div class="btn-wrap">
							<a class="btn-viewmore">
								<xsl:attribute name='href'>
									<xsl:value-of select='Url'></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name='target'>
									<xsl:value-of select='Target'></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name='title'>
									<xsl:value-of select='Title'></xsl:value-of>
								</xsl:attribute>
								<xsl:value-of disable-output-escaping='yes' select='/ZoneList/ViewMoreText'>
								</xsl:value-of>
							</a>
						</div>
					</div>
					<div class="image">
						<img class='lazyload blur-up'>
						<xsl:attribute name='data-src'>
							<xsl:value-of select='ImageUrl'></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name='alt'>
							<xsl:value-of select='Title'></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name='title'>
							<xsl:value-of select='Title'></xsl:value-of>
						</xsl:attribute>
						</img>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	<xsl:template match='Zone' mode="Zone3_mobile">
		<a class="custom-option tab-link">
			<xsl:attribute name='data-tab'>
				<xsl:text>tab-</xsl:text>
				<xsl:value-of select='ZoneId'></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name='title'>
				<xsl:value-of select='Title'></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select='Title'></xsl:value-of>
		</a>
	</xsl:template>

</xsl:stylesheet>