<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
  xmlns:msxsl='urn:schemas-microsoft-com:xslt' exclude-result-prefixes='msxsl'>
  <xsl:output method='html' indent='yes' />
  <xsl:template match='/'>
    <div class="banner-trangchu">
      <div class="swiper-container">
        <div class="swiper-wrapper">
          <xsl:apply-templates select='/BannerList/Banner'></xsl:apply-templates>
        </div>
        <div class="swiper-pagination"></div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match='Banner'>
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
        <div class="img" bg-img="./img/banner/banner_1.jpg" bg-img-mobile="./img/banner/m_banner_1.jpg">
          <xsl:attribute name='bg-img'>
            <xsl:value-of disable-output-escaping='yes' select='ImageUrl'></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name='bg-img-mobile'>
            <xsl:value-of disable-output-escaping='yes' select='ThumbnailUrl'></xsl:value-of>
          </xsl:attribute>
        </div>
        <div class="content">
          <div class="container">
            <xsl:value-of disable-output-escaping='yes' select='Description'></xsl:value-of>
          </div>
        </div>
      </a>
    </div>
  </xsl:template>
</xsl:stylesheet>