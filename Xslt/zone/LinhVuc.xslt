<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/">
        <div class="linhvuc">
            <xsl:apply-templates select="/ZoneList/Zone" mode="Zone1"></xsl:apply-templates>
        </div>
    </xsl:template>
    <xsl:template match="Zone" mode="Zone1">
        <h1>
            <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
        </h1>
        <div class="desc">
            <xsl:value-of disable-output-escaping="yes" select="Description"></xsl:value-of>
        </div>
        <div class="row items">
            <xsl:apply-templates select="Zone" mode="Zone2"></xsl:apply-templates>
        </div>
    </xsl:template>
    <xsl:template match="Zone" mode="Zone2">
        <div class="col-md-6">
            <div class="item">
                <a class="img">
                    <xsl:attribute name="href">
                        <xsl:value-of select="Url"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="target">
                        <xsl:value-of select="Target"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
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
                </a>
                <div class="content">
                    <div class="main-links">
                        <a>
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
                    </div>
                    <div class="sub-links">
                        <xsl:if test="count(Zone) &gt;1">
                            <xsl:apply-templates select="Zone" mode="Zone3"></xsl:apply-templates>
                        </xsl:if>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="Zone" mode="Zone3">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="target">
                <xsl:value-of select="Target"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
                <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <em class="mdi mdi-arrow-right"></em>
            <span>
                <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
            </span>
        </a>
    </xsl:template>
</xsl:stylesheet>