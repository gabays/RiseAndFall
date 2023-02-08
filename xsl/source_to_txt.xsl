<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text" indent="no" encoding="UTF-8"/>
    
    <xsl:strip-space elements="*"/>
    
    <xsl:variable name="xmlDocuments" select="collection('../corpus/?select=?*.xml;recurse=yes')"/>
    
    <xsl:template match="/">
        <xsl:for-each select="$xmlDocuments">
            <!--  <xsl:if test="//term[@type='genre']">-->
            <!-- This here for debugging purposes -->
            <xsl:variable name="nomfichier" select="substring-before(tokenize(document-uri(/), '/')[last()], '.xml')"/>
            <!--<xsl:value-of select="$nomfichier"/>-->
            <xsl:text>&#xA;</xsl:text>
            <xsl:result-document href="./txt/{$nomfichier}.txt">
                <xsl:apply-templates select="/TEI/text"/>
            </xsl:result-document>
            <!--  </xsl:if>-->
        </xsl:for-each>
        
    </xsl:template>
    
    <!-- Je supprime les informations suivantes -->
    <xsl:template match="teiHeader|castList"/>
    <!-- On retire toutes les mentions liminaires -->
    <xsl:template match="front"/>
    <!-- Et, au cas où -->
    <xsl:template match="head|lg|note|poem|rhyme|speaker|stage|docTitle|docDate|docAuthor|docImprint|printer|performance|div[@type='dedicace']"/>
    
    <!-- Only text is kept inside TEI-->
    <xsl:template match="teiHeader | bottom"/>
    <xsl:template match="text">
        <xsl:copy>
            <xsl:apply-templates select="body"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="//lg">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="text()[ancestor::l | ancestor::p]">
        <xsl:value-of 
            select="normalize-unicode(., 'nfc')"/>
    </xsl:template>
    <xsl:template match="text()[not(ancestor::l|ancestor::p)]"/>
    
    <xsl:template match="text()">
        <xsl:value-of select="lower-case(.)"/>
    </xsl:template>
    
</xsl:stylesheet>
