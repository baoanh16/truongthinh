<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
    xmlns:msxsl='urn:schemas-microsoft-com:xslt' exclude-result-prefixes='msxsl'>
    <xsl:output method='html' indent='yes' />
    <xsl:template match='/'>
        <h1>
            <xsl:value-of disable-output-escaping='yes' select='/ZoneList/ZoneTitle'></xsl:value-of>
        </h1>
        <xsl:apply-templates select='/ZoneList/Zone' mode="Zone1"></xsl:apply-templates>
    </xsl:template>

    <xsl:template match='Zone' mode="Zone1">
        <div>
            <xsl:if test="position() &gt; 1">
                <xsl:attribute name='style'>
                    <xsl:text>margin-top: 50px;</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <div class="page-title">
                <h2>
                    <xsl:value-of disable-output-escaping='yes' select='position()'></xsl:value-of>
                    <xsl:text>. </xsl:text>
                    <xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
                </h2>
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
                    <span>
                        <xsl:value-of disable-output-escaping='yes' select='/ZoneList/ViewMoreText'></xsl:value-of>
                    </span>
                    <em class="mdi mdi-arrow-right"></em>
                </a>
            </div>
            <div class="content">
                <div class="responsive-table">
                    <table class="truongthinh-table-v1">
                        <thead>
                            <tr>
                                <th>
                                    <xsl:value-of disable-output-escaping='yes' select='/ZoneList/DocumentTitleText'>
                                    </xsl:value-of>
                                </th>
                                <th>
                                    <xsl:value-of disable-output-escaping='yes' select='/ZoneList/CreatedDateText'>
                                    </xsl:value-of>
                                </th>
                                <th>
                                    <xsl:value-of disable-output-escaping='yes' select='/ZoneList/ViewText'>
                                    </xsl:value-of>
                                </th>
                                <th>
                                    <xsl:value-of disable-output-escaping='yes' select='/ZoneList/DownloadText'>
                                    </xsl:value-of>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:apply-templates select='News' mode="Desktop"></xsl:apply-templates>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="truongthinh-table-v1-mobile row">
                <xsl:apply-templates select='News' mode="Mobile"></xsl:apply-templates>
            </div>
        </div>
    </xsl:template>

    <xsl:template match='News' mode="Desktop">
        <tr>
            <td class="title">
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="FullContent"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="target">
                        <xsl:text>_blank</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                </a>
                <xsl:value-of select='EditLink' disable-output-escaping='yes'></xsl:value-of>
            </td>
            <td class="text">
                <xsl:value-of disable-output-escaping='yes' select='CreatedDate'></xsl:value-of>
            </td>
            <td class="btn-view">
                <a>
                    <xsl:attribute name='href'>
                        <xsl:value-of select='FullContent'></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name='target'>
                        <xsl:text>_blank</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name='title'>
                        <xsl:value-of select='Title'></xsl:value-of>
                    </xsl:attribute>
                    <em class="mdi mdi-file-find-outline"></em>
                </a>
            </td>
            <td class="btn-download">
                <a class="download_document" data-mimeType="pdf">
                    <xsl:attribute name='data-href'>
                        <xsl:value-of disable-output-escaping='yes' select='FullContent'></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name='data-filename'>
                        <xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
                    </xsl:attribute>
                    <em class="mdi mdi-download"></em>
                </a>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match='News' mode="Mobile">
        <div class="col-md-6">
            <div class="item">
                <h2>
                    <span class="title">
                        <xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
                    </span>
                </h2>
                <p>
                    <em class="mdi mdi-clock-start"></em>
                    <span>
                        <xsl:value-of disable-output-escaping='yes' select='/ZoneList/CreatedDateText'>
                        </xsl:value-of>
                        <xsl:text>: </xsl:text>
                        <xsl:value-of disable-output-escaping='yes' select='CreatedDate'></xsl:value-of>
                    </span>
                </p>
                <a class="btn-view" href="./file/BCTC_HN_2016.pdf" target="_blank">
                    <xsl:attribute name='href'>
                        <xsl:value-of disable-output-escaping='yes' select='FullContent'></xsl:value-of>
                    </xsl:attribute>
                    <em class="mdi mdi-file-outline"></em>
                    <span>
                        <xsl:value-of disable-output-escaping='yes' select='/ZoneList/ViewText'></xsl:value-of>
                    </span>
                </a>
                <a class="download_document btn-download" data-mimeType="pdf">
                    <xsl:attribute name='data-href'>
                        <xsl:value-of disable-output-escaping='yes' select='FullContent'></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name='data-filename'>
                        <xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
                    </xsl:attribute>
                    <em class="mdi mdi-download"></em>
                    <span>
                        <xsl:value-of disable-output-escaping='yes' select='/ZoneList/DownloadText'></xsl:value-of>
                    </span>
                </a>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>