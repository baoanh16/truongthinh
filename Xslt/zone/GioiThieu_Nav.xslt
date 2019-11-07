<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="nav-headers">
			<xsl:apply-templates select="/ZoneList/Zone" mode="Zone1"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="Zone" mode="Zone1">
		<xsl:if test="IsActive='true'">
			<div class="nav-links">
				<xsl:apply-templates select="Zone" mode="Zone2_desktop"></xsl:apply-templates>
			</div>
			<div class="nav-links-mobile">
				<div class="custom-select">
					<div class="current-option">
						<xsl:apply-templates select="Zone" mode="Zone2_mobile_active"></xsl:apply-templates>
					</div>
					<div class="options">
						<xsl:apply-templates select="Zone" mode="Zone2_mobile"></xsl:apply-templates>
					</div>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="Zone" mode="Zone2_desktop">
		<a class="nav-link">
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>nav-link active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="href">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="target">
				<xsl:value-of select="Target"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
		</a>
	</xsl:template>
	<xsl:template match='Zone' mode="Zone2_mobile_active">
		<xsl:if test="IsActive='true'">
			<span>
				<xsl:value-of select='Title'></xsl:value-of>
			</span><em class="mdi mdi-chevron-down"></em>
		</xsl:if>
	</xsl:template>
	<xsl:template match='Zone' mode="Zone2_mobile">
		<xsl:if test="IsActive='false'">
			<a class="custom-option">
				<xsl:attribute name='href'>
					<xsl:value-of select='Url'></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name='title'>
					<xsl:value-of select='Title'></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of select='Title'></xsl:value-of>
			</a>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>