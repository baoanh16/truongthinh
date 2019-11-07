<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/">
        <div class="hinhanh">
            <h2>
                <xsl:value-of disable-output-escaping="yes" select="/ZoneList/ModuleTitle"></xsl:value-of>
            </h2>
            <div class="row truongthinh-items">
                <xsl:apply-templates select="/ZoneList/Zone" mode="Zone1"></xsl:apply-templates>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="Zone" mode="Zone1">
        <xsl:if test="IsActive='true'">
            <xsl:apply-templates select='Zone' mode="Zone2"></xsl:apply-templates>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Zone" mode="Zone2">
        <xsl:if test="IsActive='true'">
            <xsl:apply-templates select='Zone' mode="Zone3"></xsl:apply-templates>
        </xsl:if>
    </xsl:template>

    <xsl:template match='Zone' mode="Zone3">
        <div class="col-md-6">
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
    </xsl:template>
</xsl:stylesheet>