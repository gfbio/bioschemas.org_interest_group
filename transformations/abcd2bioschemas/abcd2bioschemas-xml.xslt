<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:md="http://www.pangaea.de/MetaData" 
xmlns:xs="http://www.w3.org/2001/XMLSchema" 
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
xmlns:set="http://exslt.org/sets"
xmlns:panxslt="xalan://de.pangaea.xslt.DatasetXSLTFunctions" 
xmlns:abcd="http://www.tdwg.org/schemas/abcd/2.06" 
xmlns:efg="http://www.synthesys.info/ABCDEFG/1.0"
exclude-result-prefixes="xsl md panxslt set">

  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:variable name="dataset_id" select="/abcd:DataSets/abcd:DataSet/abcd:DatasetGUID"></xsl:variable>
  <xsl:variable name="dataset_title" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Description/abcd:Representation/abcd:Title"></xsl:variable>
  <xsl:variable name="dataset_details" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Description/abcd:Representation/abcd:Details"></xsl:variable>
  <xsl:variable name="dataset_url" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Description/abcd:Representation/abcd:URI"></xsl:variable>
  <xsl:variable name="dataset_owner" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Owners/abcd:Owner"></xsl:variable>
  <xsl:variable name="dataset_created" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:RevisionData/abcd:DateCreated"></xsl:variable>
  <xsl:variable name="dataset_modified" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:RevisionData/abcd:DateModified"></xsl:variable>
  <xsl:variable name="dataset_contributors" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:RevisionData/abcd:Contributors"></xsl:variable>
  <xsl:variable name="dataset_version_major" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Version/abcd:Major"></xsl:variable>
  <xsl:variable name="dataset_version_minor" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Version/abcd:Minor"></xsl:variable>
  <xsl:variable name="dataset_version_modifier" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Version/abcd:Modifier"></xsl:variable>
  <xsl:variable name="dataset_version_issued" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Version/abcd:DateIssued"></xsl:variable>
  <xsl:variable name="dataset_direct_access" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:DirectAccessURI"></xsl:variable>
  <xsl:variable name="ipr_statement" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:IPRStatements/abcd:Citations/abcd:Citation/abcd:Text"></xsl:variable>
  <xsl:variable name="dataset_uri" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Description/abcd:Representation/abcd:URI"></xsl:variable>
  <xsl:variable name="terms_of_use" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:IPRStatements/abcd:TermsOfUseStatements/abcd:TermsOfUse"></xsl:variable>
  <xsl:variable name="licence" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:IPRStatements/abcd:Licenses/abcd:License"></xsl:variable>
  <xsl:variable name="content_contact" select="/abcd:DataSets/abcd:DataSet/abcd:ContentContacts/abcd:ContentContact"></xsl:variable>
  <xsl:variable name="technical_contact" select="/abcd:DataSets/abcd:DataSet/abcd:TechnicalContacts/abcd:TechnicalContact"></xsl:variable>
  <xsl:variable name="scope_taxonomic" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Scope/abcd:TaxonomicTerms/abcd:TaxonomicTerm"></xsl:variable>
  <xsl:variable name="scope_geoecological" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Scope/abcd:GeoecologicalTerms/*[self::abcd:GeoecologicalTerm or self::abcd:GeoEcologicalTerm]"></xsl:variable>
  
  <xsl:variable name="recordbasis" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:RecordBasis"></xsl:variable>
  <xsl:variable name="coordinates" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:SiteCoordinateSets/abcd:SiteCoordinates/abcd:CoordinatesLatLong"></xsl:variable>
  <xsl:variable name="country" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:Country/abcd:Name"></xsl:variable>
  <xsl:variable name="gathering_date" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:DateTime"></xsl:variable>
  <xsl:variable name="chronostratigraphic" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:Stratigraphy/abcd:ChronostratigraphicTerms/abcd:ChronostratigraphicTerm/abcd:Term"></xsl:variable>
  <xsl:variable name="lithostratigraphic" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:Stratigraphy/abcd:LithostratigraphicTerms/abcd:LithostratigraphicTerm/abcd:Term"></xsl:variable>
  <xsl:variable name="biostratigraphic" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:Stratigraphy/abcd:BiostratigraphicTerms/abcd:BiostratigraphicTerm/abcd:Term"></xsl:variable>
  <xsl:variable name="taxon_name" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Identifications/abcd:Identification/abcd:Result/abcd:TaxonIdentified/abcd:ScientificName/abcd:FullScientificNameString"></xsl:variable>
  <xsl:variable name="higher_taxon" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Identifications/abcd:Identification/abcd:Result/abcd:TaxonIdentified/abcd:HigherTaxa/abcd:HigherTaxon/abcd:HigherTaxonName"></xsl:variable>
  

        

  <xsl:template match="/*">
    <jsonld>
      <xsl:attribute name="context">http://schema.org/</xsl:attribute>
      <xsl:attribute name="type">Dataset</xsl:attribute>
      <xsl:attribute name="id"><xsl:value-of select="$dataset_id"/></xsl:attribute>
      <id><xsl:value-of select="$dataset_id"/></id>
      <name><xsl:value-of select="$dataset_title" /></name>
      <xsl:if test="$dataset_url">
        <url><xsl:value-of select="$dataset_url" /></url>
      </xsl:if>
      <description>
        <!--<xsl:variable name="desc"> -->
          <xsl:choose>
            <xsl:when test="$dataset_details[string-length()&gt;=50]"><xsl:value-of select="$dataset_details"/></xsl:when>
          </xsl:choose>
       <!-- </xsl:variable>-->
      </description>
      <inLanguage>en</inLanguage>
      <xsl:for-each select="$recordbasis[not(.=preceding::*)]">  
        <additionalType><xsl:value-of select="."/></additionalType>
      </xsl:for-each>
      <xsl:if test="$dataset_created">
        <dateCreated><xsl:value-of select="substring-before($dataset_created,'T')"/></dateCreated>
      </xsl:if>
      <xsl:if test="$dataset_modified">
        <dateModified><xsl:value-of select="substring-before($dataset_modified,'T')"/></dateModified>
      </xsl:if>
      <datePublished>
        <xsl:choose>
          <xsl:when test="$dataset_version_issued">
            <xsl:value-of select="$dataset_version_issued"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="substring-before($dataset_modified,'T')"/>
          </xsl:otherwise>
        </xsl:choose>
      </datePublished>
      <distribution><xsl:value-of select="$dataset_direct_access" /></distribution>
      <isAccessibleForFree xsi:type="xs:boolean">true</isAccessibleForFree>
      <size type="QuantitativeValue">
        <value xsi:type="xs:int"><xsl:value-of select="count(/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit)" /></value>
        <unitText>records</unitText>
      </size>
      <xsl:if test="$dataset_version_major">
        <version>
          <xsl:value-of select="$dataset_version_major" />
          <xsl:if test="$dataset_version_minor"><xsl:text>.</xsl:text><xsl:value-of select="$dataset_version_major" />
            <xsl:if test="$dataset_version_modifier"><xsl:text>.</xsl:text><xsl:value-of select="$dataset_version_modifier" />
            </xsl:if>
          </xsl:if>
        </version>
      </xsl:if>
      <xsl:for-each select="$licence">
        <license>
          <xsl:attribute name="type">CreativeWork</xsl:attribute>
          <xsl:if test="./abcd:Text">
            <name><xsl:value-of select="./abcd:Text"/></name>
          </xsl:if>
          <xsl:if test="./abcd:Text">
            <description><xsl:value-of select="./abcd:Details"/></description>
          </xsl:if>
          <xsl:if test="./abcd:URI">
            <url><xsl:value-of select="./abcd:URI"/></url>
          </xsl:if>
          <xsl:if test="./abcd:URL">
            <url><xsl:value-of select="./abcd:URL"/></url>
          </xsl:if>
        </license>
      </xsl:for-each>
      
      <xsl:for-each select="$terms_of_use">
        <usageInfo>
          <xsl:attribute name="type">CreativeWork</xsl:attribute>
          <xsl:if test="./abcd:Text">
            <name><xsl:value-of select="./abcd:Text"/></name>
          </xsl:if>
          <xsl:if test="./abcd:Text">
            <description><xsl:value-of select="./abcd:Details"/></description>
          </xsl:if>
          <xsl:if test="./abcd:URI">
            <url><xsl:value-of select="./abcd:URI"/></url>
          </xsl:if>
          <xsl:if test="./abcd:URL">
            <url><xsl:value-of select="./abcd:URL"/></url>
          </xsl:if>
        </usageInfo>
      </xsl:for-each>
      
    <xsl:for-each select="$country[not(.=preceding::*)]">  
      <spatialCoverage type="Country">
        <name><xsl:value-of select="."/></name>
        <identifier><xsl:value-of select="../abcd:ISO3166Code"/></identifier>
      </spatialCoverage>
    </xsl:for-each>
      
    <!-- get bounding box coordinates or coordinate pair, if there is only one -->
    <xsl:if test="$coordinates/abcd:LatitudeDecimal and $coordinates/abcd:LongitudeDecimal">
      <spatialCoverage type="Place">
        <xsl:variable name="northBoundLatitude">
          <xsl:for-each select="$coordinates/abcd:LatitudeDecimal">
            <xsl:sort select="." data-type="number" order="descending"/>
            <xsl:if test="position() = 1"><xsl:value-of select="."/></xsl:if>
          </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="southBoundLatitude">
          <xsl:for-each select="$coordinates/abcd:LatitudeDecimal">
            <xsl:sort select="." data-type="number" order="ascending"/>
            <xsl:if test="position() = 1"><xsl:value-of select="."/></xsl:if>
          </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="eastBoundLongitude">
          <xsl:for-each select="$coordinates/abcd:LongitudeDecimal">
            <xsl:sort select="." data-type="number" order="descending"/>
            <xsl:if test="position() = 1"><xsl:value-of select="."/></xsl:if>
          </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="westBoundLongitude">
          <xsl:for-each select="$coordinates/abcd:LongitudeDecimal">
            <xsl:sort select="." data-type="number" order="ascending"/>
            <xsl:if test="position() = 1"><xsl:value-of select="."/></xsl:if>
          </xsl:for-each>
        </xsl:variable>
        
        
        <xsl:choose>        
          <xsl:when test="($westBoundLongitude=$eastBoundLongitude) and ($southBoundLatitude=$northBoundLatitude)">
            <geo type="GeoCoordinates">
              <latitude xsi:type="xs:double"><xsl:value-of select="$northBoundLatitude"/></latitude>
              <longitude xsi:type="xs:double"><xsl:value-of select="$eastBoundLongitude"/></longitude>
            </geo>
          </xsl:when>
          <xsl:otherwise>
            <geo type="GeoShape">
              <box>
                <xsl:value-of select="$southBoundLatitude"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="$westBoundLongitude"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="$northBoundLatitude"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="$eastBoundLongitude"/>
              </box>
            </geo>
          </xsl:otherwise>
        </xsl:choose>
      </spatialCoverage>
    </xsl:if>
      <xsl:if test="$gathering_date/abcd:ISODateTimeBegin or $gathering_date/abcd:ISODateTimeEnd">
        <xsl:variable name="minDateTime">
          <xsl:for-each select="$gathering_date/*[self::abcd:ISODateTimeBegin or self::abcd:ISODateTimeEnd]">
            <xsl:sort select="." data-type="text" order="ascending"/>
            <xsl:if test="position() = 1"><xsl:value-of select="."/></xsl:if>
          </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="maxDateTime">
          <xsl:for-each select="$gathering_date/*[self::abcd:ISODateTimeBegin or self::abcd:ISODateTimeEnd]">
            <xsl:sort select="." data-type="text" order="descending"/>
            <xsl:if test="position() = 1"><xsl:value-of select="."/></xsl:if>
          </xsl:for-each>
        </xsl:variable>
        <temporalCoverage>
          <xsl:value-of select="$minDateTime"/>
          <xsl:if test="$minDateTime != $maxDateTime">
            <xsl:text>/</xsl:text>
            <xsl:value-of select="$maxDateTime"/>
          </xsl:if>
        </temporalCoverage>
      </xsl:if>
      
      <!-- Keywords -->
      <xsl:for-each select="$scope_taxonomic[not(.=preceding::*)]">  
        <keyword><xsl:value-of select="."/></keyword>
      </xsl:for-each>
      <xsl:for-each select="$scope_geoecological[not(.=preceding::*)]">  
        <keyword><xsl:value-of select="."/></keyword>
      </xsl:for-each>
      <xsl:for-each select="$chronostratigraphic[not(.=preceding::*)]">  
        <keyword><xsl:value-of select="."/></keyword>
      </xsl:for-each>
      <xsl:for-each select="$biostratigraphic[not(.=preceding::*)]">  
        <keyword><xsl:value-of select="."/></keyword>
      </xsl:for-each>
      <xsl:for-each select="$lithostratigraphic[not(.=preceding::*)]">  
        <keyword><xsl:value-of select="."/></keyword>
      </xsl:for-each>
      
      <xsl:for-each select="$taxon_name[not(.=preceding::*)]">  
        <about type="Taxon">
          <name><xsl:value-of select="."/></name>
          <taxonRank><xsl:choose>        
            <xsl:when test="string-length(.)-string-length(translate(.,' ','')) >= 1">
            <xsl:text>Species</xsl:text>  
            </xsl:when>
            <xsl:otherwise><xsl:text>Genus</xsl:text></xsl:otherwise>
          </xsl:choose>
          </taxonRank>
        </about>
      </xsl:for-each>
      <xsl:for-each select="$higher_taxon[not(.=preceding::*)]">  
        <about type="Taxon">
          <name><xsl:value-of select="."/></name>
          <taxonRank><xsl:value-of select="../abcd:HigherTaxonRank"/></taxonRank>
        </about>
      </xsl:for-each>
      <xsl:for-each select="$taxon_name[not(.=preceding::*)]">  
        <about type="Taxon">
          <name><xsl:value-of select="."/></name>
          <taxonRank><xsl:choose>        
            <xsl:when test="string-length(.)-string-length(translate(.,' ','')) >= 1">
              <xsl:text>Species</xsl:text>  
            </xsl:when>
            <xsl:otherwise><xsl:text>Genus</xsl:text></xsl:otherwise>
          </xsl:choose>
          </taxonRank>
        </about>
      </xsl:for-each>
      <xsl:for-each select="$dataset_owner">
        <xsl:choose>        
          <xsl:when test="./abcd:Person">
            <author type="Person">
              <!-- identifier -->
              <xsl:if test="./abcd:URIs/*[self::abcd:URI or self::abcd:URL]">
                  <xsl:choose>        
                    <xsl:when test="./abcd:URIs/*[self::abcd:URI or self::abcd:URL][@preferred='true']">
                      <xsl:attribute name="id"><xsl:value-of select="./abcd:URIs/*[self::abcd:URI or self::abcd:URL][@preferred='true'][1]"/></xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:attribute name="id"><xsl:value-of select="./abcd:URIs/*[self::abcd:URI or self::abcd:URL][1]"/></xsl:attribute>
                    </xsl:otherwise>
                  </xsl:choose>
                <xsl:for-each select="./abcd:URIs/*[self::abcd:URI or self::abcd:URL][not(.=preceding::*)]">
                  <identifier><xsl:value-of select="."/></identifier>
                </xsl:for-each>
              </xsl:if>
              
              <!-- name -->
              <name><xsl:value-of select="./abcd:Person/abcd:FullName"/></name>
              <xsl:if test="./abcd:Person/abcd:AtomisedName/abcd:InheritedName">
                <familyName><xsl:value-of select="./abcd:Person/abcd:AtomisedName/abcd:InheritedName"/></familyName>
              </xsl:if>
              <xsl:if test="./abcd:Person/abcd:AtomisedName/abcd:GivenNames">
                <givenName><xsl:value-of select="./abcd:Person/abcd:AtomisedName/abcd:GivenNames"/></givenName>
              </xsl:if>
              
              <!-- email -->
              <xsl:choose>        
                <xsl:when test="./abcd:EmailAddresses/abcd:EmailAddress[@preferred='true']">
                  <email><xsl:value-of select="./abcd:EmailAddresses/abcd:EmailAddress[@preferred='true'][1]"/></email>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:for-each select="./abcd:EmailAddresses/abcd:EmailAddress">
                    <emai1><xsl:value-of select="."/></emai1>
                  </xsl:for-each>
                </xsl:otherwise>
              </xsl:choose>
              
              <!-- phone -->
              <xsl:choose>        
                <xsl:when test="./abcd:TelephoneNumbers/abcd:TelephoneNumber[@preferred='true']">
                  <telephone><xsl:value-of select="./abcd:TelephoneNumbers/abcd:TelephoneNumber[@preferred='true'][1]/abcd:Number"/></telephone>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:for-each select="./abcd:TelephoneNumbers/abcd:TelephoneNumber">
                    <telephone><xsl:value-of select="./abcd:Number"/></telephone>
                  </xsl:for-each>
                </xsl:otherwise>
              </xsl:choose>
              
              <!-- affiliation: Organization -->
              <xsl:if test="./abcd:Organisation">
                <affiliation type="Organization">
                  <!-- name -->
                  <name><xsl:value-of select="./abcd:Organisation/abcd:Name/abcd:Representation/abcd:Text"/></name>
                  <xsl:if test="./abcd:Organisation/abcd:Name/abcd:Representation/abcd:Abbreviation">
                    <alternateName><xsl:value-of select="./abcd:Organisation/abcd:Name/abcd:Representation/abcd:Abbreviation"/></alternateName>
                  </xsl:if>
                </affiliation>
              </xsl:if>
            </author>
          </xsl:when>
          <xsl:otherwise>
          <!-- organisation as author -->
            <author type="Organization">
              <!-- identifier -->
              <xsl:if test="./abcd:URIs/*[self::abcd:URI or self::abcd:URL]">
                <xsl:choose>        
                  <xsl:when test="./abcd:URIs/*[self::abcd:URI or self::abcd:URL][@preferred='true']">
                    <xsl:attribute name="id"><xsl:value-of select="./abcd:URIs/*[self::abcd:URI or self::abcd:URL][@preferred='true'][1]"/></xsl:attribute>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="id"><xsl:value-of select="./abcd:URIs/*[self::abcd:URI or self::abcd:URL][1]"/></xsl:attribute>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:for-each select="./abcd:URIs/*[self::abcd:URI or self::abcd:URL][not(.=preceding::*)]">
                  <identifier><xsl:value-of select="."/></identifier>
                </xsl:for-each>
              </xsl:if>
              
              <!-- name -->
              <name><xsl:value-of select="./abcd:Organisation/abcd:Name/abcd:Representation/abcd:Text"/></name>
              <xsl:if test="./abcd:Organisation/abcd:Name/abcd:Representation/abcd:Abbreviation">
                <alternateName><xsl:value-of select="./abcd:Organisation/abcd:Name/abcd:Representation/abcd:Abbreviation"/></alternateName>
              </xsl:if>
              
              <!-- email -->
              <xsl:choose>        
                <xsl:when test="./abcd:EmailAddresses/abcd:EmailAddress[@preferred='true']">
                  <email><xsl:value-of select="./abcd:EmailAddresses/abcd:EmailAddress[@preferred='true'][1]"/></email>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:for-each select="./abcd:EmailAddresses/abcd:EmailAddress">
                    <emai1><xsl:value-of select="."/></emai1>
                  </xsl:for-each>
                </xsl:otherwise>
              </xsl:choose>
              
              <!-- phone -->
              <xsl:choose>        
                <xsl:when test="./abcd:TelephoneNumbers/abcd:TelephoneNumber[@preferred='true']">
                  <telephone><xsl:value-of select="./abcd:TelephoneNumbers/abcd:TelephoneNumber[@preferred='true'][1]/abcd:Number"/></telephone>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:for-each select="./abcd:TelephoneNumbers/abcd:TelephoneNumber">
                    <telephone><xsl:value-of select="./abcd:Number"/></telephone>
                  </xsl:for-each>
                </xsl:otherwise>
              </xsl:choose>
            </author>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
      <xsl:for-each select="$technical_contact">
        <publisher type="Organization">
          <name><xsl:value-of select="./abcd:Name"/></name>
          <xsl:if test="./abcd:Email">
            <email><xsl:value-of select="./abcd:Email"/></email>
          </xsl:if>
          <xsl:if test="./abcd:Phone">
            <phone><xsl:value-of select="./abcd:Phone"/></phone>
          </xsl:if>
          <xsl:if test="./abcd:Address">
            <address><xsl:value-of select="./abcd:Address"/></address>
          </xsl:if>
        </publisher>
      </xsl:for-each>
      <xsl:for-each select="$content_contact">
        <maintainer type="Organization">
          <name><xsl:value-of select="./abcd:Name"/></name>
          <xsl:if test="./abcd:Email">
            <email><xsl:value-of select="./abcd:Email"/></email>
          </xsl:if>
          <xsl:if test="./abcd:Phone">
            <phone><xsl:value-of select="./abcd:Phone"/></phone>
          </xsl:if>
          <xsl:if test="./abcd:Address">
            <address><xsl:value-of select="./abcd:Address"/></address>
          </xsl:if>
        </maintainer>
      </xsl:for-each>
      <xsl:if test="$dataset_contributors">
        <!-- TODO, slit string by comma and repeat element -->
        <contributor type="Person">
          <name><xsl:value-of select="$dataset_contributors"/></name>
        </contributor>
      </xsl:if>
     <!-- TODO:
       - Gathering Agents as contributors?
       - variableMeasured
     -->
    </jsonld>
  </xsl:template>
</xsl:stylesheet>
