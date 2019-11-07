<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/">
        <div class="zone-nav">
            <xsl:apply-templates select="/ZoneList/Zone" mode="Zone1"></xsl:apply-templates>
        </div>
    </xsl:template>
    <xsl:template match="Zone" mode="Zone1">
        <xsl:choose>
            <xsl:when test="count(Zone) &gt; 0">
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
                    <xsl:attribute name="class">
                        <xsl:text>has-sub-1</xsl:text>
                    </xsl:attribute>
                    <xsl:if test="IsActive='true'">
                        <xsl:attribute name="class">
                            <xsl:text>has-sub-1 active</xsl:text>
                        </xsl:attribute>
                    </xsl:if>
                    <div class="parent-link-1">
                        <span>
                            <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                        </span>
                        <em class="mdi mdi-chevron-right"></em>
                    </div>
                    <div class="sub-menu-1">
                        <div class="previous-link-1">
                            <em class="mdi mdi-chevron-left"></em>
                            <span>
                                <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                            </span>
                        </div>
                        <xsl:apply-templates select="Zone" mode="Zone2"></xsl:apply-templates>
                    </div>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <a>
                    <xsl:if test="IsActive='true'">
                        <xsl:attribute name="class">
                            <xsl:text>active</xsl:text>
                        </xsl:attribute>
                    </xsl:if>
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
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="Zone" mode="Zone2">
        <xsl:choose>
            <xsl:when test="count(Zone) &gt; 1">
                <div>
                    <xsl:attribute name="class">
                        <xsl:text>has-sub-2</xsl:text>
                    </xsl:attribute>
                    <xsl:if test="IsActive='true'">
                        <xsl:attribute name="class">
                            <xsl:text>has-sub-2 active</xsl:text>
                        </xsl:attribute>
                    </xsl:if>
                    <div class="parent-link-2">
                        <div>
                            <xsl:attribute name="data-href">
                                <xsl:value-of select="Url"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:attribute name="title">
                                <xsl:value-of select="Title"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
                        </div>
                        <em class="mdi mdi-chevron-right"></em>
                    </div>
                    <div class="sub-menu-2">
                        <div class="previous-link-2">
                            <em class="mdi mdi-chevron-left"></em>
                            <span>
                                <xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
                            </span>
                        </div>
                        <xsl:apply-templates select="Zone" mode="Zone3"></xsl:apply-templates>
                    </div>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div>
                    <xsl:if test="IsActive='true'">
                        <xsl:attribute name="class">
                            <xsl:text>active</xsl:text>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:attribute name="data-href">
                        <xsl:value-of select="Url"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="Zone" mode="Zone3">
        <div>
            <xsl:if test="IsActive='true'">
                <xsl:attribute name="class">
                    <xsl:text>active</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="data-href">
                <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
                <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
        </div>
    </xsl:template>
</xsl:stylesheet>