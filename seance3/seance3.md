# Séance 3 : Les règles de base de XSL, théorie et pratique

---

## Numéroter automatiquement des vers

L’élément **xsl:number** est utilisé pour produire un nombre formaté dans l’arbre résultat.

L’élément possède plusieurs attributs :
- L’attribut *count* est un motif qui spécifie les nœuds à comptabiliser dans les nœuds spécifiés.
- L’attribut *level* défini le nombre de niveaux "any / multiple / single"
- L’attribut *format* permet de paramétrer le format de numérotation

```XML
<xsl:template match="mon_element_xml">
    <xsl:number count="element_a_compter" 
                level="" format=""/>
</xsl:template>
```

---

## Exercice

À l’aide des éléments vus pendant la séance, reproduire l'intégralité du fichier TEI de Verlaine en numérotant automatiquement les vers et les strophes. Essayer de proposer plusieurs formats et plusieurs types de numérotation des vers.


---

## Apply-templates et l'attribut select

```XML
<xsl:template match="mon_element_TEI">      
   <xsl:apply-templates select="sous_elements_xml"/>
</xsl:template>
```
---
## Apply-templates et l'attribut mode

« Parfois le même contenu en entrée doit apparaître plusieurs fois dans le document de sortie, formaté selon un modèle différent à chaque fois. [...] Les éléments *xsl:apply-templates* et *xsl:template* peuvent avoir un attribut mode optionnel qui associe différentes règles  à différents usages. L’attribut mode d’un élément *xsl:template* identifie dans quel mode cette règle-modèle doit être activée. Un élément *xsl:apply-templates* avec un attribut mode n’active que la règle modèle avec l’attribut mode correspondant. »
Elliotte Rusty Harold, W. Scott Means, Philippe Ensarguet[et al.], *XML en concentré*, Paris, O’Reilly, 2005, p. 171.

---

```XML
 <xsl:template match="element">
      <xsl:apply-templates mode="nom_mode"/>
</xsl:template>

<xsl:template match="sous_element" mode="nom_mode">
      Règles correspondant au mode
</xsl:template>
```

---
 ## Exercice
 
 À l’aide des éléments que nous avons vus dans les séances 2 et 3, créer un nouveau fichier XML à partir de sainteEulalie.xml. Le fichier devra contenir les éléments suivants :
- **Etape n°1**
	- Un header identique au document source
	- un body avec un titre (head)
- **Etape n°2**
	- deux groupes de lg distincts :
		- un lg @type="orig" qui donnera le contenu de la cantilène présentant le texte avec la graphie du manuscrit source.
		- un lg @type="reg" qui donnera le contenu de la cantilène organisé présentant le texte avec une graphie normalisée.

--- 
