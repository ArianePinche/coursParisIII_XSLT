<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
   
   <!-- Permet de spécifier les caractéristiques de la sortie -->
    <xsl:output method="xml" encoding="UTF-8"/>

    <xsl:template match="TEI">
        <xsl:copy> <!-- Permet de copier uniquement la balise TEI -->
            <xsl:apply-templates/>  <!-- Permet d'appliquer les règles à l'intérieur de l'élément copié -->
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="teiHeader"> <!-- Permet de copier la balise teiHeader et ses enfants -->
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="text">
        <xsl:copy> <!-- Permet de copier uniquement la balise text -->
            <xsl:apply-templates/> <!-- Permet d'appliquer les règles à l'intérieur de l'élément copié -->
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="body"> <!-- Permet de copier uniquement la balise body -->
        <xsl:copy>
            <xsl:element name="div"> <!-- Permet de créer un élément dans l'élément copié -->
                <xsl:apply-templates/> <!-- Permet d'appliquer les règles à l'intérieur de l'élément div -->
            </xsl:element>
        </xsl:copy>
    </xsl:template>
        
    
<!--
    <xsl:template match="lg">
        <p type="{./@type}">
            <xsl:text>ici, il y avait une strophe</xsl:text>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
-->

    <xsl:template match="lg">
        <xsl:element name="p">
            <xsl:attribute name="type">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:attribute name="n">
                <xsl:number count="lg" format="1" level="single"/>
            </xsl:attribute>
          <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="l">
        <xsl:element name="p">
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

      
 
    <!--
    <xsl:template match="lg[@type='sizain']">
        <xsl:element name="div">
            <xsl:attribute name="type">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>     
    </xsl:template>
    <xsl:template match="lg[(@type='quatrain' or @type='tercet')]">
        <xsl:element name="div">
            <xsl:attribute name="type">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:attribute name="n">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>     
    </xsl:template>
       --> 
    




</xsl:stylesheet>
