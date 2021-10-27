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
                    <!-- Ajouter le titre ici -->
                </h1>
                 <ul>
                    <!-- Appliquer les règles sur le texte ici -->
                  </ul>

                <xsl:element name="div">
                    <!-- Ajouter ici le texte : le sonnet comprent 14 vers -->
                </xsl:element>
            </body>
        </html>
    </xsl:template>

   

</xsl:stylesheet>
