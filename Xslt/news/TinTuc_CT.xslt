<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
	xmlns:msxsl='urn:schemas-microsoft-com:xslt' exclude-result-prefixes='msxsl'>
	<xsl:output method='html' indent='yes' />
	<xsl:template match='/'>
		<div class="news-detail" style="padding: 60px 0">
			<div class="container">
				<div class="row">
					<div class="col-lg-9">
						<h1>
							<xsl:value-of disable-output-escaping='yes' select='/NewsDetail/Title'></xsl:value-of>
							<xsl:value-of select='/NewsDetail/EditLink' disable-output-escaping='yes'></xsl:value-of>
						</h1>
						<div class="brief-content">
							<p>
								<i>
									<xsl:value-of disable-output-escaping='yes' select='/NewsDetail/BriefContent'>
									</xsl:value-of>
								</i>
							</p>
							<br />
						</div>
						<div class="full-content">
							<xsl:value-of disable-output-escaping='yes' select='/NewsDetail/FullContent'></xsl:value-of>
						</div>
						<div class="tools">
							<div class="btn-share" href="javascript:void(0)">
								<em class="mdi mdi-share-variant"></em>
								<div class="share-wrapper">
									<a target="_blank">
										<xsl:attribute name="href">
											<xsl:text>https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
											<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/FullUrl">
											</xsl:value-of>
										</xsl:attribute>
										<em class="mdi mdi-facebook"></em>
									</a>
									<a target="_blank">
										<xsl:attribute name="href">
											<xsl:text>https://twitter.com/home?status=</xsl:text>
											<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/FullUrl">
											</xsl:value-of>
										</xsl:attribute>
										<em class="mdi mdi-twitter"></em>
									</a>
								</div>
							</div>
							<a class="btn-print" href="javascript:void(0)" onclick="window.print()">
								<em class="mdi mdi-printer"></em>
							</a>
							<a class="btn-download">
								<xsl:attribute name="href">
									<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/FileUrl">
									</xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="target">
									<xsl:text>_blank</xsl:text>
								</xsl:attribute>
								<em class="mdi mdi-cloud-download"></em>
							</a>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="side-news">
							<h2>
								<xsl:value-of disable-output-escaping='yes' select='/NewsDetail/OtherNewsText'>
								</xsl:value-of>
							</h2>
							<xsl:apply-templates select='/NewsDetail/NewsOther'></xsl:apply-templates>
						</div>
						<div class="side-news">
							<h2>
								<xsl:value-of disable-output-escaping='yes' select='/NewsDetail/RelatedNewsText'>
								</xsl:value-of>
							</h2>
							<xsl:apply-templates select='/NewsDetail/NewsRelated'></xsl:apply-templates>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match='NewsOther'>
		<div class="item">
			<figure>
				<div class="img">
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
					</a>
				</div>
				<figcaption>
					<h4>
						<a style="text-decoration: none">
							<xsl:attribute name='href'>
								<xsl:value-of select='Url'></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name='target'>
								<xsl:value-of select='Target'></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name='title'>
								<xsl:value-of select='Title'></xsl:value-of>
							</xsl:attribute>
							<xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
						</a>
						<xsl:value-of select='EditLink' disable-output-escaping='yes'></xsl:value-of>
					</h4>
				</figcaption>
			</figure>
		</div>
	</xsl:template>

	<xsl:template match='NewsRelated'>
		<div class="item">
			<figure>
				<div class="img">
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
					</a>
				</div>
				<figcaption>
					<h4>
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
							<xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
						</a>
						<xsl:value-of select='EditLink' disable-output-escaping='yes'></xsl:value-of>
					</h4>
				</figcaption>
			</figure>
		</div>
	</xsl:template>
</xsl:stylesheet>