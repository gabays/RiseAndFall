<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="text" indent="no" encoding="UTF-8"/>
    
    <xsl:variable name="xmlDocuments" select="collection('.././?select=?*.xml;recurse=yes')"/>
    
    <xsl:template match="/">
        <xsl:for-each select="$xmlDocuments">
            <xsl:if test="//term[@type='genre']='tragedy'">
                <xsl:value-of select="substring-before(tokenize(document-uri(/), '/')[last()], '.xml')"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:value-of select="//title"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:value-of select="//term[@type='genre']"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>