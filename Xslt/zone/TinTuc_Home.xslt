<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="row">
			<div class="col">
				<h2 class="tagline-home">
					<xsl:value-of select='/ZoneList/ModuleTitle'></xsl:value-of>
				</h2>
			</div>
		</div>
		<div class="tab-headers">
			<div class="tab-links">
				<xsl:apply-templates select='/ZoneList/Zone'></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>
	<xsl:template match='Zone'>
		<a class="tab-link">
			<xsl:if test="position()=1">
				<xsl:attribute name='class'>
					<xsl:text>active tab-link</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name='data-tab'>
				<xsl:text>tab-</xsl:text>
				<xsl:value-of select='position()'></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name='href'>
				<xsl:text>javascript:;</xsl:text>
			</xsl:attribute>
			<xsl:attribute name='title'>
				<xsl:value-of select='Title'></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select='Title'></xsl:value-of>
		</a>
		<!-- <a class="active tab-link" data-tab="tab-127">Tin doanh nghiệp</a>
		<a class="tab-link" data-tab="tab-128">Tin thị trường</a> -->
	</xsl:template>
</xsl:stylesheet>