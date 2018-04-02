<!DOCTYPE xsl:stylesheet [

    <!ENTITY ndash "&#x2013;">
    <!ENTITY amacr "&#x0101;">
    <!ENTITY imacr "&#x012B;">

]>
<xsl:transform
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">

<xsl:variable name="volume1" select="document('TCCPI-1/TCCPI-1.xml')"/>
<xsl:variable name="volume2" select="document('TCCPI-2/TCCPI-2.xml')"/>
<xsl:variable name="volume3" select="document('TCCPI-3/TCCPI-3.xml')"/>
<xsl:variable name="volume4" select="document('TCCPI-4/TCCPI-4.xml')"/>

<xsl:template match="/">
    <TEI.2 lang="en">
    <teiHeader>
        <fileDesc>
            <titleStmt>
                <title>The Tribes and Castes of the Central Provinces of India</title>
                <author key="Russell, Robert Vane" ref="https://viaf.org/viaf/76712412/">Robert Vane Russell (1873&ndash;1915)</author>
                <respStmt><resp>Contributor</resp> <name key="H&imacr;ra L&amacr;l, Rai Bahadur" ref="https://viaf.org/viaf/18557475/">Rai Bahadur H&imacr;ra L&amacr;l (1867&ndash;1934)</name></respStmt>
                <respStmt><resp>Transcription</resp> <name>Jeroen Hellingman</name></respStmt>
            </titleStmt>
            <publicationStmt>
                <publisher>Project Gutenberg</publisher>
                <pubPlace>Urbana, Illinois, USA.</pubPlace>
                <idno type="epub-id">urn:uuid:f35a9266-88fc-4abf-837a-7a94988a70d8</idno>
                <idno type="PGnum">#####</idno>
                <date>#####</date>

                <xsl:apply-templates select="$volume1//teiHeader/publicationStmt/availability"/>

            </publicationStmt>
            <sourceDesc>
                <bibl>
                <author>R.V. Russell</author>
                <title>The Tribes and Castes of the Central Provinces of India</title>
                <date>1916</date>
                </bibl>
            </sourceDesc>
        </fileDesc>

        <xsl:apply-templates select="$volume1//teiHeader/encodingDesc"/>
        <xsl:apply-templates select="$volume1//teiHeader/profileDesc"/>

        <revisionDesc>
            <list type="simple">
                <item>2011-09-12 started.</item>
            </list>
        </revisionDesc>
    </teiHeader>
    <text>
        <front id="frontmatter">
            <xsl:apply-templates select="$volume1//front"/>
        </front>
        <body>
            <xsl:apply-templates select="$volume1//body/div0"/>
            <xsl:apply-templates select="$volume2//body/div0"/>
            <xsl:apply-templates select="$volume3//body/div0"/>
            <xsl:apply-templates select="$volume4//body/div0"/>
        </body>
        <back id="backmatter">
            <divGen type="toc"/>
            <divGen type="Colophon"/>
        </back>
    </text>
    </TEI.2>
</xsl:template>


<xsl:template match="node()|@*">
    <xsl:copy>
        <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
</xsl:template>


</xsl:transform>
