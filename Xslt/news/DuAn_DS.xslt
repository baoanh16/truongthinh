<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
    xmlns:msxsl='urn:schemas-microsoft-com:xslt' exclude-result-prefixes='msxsl'>
    <xsl:output method='html' indent='yes' />
    <xsl:template match='/'>
        <div class="duan">
            <h1>
                <xsl:value-of disable-output-escaping='yes' select='/NewsList/ZoneTitle'></xsl:value-of>
            </h1>
            <div class="row truongthinh-items">
                <xsl:apply-templates select='/NewsList/News'></xsl:apply-templates>
            </div>
        </div>
    </xsl:template>

    <xsl:template match='News'>
        <div class="col-md-6">
            <a class="truongthinh-item">
                <xsl:attribute name='href'>
                    <xsl:value-of select='Url'></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name='target'>
                    <xsl:value-of select='Target'></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name='title'>
                    <xsl:value-of select='Title'></xsl:value-of>
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
                    <p>
                        <xsl:value-of disable-output-escaping='yes' select='SubTitle'></xsl:value-of>
                    </p>
                </div>
                <div class="cover">
                    <h4>
                        <xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
                    </h4>
                    <p>
                        <xsl:value-of disable-output-escaping='yes' select='SubTitle'></xsl:value-of>
                    </p>
                </div>
            </a>
            <xsl:value-of select='EditLink' disable-output-escaping='yes'></xsl:value-of>
        </div>
    </xsl:template>
</xsl:stylesheet>