<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
  xmlns="http://rdfdata.eionet.europa.eu/ippc-elvbat/ontology/"
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

    <!-- Installations (Category 2.2 and Category 3.1) -->
    <xsl:template match="question[@id='q-2-2'] | question[@id='q-3-1']">
        <installation>
            <xsl:attribute name="rdf:ID"><xsl:value-of select="generate-id()"/></xsl:attribute>
            <xsl:choose>
                <xsl:when test="@id='q-2-2'">
                    <installationType>Category 2.2</installationType>
                </xsl:when>
                <xsl:when test="@id='q-3-1'">
                    <installationType>Category 3.1</installationType>
                </xsl:when>
            </xsl:choose>
            <installationCode><xsl:value-of select="question[@id='q-2-2-IdentificationCode'] | question[@id='q-3-1-IdentificationCode']" /></installationCode>
            
            <xsl:apply-templates />
        </installation>
    </xsl:template>

    <!-- Installation description -->
    <xsl:template match="question[@id='q-2-2-DescriptionOfInstallation' or @id='q-3-1-DescriptionOfInstallation']">
        <xsl:element name="{@id}">
            <xsl:attribute name="rdf:parseType">Resource</xsl:attribute>
            <xsl:apply-templates mode="attr" />
        </xsl:element>
    </xsl:template>

    <!-- Installation pollutants -->
    <xsl:template match="question[@id='q-2-2-AirPollutant' or @id='q-3-1-AirPollutant' or @id='q-2-2-WaterPollutant' or @id='q-3-1-WaterPollutant']">
        <xsl:if test="contains(@id, 'AirPollutant') or contains(@id, 'WaterPollutant')">
            <pollutant>
                <xsl:attribute name="rdf:ID"><xsl:value-of select="generate-id()"/></xsl:attribute>
                <xsl:attribute name="rdf:parseType">Resource</xsl:attribute>
                <xsl:choose>
                    <xsl:when test="contains(@id, 'Air')">
                        <pollutantType>Air</pollutantType>
                    </xsl:when>
                    <xsl:when test="contains(@id, 'Water')">
                        <pollutantType>Water</pollutantType>
                    </xsl:when>
                </xsl:choose>
                <xsl:apply-templates mode="attr" />
            </pollutant>
        </xsl:if>
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