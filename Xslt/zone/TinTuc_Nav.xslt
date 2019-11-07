<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/">
        <div class="tagline">
            <h1>
                <xsl:value-of disable-output-escaping="yes" select="/ZoneList/ModuleTitle"></xsl:value-of>
            </h1>
        </div>
        <xsl:apply-templates select="/ZoneList/Zone" mode="Zone1"></xsl:apply-templates>
    </xsl:template>
    <xsl:template match="Zone" mode="Zone1">
        <xsl:if test="IsActive='true'">
            <div class="nav-headers">
                <div class="nav-links">
                    <xsl:apply-templates select="Zone" mode="Zone2_desktop"></xsl:apply-templates>
                </div>
            </div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Zone" mode="Zone2_desktop">
        <a class="nav-link">
            <xsl:attribute name="href">
                <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="target">
                <xsl:value-of select="Target"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
                <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <xsl:if test="IsActive='true'">
                <xsl:attribute name="class">
                    <xsl:text>nav-link active</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
        </a>
    </xsl:template>
</xsl:stylesheet>