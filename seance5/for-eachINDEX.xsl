<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <xsl:output method="html" encoding="UTF-8"/>
    
    <xsl:template match="TEI">
        <xsl:variable name="titre" select="concat(.//title[@type='main'], ' ', .//title[@type='sub'])"/>
        <html>
            <head>
                <title>
                    <xsl:value-of select="$titre"/>
                </title>
                <p>le fichier source en XML TEI est disponible sur le <a href="{.//bibl[@type='digital-source']/ref/@target}">le site Théâtre classique</a></p>
            </head>
            <body>
                <div>
                    <h1><xsl:value-of select="$titre"/></h1>
                    <h2>Écrit par <xsl:value-of select=".//author/name[@type='full']"/> (<xsl:value-of select=".//bibl[@type='performance-first']/date"/>)</h2>
                    <hr/>
                    <div>
                        <xsl:apply-templates select=".//front"/>  
                    </div>  
                    <hr/>
                    <div>
                        <xsl:apply-templates select="descendant::body"/>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="front">
        <h2>Liste des personnages</h2>
        <ul>
            <xsl:apply-templates select=".//castItem"/>
        </ul>
    </xsl:template>
    
    <xsl:template match="castItem">
        <xsl:variable name="id" select="role/@xml:id"/>
        <li>
            <xsl:value-of select="role"/>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="count(ancestor::TEI/descendant::body//sp[@who=$id])"/>
            <xsl:text> répliques) : </xsl:text>
            <xsl:for-each select="ancestor::TEI/descendant::body//sp[@who=$id]">
                <xsl:value-of select="speaker"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of select="concat(ancestor::div[@type='act']/@n, '.',ancestor::div[@type='scene']/@n)"/>
                <xsl:text>)</xsl:text>
                <xsl:choose>
                    <xsl:when test="position() = last()"/>
                    <xsl:otherwise>, </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </li>&#10;<br/>
    </xsl:template>
    
    
    <xsl:template match="div[@type='act']">
        <xsl:element name="div">
            <h2><xsl:value-of select="head"/></h2>
            <xsl:apply-templates select="div"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="div[@type='scene']">
        <xsl:element name="div">
            <hr/>
            <h3><xsl:value-of select="head"/></h3>
            <hr/>
            <xsl:apply-templates select="sp"/>	  
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sp">
        <xsl:element name="h4">
            <xsl:value-of select="speaker"/>
        </xsl:element>
        <xsl:element name="span">
            <xsl:apply-templates select="l"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="l">
        <xsl:value-of select="text()"/><br/>
    </xsl:template>
    
</xsl:stylesheet>
    
