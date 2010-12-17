<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
  xmlns="http://rdfdata.eionet.europa.eu/ippc/ontology/"
  version="1.0"
>

    <xsl:output method="xml" indent="yes" encoding="utf-8" />
    <xsl:template match="text()" />

    <xsl:template match="questionnaire">
        <rdf:RDF>
            <xsl:apply-templates />
        </rdf:RDF>
    </xsl:template>

    <!-- Member State Meta Data -->
    <xsl:template match="memberState">
        <meta>
            <xsl:attribute name="rdf:about" />
            <countryName><xsl:value-of select="name" /></countryName>
            <countryCode><xsl:value-of select="countryCode" /></countryCode>
            <forCountry>
                <xsl:attribute name="rdf:resource">http://ec.europa.eu/eurostat/ramon/rdfdata/countries/<xsl:value-of select="countryCode"/></xsl:attribute>
            </forCountry>
        </meta>
    </xsl:template>

    <!-- Questions -->
    <xsl:template match="question[@id='q-1-h2']">
        <q-1-h2>
            <xsl:attribute name="rdf:about" />
            <xsl:apply-templates mode="attr" />
        </q-1-h2>
    </xsl:template>

    <!-- Create elements using @id attribute -->
    <xsl:template match="*" mode="attr">
        <xsl:choose>
            <xsl:when test="question">
                <xsl:element name="{@id}">
                    <xsl:attribute name="rdf:parseType">Resource</xsl:attribute>
                    <xsl:apply-templates mode="attr" />
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{@id}">
                    <xsl:value-of select="text()" />
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>