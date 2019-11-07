<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/">
        <div class="tuyendung">
            <div class="tagline">
                <h1>
                    <xsl:value-of disable-output-escaping="yes" select="/NewsList/ZoneTitle"></xsl:value-of>
                </h1>
                <div class="separator"></div>
            </div>
            <div class="content">
                <div class="responsive-table">
                    <table class="truongthinh-table-v1">
                        <thead>
                            <tr>
                                <th>
                                    <xsl:value-of disable-output-escaping="yes" select="/NewsList/JobTitleText">
                                    </xsl:value-of>
                                </th>
                                <th>
                                    <xsl:value-of disable-output-escaping="yes" select="/NewsList/DepartmentText">
                                    </xsl:value-of>
                                </th>
                                <th>
                                    <xsl:value-of disable-output-escaping="yes" select="/NewsList/RegionText">
                                    </xsl:value-of>
                                </th>
                                <th>
                                    <xsl:value-of disable-output-escaping="yes" select="/NewsList/StartDateText">
                                    </xsl:value-of>
                                </th>
                                <th>
                                    <xsl:value-of disable-output-escaping="yes" select="/NewsList/EndDateText">
                                    </xsl:value-of>
                                </th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:apply-templates select="/NewsList/News" mode="Desktop"></xsl:apply-templates>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="truongthinh-table-v1-mobile row">
                <xsl:apply-templates select='/NewsList/News' mode="Mobile"></xsl:apply-templates>
            </div>
        </div>
        <iframe src="#" id="ungtuyen" style="display:none">

        </iframe>

    </xsl:template>
    <xsl:template match="News" mode="Desktop">
        <tr>
            <td class="text">
                <a style="text-decoration: none;color:#333333;transition: .25s cubic-bezier(.4,0,.2,1)">
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
                <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
                <xsl:if test="floor(ShowOption div 1) mod 2 = 1">
                    <span class="hot">Hot</span>
                </xsl:if>
            </td>
            <td class="text">
                <xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
            </td>
            <td class="text">
                <xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
            </td>
            <td class="text">
                <xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
            </td>
            <td class="text">
                <xsl:value-of disable-output-escaping="yes" select="EndDate"></xsl:value-of>
            </td>
            <td class="link">
                <a href="javascript:void(0)" tuyendung-form="" data-fancybox="" data-src="#ungtuyen" class="btn-apply">
                    <xsl:attribute name="href">
                        <xsl:value-of select="Url"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="target">
                        <xsl:value-of select="Target"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="data-applyUrl">
                        <xsl:value-of select="ApplyUrl"></xsl:value-of>
                    </xsl:attribute>

                    <xsl:value-of disable-output-escaping="yes" select="/NewsList/ApplyText"></xsl:value-of>
                </a>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match='News' mode="Mobile">
        <div class="col-md-6">
            <a class="item">
                <xsl:attribute name='href'>
                    <xsl:value-of select='Url'></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name='target'>
                    <xsl:value-of select='Target'></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name='title'>
                    <xsl:value-of select='Title'></xsl:value-of>
                </xsl:attribute>
                <h2>
                    <span class="title">
                        <xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
                    </span>
                    <xsl:if test="floor(ShowOption div 1) mod 2 = 1">
                        <span class="hot">HOT</span>
                    </xsl:if>
                </h2>
                <p>
                    <em class="mdi mdi-account-group"></em>
                    <span>
                        <xsl:value-of disable-output-escaping='yes' select='SubTitle'></xsl:value-of>
                    </span>
                </p>
                <p>
                    <em class="mdi mdi-map-marker"></em>
                    <span>
                        <xsl:value-of disable-output-escaping='yes' select='BriefContent'></xsl:value-of>
                    </span>
                </p>
                <p>
                    <em class="mdi mdi-clock-start"></em>
                    <span>
                        <xsl:value-of disable-output-escaping='yes' select='/NewsList/StartDateText'></xsl:value-of>
                        <xsl:text>: </xsl:text>
                        <xsl:value-of disable-output-escaping='yes' select='CreatedDate'></xsl:value-of>
                    </span>
                </p>
                <p>
                    <em class="mdi mdi-clock-end"></em>
                    <span>
                        <xsl:value-of disable-output-escaping='yes' select='/NewsList/EndDateText'></xsl:value-of>
                        <xsl:text>: </xsl:text>
                        <xsl:value-of disable-output-escaping='yes' select='EndDate'></xsl:value-of>
                    </span>
                </p>
                <div class="btn-apply" tuyendung-form="" data-fancybox="" data-src="#ungtuyen">
                    <xsl:attribute name="data-applyUrl">
                        <xsl:value-of select="ApplyUrl"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:value-of disable-output-escaping="yes" select="/NewsList/ApplyText"></xsl:value-of>
                </div>
				<div class="btn-view">Xem chi tiết</div>
            </a>
        </div>
    </xsl:template>
</xsl:stylesheet>
