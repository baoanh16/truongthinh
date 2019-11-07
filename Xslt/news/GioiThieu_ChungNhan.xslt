<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/">
        <div class="chungnhan">
            <h2>
                <xsl:value-of disable-output-escaping='yes' select='/NewsList/ZoneTitle'></xsl:value-of>
            </h2>
            <div class="row truongthinh-items">
                <xsl:apply-templates select='/NewsList/News'></xsl:apply-templates>
            </div>
        </div>
    </xsl:template>
    <xsl:template match='News'>
        <div class="col-md-6 col-xl-4">
            <a class="truongthinh-item" href="javascript:void(0)" onclick="customPopupV1(this)"
                data-src="#certificate-1">
                <xsl:attribute name='data-src'>
                    <xsl:text>#certificate-</xsl:text>
                    <xsl:value-of disable-output-escaping='yes' select='NewsId'></xsl:value-of>
                </xsl:attribute>
                <div class="img">
                    <img class='lazyload blur-up' data-object-fit-cover="">
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
                <div class="content">
                    <h3>
                        <xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
                    </h3>
                </div>
                <div class="cover">
                    <h4>
                        <xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
                    </h4>
                </div>
                <div class="popup" id="certificate-1" style="display: none">
                    <xsl:attribute name='id'>
                        <xsl:text>certificate-</xsl:text>
                        <xsl:value-of disable-output-escaping='yes' select='NewsId'></xsl:value-of>
                    </xsl:attribute>
                    <div class="popup-wrapper">
                        <div class="popup-image">
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
                        <div class="popup-content">
                            <xsl:value-of disable-output-escaping='yes' select='FullContent'></xsl:value-of>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </xsl:template>
</xsl:stylesheet>