<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method='xml'/>

    <xsl:template name="metadata" match="questionnaire">
        <div id="metaDataContainer" class="roundedAll">
            <h2><xsl:apply-templates select="//directive/name" /> (<xsl:apply-templates select="//directive/period" />)</h2>

            <div id="colouredBand">
                <h3><xsl:apply-templates select="//memberState/name" /></h3>
            </div>
        </div>
    </xsl:template>
    

    <xsl:template match="text()">
        <xsl:call-template name="break" />
    </xsl:template>
    

    <xsl:template name="break">
        <xsl:param name="text" select="." />
        <xsl:choose>
            <xsl:when test="contains($text, '&#xa;')">
                <xsl:value-of select="substring-before($text, '&#xa;')" />
                <br />
                <xsl:call-template name="break">
                    <xsl:with-param name="text" select="substring-after($text, '&#xa;')" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$text" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>