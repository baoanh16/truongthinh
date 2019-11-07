<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
			<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="News">
		<div class="row">
			<div class="col-xl-8">
				<h2>
					<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
				</h2>
				<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
			</div>
			<div class="col-xl-4">
				<div class="img" style="text-align: center">
					<img class="lazyload blur-up">
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
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-12">
				<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>