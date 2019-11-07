<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/">
        <div class="hinhanh">
            <h2>
                <xsl:value-of disable-output-escaping="yes" select="/NewsList/ZoneTitle"></xsl:value-of>
            </h2>
            <div class="row truongthinh-items">
                <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="News">
        <div class="col-md-6">
            <a class="truongthinh-item">
                <xsl:attribute name="href">
                    <xsl:value-of select="ImageUrl"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="target">
                    <xsl:value-of select="Target"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                    <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="data-fancybox">
                    <xsl:text>gallery-</xsl:text>
                    <xsl:value-of disable-output-escaping="yes" select="NewsId"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="fancybox-gallery">
                    <xsl:text></xsl:text>
                </xsl:attribute>
                <xsl:attribute name='data-caption'>
                    <xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
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
                    <xsl:if test="count(NewsImages) &gt; 1">
                        <xsl:apply-templates select="NewsImages">
                            <xsl:with-param name="galleryId" select="NewsId"></xsl:with-param>
                        </xsl:apply-templates>
                    </xsl:if>
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
    <xsl:template match="NewsImages">
        <xsl:param name="galleryId"></xsl:param>
        <xsl:if test="position() &gt; 1">
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
                <xsl:attribute name="data-fancybox">
                    <xsl:text>gallery-</xsl:text>
                    <xsl:value-of disable-output-escaping="yes" select="$galleryId"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="data-thumb">
                    <xsl:value-of disable-output-escaping="yes" select="ImageUrl"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name='data-caption'>
                    <xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="fancybox-gallery">
                    <xsl:text></xsl:text>
                </xsl:attribute>
            </img>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>