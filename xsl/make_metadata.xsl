<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:variable name="xmlDocuments" select="collection('../corpus/?select=?*.xml;recurse=yes')"/>
    
    <xsl:template match="/">
        <xsl:text>ID</xsl:text>
        <xsl:text>,</xsl:text>
        <xsl:text>Title</xsl:text>
        <xsl:text>,</xsl:text>
        <xsl:text>Author</xsl:text>
        <xsl:text>,</xsl:text>
        <xsl:text>Date</xsl:text>
        <xsl:text>,</xsl:text>
        <xsl:text>Genre</xsl:text>
        <xsl:text>,</xsl:text>
        <xsl:text>Form</xsl:text>
        <xsl:text>,</xsl:text>
        <xsl:text>Nb of tokens (c.)</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each select="$xmlDocuments">
           <!-- <xsl:if test="//term[@type='genre']">-->
                <xsl:text>"</xsl:text>
                <xsl:value-of select="substring-before(tokenize(document-uri(/), '/')[last()], '.xml')"/>
                <xsl:text>","</xsl:text>
                <xsl:value-of select="//titleStmt/title[1]"/>
                <xsl:text>","</xsl:text>
                <xsl:value-of select="//idno[@type='isni']"/>
                <xsl:text>","</xsl:text>
                <xsl:value-of select="//event[@type='print']/@when"/>
                <xsl:text>","</xsl:text>
                <xsl:value-of select="//term[@type='genre']"/>
                <xsl:text>","</xsl:text>
                <xsl:value-of select="//term[@type='form']"/>
                <xsl:text>","</xsl:text>
                <xsl:variable name="content" select="//TEI" />
                <xsl:value-of select="count(tokenize($content, '\s+'))"/>
                <xsl:text>"</xsl:text>
                <xsl:text>&#10;</xsl:text>
            <!--  </xsl:if>-->
        </xsl:for-each>
        
    </xsl:template>
    
</xsl:stylesheet>
