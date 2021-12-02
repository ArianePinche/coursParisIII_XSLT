<?xml version="1.0" encoding="UTF-8"?>
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
                <!--  <xsl:value-of select="concat(.//title, ' écrit par ', .//author)"/> -->
                         
                    <!-- règle équivalente sans concat 
                    <xsl:value-of select="descendant::title"/>
                    <xsl:text> écrit par </xsl:text>
                    <xsl:value-of select="descendant::auteur"/>
                    -->
                    
                    <!-- création du titre avec replace -->
                    <xsl:value-of select="concat(replace(.//title, 'Mon', 'Un'), ' écrit par ', .//author)"/>
                    
                </h1>     
                <xsl:apply-templates select=".//body/lg"/>

                <xsl:element name="span">
                    <xsl:value-of select="concat('Ce', .//body/div/@type ,' comprend ', count(.//l), ' vers' )"/>
                    <!-- Rajouter les différentes méthodes -->                  
                </xsl:element>
            </body>
        </html>
    </xsl:template>   
    <xsl:template match="lg">
        <ul><xsl:apply-templates/></ul>    
        <!-- règles avec des conditions 
        <xsl:if test="position()=1">
       <xsl:element name="ul">
            <xsl:apply-templates/>
       </xsl:element>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="@type='sonnet'">
                <div>
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
            <xsl:when test="@type='sizain'">
                <div>
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
           <xsl:otherwise>
               <ul>
                   <xsl:apply-templates/>
               </ul>
           </xsl:otherwise>
        </xsl:choose>
         -->
    </xsl:template>   
    <xsl:template match="l">
        <xsl:element name="li">
        <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
