<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
    xmlns:msxsl='urn:schemas-microsoft-com:xslt' exclude-result-prefixes='msxsl'>
    <xsl:output method='html' indent='yes' />
    <xsl:template match='/'>
        <section class="home-4 section">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <h2 class="tagline-home">
                            <xsl:value-of disable-output-escaping='yes' select='/NewsList/ModuleTitle'></xsl:value-of>
                        </h2>
                    </div>
                </div>
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <xsl:apply-templates select='/NewsList/News'></xsl:apply-templates>
                    </div>
                </div>
                <div class="swiper-button-prev"><i class="mdi mdi-arrow-left"></i></div>
                <div class="swiper-pagination"></div>
                <div class="swiper-button-next"><i class="mdi mdi-arrow-right"></i></div>
            </div>
        </section>
    </xsl:template>

    <xsl:template match='News'>
        <div class="swiper-slide">
            <a>
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
                    <img class='lazyload' data-object-fit-cover="">
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
                <div class="caption">
                    <h2>
                        <xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
                    </h2>
                    <p>
                        <xsl:value-of disable-output-escaping='yes' select='SubTitle'></xsl:value-of>
                    </p>
                </div>
            </a>
        </div>
    </xsl:template>
</xsl:stylesheet>