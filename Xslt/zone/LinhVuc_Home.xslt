<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
    xmlns:msxsl='urn:schemas-microsoft-com:xslt' exclude-result-prefixes='msxsl'>
    <xsl:output method='html' indent='yes' />
    <xsl:template match='/'>
        <section class="home-3 section">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <h2 class="tagline-home">
                            <xsl:value-of disable-output-escaping='yes' select='/ZoneList/ModuleTitle'></xsl:value-of>
                        </h2>
                    </div>
                </div>
                <div class="fields">
                    <xsl:apply-templates select='/ZoneList/Zone' mode="Zone1"></xsl:apply-templates>
                </div>
            </div>
        </section>
    </xsl:template>

    <xsl:template match='Zone' mode="Zone1">
        <div class="left">
            <xsl:apply-templates select='Zone' mode="left"></xsl:apply-templates>
        </div>
        <div class="center">
            <xsl:apply-templates select='Zone' mode="center"></xsl:apply-templates>
        </div>
        <div class="right">
            <xsl:apply-templates select='Zone' mode="right"></xsl:apply-templates>
        </div>
    </xsl:template>

    <xsl:template match='Zone' mode="left">
        <xsl:if test="position() mod 5 = 1 or position() mod 5 = 2">
            <a class="field">
                <xsl:attribute name='href'>
                    <xsl:value-of select='Url'></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name='target'>
                    <xsl:value-of select='Target'></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name='title'>
                    <xsl:value-of select='Title'></xsl:value-of>
                </xsl:attribute>
                <div class="box-zoom">
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
                <div class="title">
                    <h3>
                        <xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
                    </h3>
                </div>
            </a>
        </xsl:if>
    </xsl:template>
    <xsl:template match='Zone' mode="center">
        <xsl:if test="position() mod 5 = 3">
            <a class="field">
                <xsl:attribute name='href'>
                    <xsl:value-of select='Url'></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name='target'>
                    <xsl:value-of select='Target'></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name='title'>
                    <xsl:value-of select='Title'></xsl:value-of>
                </xsl:attribute>
                <div class="box-zoom">
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
                <div class="title">
                    <h3>
                        <xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
                    </h3>
                </div>
            </a>
        </xsl:if>
    </xsl:template>
    <xsl:template match='Zone' mode="right">
        <xsl:if test="position() mod 5 = 4 or position() mod 5 = 0">
            <a class="field">
                <xsl:attribute name='href'>
                    <xsl:value-of select='Url'></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name='target'>
                    <xsl:value-of select='Target'></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name='title'>
                    <xsl:value-of select='Title'></xsl:value-of>
                </xsl:attribute>
                <div class="box-zoom">
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
                <div class="title">
                    <h3>
                        <xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
                    </h3>
                </div>
            </a>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>