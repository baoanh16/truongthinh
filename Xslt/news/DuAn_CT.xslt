<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/">
        <div class="duan-ct">
            <div class="row brief-info">
                <div class="col-lg-8 project-slider">
                    <div class="project-images">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <xsl:apply-templates select="/NewsDetail/NewsImages"></xsl:apply-templates>
                            </div>
                            <div class="btn-prev">
                                <em class="mdi mdi-chevron-left"></em>
                            </div>
                            <div class="btn-next">
                                <em class="mdi mdi-chevron-right"></em>
                            </div>
                        </div>
                    </div>
                    <div class="project-thumbs">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <xsl:apply-templates select="/NewsDetail/NewsImages"></xsl:apply-templates>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <h2 class="title">
                        <xsl:value-of disable-output-escaping="yes" select="/NewsDetail/Title"></xsl:value-of>
                        <xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
                    </h2>
                    <xsl:value-of disable-output-escaping="yes" select="/NewsDetail/FullContent"></xsl:value-of>
                    <div class="separator"></div>
                    <div class="brief-content">
                        <xsl:value-of disable-output-escaping="yes" select="/NewsDetail/BriefContent"></xsl:value-of>
                    </div>
                    <div class="separator"></div>
                    <div class="tools">
                        <div class="btn-share" href="javascript:void(0)">
                            <em class="mdi mdi-share-variant"></em>
                            <div class="share-wrapper">
                                <a target="_blank">
                                    <xsl:attribute name="href">
                                        <xsl:text>https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
                                        <xsl:value-of disable-output-escaping="yes" select="/NewsDetail/FullUrl"></xsl:value-of>
                                    </xsl:attribute>
                                    <em class="mdi mdi-facebook"></em>
                                </a>
                                <a target="_blank">
                                    <xsl:attribute name="href">
                                        <xsl:text>https://twitter.com/home?status=</xsl:text>
                                        <xsl:value-of disable-output-escaping="yes" select="/NewsDetail/FullUrl"></xsl:value-of>
                                    </xsl:attribute>
                                    <em class="mdi mdi-twitter"></em>
                                </a>
                            </div>
                        </div>
                        <a class="btn-print" href="javascript:void(0)">
                            <xsl:attribute name="onclick">
                                <xsl:text>window.print()</xsl:text>
                            </xsl:attribute>
                            <em class="mdi mdi-printer"></em>
                        </a>
                        <a class="btn-download">
                            <xsl:attribute name="href">
                                <xsl:value-of select="/NewsDetail/FileUrl"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:attribute name="target">
                                <xsl:text>_blank</xsl:text>
                            </xsl:attribute>
                            <em class="mdi mdi-cloud-download"></em>
                        </a>
                    </div>
                </div>
            </div>
            <div class="other-news">
                <div class="title">
                    <h2>Dự án khác</h2>
                    <div class="buttons">
                        <div class="btn-other-prev">
                            <em class="mdi mdi-arrow-left"></em>
                        </div>
                        <div class="separator-v2"></div>
                        <div class="btn-other-next">
                            <em class="mdi mdi-arrow-right"></em>
                        </div>
                    </div>
                </div>
                <div class="swiper-container truongthinh-items">
                    <div class="swiper-wrapper">
                        <xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="NewsImages">
        <xsl:if test="position() &gt; 1">
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
        </xsl:if>
    </xsl:template>
    <xsl:template match="NewsOther">
        <div class="swiper-slide">
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
                    <p>
                        <xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
                    </p>
                </div>
                <div class="cover">
                    <h4>
                        <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                    </h4>
                    <p>
                        <xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
                    </p>
                </div>
            </a>
        </div>
    </xsl:template>
</xsl:stylesheet>