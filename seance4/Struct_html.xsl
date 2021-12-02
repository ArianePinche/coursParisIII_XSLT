﻿<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    
    
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template match="TEI">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Exercice de structuration HTML</title>
            </head>
            <body>
                <h1>
                <!--    <xsl:value-of select="concat(.//title, ' écrit par ', .//author)"/> -->
                    <!-- mettre les différentes manières -->
                    <xsl:value-of select="concat(replace(.//title, 'Mon', 'Un'), ' écrit par ', .//author)"/>
                </h1>     
                <xsl:apply-templates select=".//body//lg"/>

                <xsl:element name="div">
                    <xsl:value-of select="concat('Ce', .//body/div/@type ,' comprend ', count(.//l), ' vers' )"/>
                    <!-- Rajouter les différentes méthodes -->                  
                </xsl:element>
            </body>
        </html>
    </xsl:template>   
    <xsl:template match="lg">
        <xsl:if test="@type='quatrain'">
       <xsl:element name="ul">
            <xsl:apply-templates/>
       </xsl:element>
        </xsl:if>
    </xsl:template>   
    <xsl:template match="l">
        <xsl:element name="li">
        <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>