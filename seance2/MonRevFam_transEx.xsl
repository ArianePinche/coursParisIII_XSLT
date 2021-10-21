<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <!--
    <xsl:template match="lg[@type='quatrain']">
        <xsl:copy-of select="."/>
    </xsl:template>
    -->
   <!--
    <xsl:template match="l[3]">
        <xsl:copy-of select="."/>
    </xsl:template>

-->
  
        <xsl:template match="lg[1]">
            <xsl:copy-of select="l[3]"/>
        </xsl:template>

   <!--
    <xsl:template match="lg[@type = 'tercet'][2]/l[3]">
        <xsl:copy-of select="."/>
    </xsl:template>
   -->
  
    <!--
    <xsl:template match="(body//l)[3]">
        <xsl:copy-of select="."/>
    </xsl:template>
   -->
    
</xsl:stylesheet>
