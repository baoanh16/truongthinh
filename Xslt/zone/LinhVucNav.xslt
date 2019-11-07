<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<xsl:apply-templates select="/ZoneList/Zone" mode="Zone1"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone" mode="Zone1">
		<xsl:if test="IsActive='true'">
			<xsl:apply-templates select="Zone" mode="Zone2"></xsl:apply-templates>
		</xsl:if>
	</xsl:template>
	<xsl:template match="Zone" mode="Zone2">
		<xsl:if test="IsActive='true'">
			<h1>
				<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
			</h1>
			<div class="nav-headers">
				<div class="nav-links-wrapper">
					<div class="nav-links">
						<xsl:apply-templates select="Zone" mode="Zone3_desktop1"></xsl:apply-templates>
						<xsl:if test="count(Zone) &gt; 3">
							<div class="icon">
								<em class="mdi mdi-chevron-down"></em>
							</div>
						</xsl:if>
					</div>
					<xsl:if test="count(Zone) &gt; 3">
						<div class="nav-links-dropdown">
							<xsl:apply-templates select="Zone" mode="Zone3_desktop2"></xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
				<div class="nav-links-mobile">
					<div class="custom-select">
						<div class="current-option">
							<xsl:apply-templates select="Zone" mode="Zone3_mobile_active"></xsl:apply-templates>
						</div>
						<div class="options">
							<xsl:apply-templates select="Zone" mode="Zone3_mobile"></xsl:apply-templates>
						</div>
					</div>
				</div>
			</div>
			<div class="desc">
				<xsl:value-of disable-output-escaping="yes" select="Description"></xsl:value-of>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="Zone" mode="Zone3_desktop1">
		<xsl:if test="position() &lt; 4">
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
		</xsl:if>
		<xsl:if test="position() &gt; 3">
			<a class="nav-link" style="display:none;">
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
		</xsl:if>
	</xsl:template>
	<xsl:template match="Zone" mode="Zone3_desktop2">
		<xsl:if test="position() &gt; 3">
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
		</xsl:if>
	</xsl:template>
	<xsl:template match='Zone' mode="Zone3_mobile_active">
		<xsl:if test="IsActive='true'">
			<span>
				<xsl:value-of select='Title'></xsl:value-of>
			</span><em class="mdi mdi-chevron-down"></em>
		</xsl:if>
	</xsl:template>
	<xsl:template match='Zone' mode="Zone3_mobile">
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