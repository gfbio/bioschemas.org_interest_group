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
xmlns:dct="http://purl.org/dc/terms/"
exclude-result-prefixes="xsl md panxslt set">

  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:variable name="dataset_id" select="/abcd:DataSets/abcd:DataSet/abcd:DatasetGUID"></xsl:variable>
  <xsl:variable name="dataset_icon" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:IconURI"></xsl:variable>
  <xsl:variable name="dataset_access" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:DirectAccessURI"></xsl:variable>
  <xsl:variable name="dataset_coverage" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Description/abcd:Representation/abcd:Coverage"></xsl:variable>
  <xsl:variable name="dataset_title" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Description/abcd:Representation/abcd:Title"></xsl:variable>
  <xsl:variable name="dataset_details" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Description/abcd:Representation/abcd:Details"></xsl:variable>
  <xsl:variable name="dataset_url" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Description/abcd:Representation/abcd:URI"></xsl:variable>
  <xsl:variable name="dataset_owner" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Owners/abcd:Owner"></xsl:variable>
  <xsl:variable name="dataset_created" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:RevisionData/abcd:DateCreated"></xsl:variable>
  <xsl:variable name="dataset_modified" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:RevisionData/abcd:DateModified"></xsl:variable>
  <xsl:variable name="dataset_creators" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:RevisionData/abcd:Creators"></xsl:variable>
  <xsl:variable name="dataset_contributors" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:RevisionData/abcd:Contributors"></xsl:variable>
  <xsl:variable name="dataset_version_major" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Version/abcd:Major"></xsl:variable>
  <xsl:variable name="dataset_version_minor" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Version/abcd:Minor"></xsl:variable>
  <xsl:variable name="dataset_version_modifier" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Version/abcd:Modifier"></xsl:variable>
  <xsl:variable name="dataset_version_issued" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Version/abcd:DateIssued"></xsl:variable>
  <xsl:variable name="dataset_direct_access" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:DirectAccessURI"></xsl:variable>
  <xsl:variable name="dataset_citation" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:IPRStatements/abcd:Citations/abcd:Citation"></xsl:variable>
  <xsl:variable name="terms_of_use" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:IPRStatements/abcd:TermsOfUseStatements/abcd:TermsOfUse"></xsl:variable>
  <xsl:variable name="licence" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:IPRStatements/abcd:Licenses/abcd:License"></xsl:variable>
  <xsl:variable name="content_contact" select="/abcd:DataSets/abcd:DataSet/abcd:ContentContacts/abcd:ContentContact"></xsl:variable>
  <xsl:variable name="technical_contact" select="/abcd:DataSets/abcd:DataSet/abcd:TechnicalContacts/abcd:TechnicalContact"></xsl:variable>
  <xsl:variable name="scope_taxonomic" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Scope/abcd:TaxonomicTerms/abcd:TaxonomicTerm"></xsl:variable>
  <xsl:variable name="scope_geoecological" select="/abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Scope/abcd:GeoecologicalTerms/*[self::abcd:GeoecologicalTerm or self::abcd:GeoEcologicalTerm]"></xsl:variable>
  
  <xsl:variable name="unit" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit"></xsl:variable>
  <xsl:variable name="recordbasis" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:RecordBasis"></xsl:variable>

  <xsl:variable name="unit_references" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:UnitReferences"></xsl:variable>
  <xsl:variable name="source_reference" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:SourceReference"></xsl:variable>

  <xsl:variable name="gathering_agents" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:Agents/abcd:GatheringAgent"></xsl:variable>
  <xsl:variable name="kind_of_unit" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:KindOfUnit"></xsl:variable>

  <xsl:variable name="coordinates" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:SiteCoordinateSets/abcd:SiteCoordinates/abcd:CoordinatesLatLong"></xsl:variable>
  <xsl:variable name="country" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:Country/abcd:Name"></xsl:variable>
  <xsl:variable name="gathering_date" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:DateTime"></xsl:variable>
  <xsl:variable name="chronostratigraphic" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:Stratigraphy/abcd:ChronostratigraphicTerms/abcd:ChronostratigraphicTerm/abcd:Term"></xsl:variable>
  <xsl:variable name="lithostratigraphic" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:Stratigraphy/abcd:LithostratigraphicTerms/abcd:LithostratigraphicTerm/abcd:Term"></xsl:variable>
  <xsl:variable name="biostratigraphic" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:Stratigraphy/abcd:BiostratigraphicTerms/abcd:BiostratigraphicTerm/abcd:Term"></xsl:variable>
  <xsl:variable name="taxon_name" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Identifications/abcd:Identification/abcd:Result/abcd:TaxonIdentified/abcd:ScientificName/abcd:FullScientificNameString"></xsl:variable>
  <xsl:variable name="higher_taxon" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Identifications/abcd:Identification/abcd:Result/abcd:TaxonIdentified/abcd:HigherTaxa/abcd:HigherTaxon/abcd:HigherTaxonName"></xsl:variable>

  <xsl:variable name="altitude" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:Altitude"></xsl:variable>
  <xsl:variable name="biotope_measure" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:Biotope/abcd:MeasurementsOrFacts"></xsl:variable>
  <xsl:variable name="depth" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:Depth"></xsl:variable>
  <xsl:variable name="height" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:Height"></xsl:variable>
  <xsl:variable name="site_measure" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:SiteMeasurementsOrFacts"></xsl:variable>
  <xsl:variable name="unit_measure" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:MeasurementsOrFacts"></xsl:variable>

  <xsl:variable name="multimedia_object" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:MultiMediaObjects/abcd:MultiMediaObject"></xsl:variable>
  <xsl:variable name="biotope" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:Biotope"></xsl:variable>
  <xsl:variable name="project_title" select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:Project/abcd:ProjectTitle"></xsl:variable>
 


  <xsl:template match="/*">
    <jsonld>
      <xsl:attribute name="context">http://schema.org/</xsl:attribute>
      <xsl:attribute name="type">Dataset</xsl:attribute>
      <xsl:if test="$dataset_id">
        <xsl:attribute name="id"><xsl:value-of select="$dataset_id"/></xsl:attribute>
        <identifier><xsl:value-of select="$dataset_id"/></identifier>
      </xsl:if>
      <dct:conformsTo type="CreativeWork" id="https://bioschemas.org/profiles/Dataset/1.0-RELEASE"/>
      <name><xsl:value-of select="$dataset_title" /></name>
      <xsl:if test="$dataset_url">
        <url><xsl:value-of select="$dataset_url" /></url>
      </xsl:if>
      <description>
        <xsl:choose>
          <xsl:when test="$dataset_details[string-length()&gt;=50]"><xsl:value-of select="$dataset_details"/></xsl:when>
        </xsl:choose>
      </description>
      <xsl:if test="$dataset_icon">
        <xsl:if test="contains($dataset_icon, 'http')">
          <image><xsl:value-of select="$dataset_icon" /></image>
        </xsl:if>
      </xsl:if>
      <xsl:if test="$dataset_access">
        <distribution type="DataDownload">
          <xsl:choose>
            <xsl:when test="contains($dataset_access,'.zip')">
              <contentUrl><xsl:value-of select="$dataset_access" /></contentUrl>
              <encodingFormat>application/zip</encodingFormat>
            </xsl:when>
            <xsl:otherwise>
              <url><xsl:value-of select="$dataset_access" /></url>
            </xsl:otherwise>
          </xsl:choose>
        </distribution>
      </xsl:if>
      <xsl:if test="$dataset_coverage">
        <keywords><xsl:value-of select="$dataset_coverage"/></keywords>
      </xsl:if>
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
      <isAccessibleForFree xsi:type="xs:boolean">true</isAccessibleForFree>
      <size type="QuantitativeValue">
        <value xsi:type="xs:int"><xsl:value-of select="count(/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit)" /></value>
        <unitText>records</unitText>
      </size>
      <xsl:if test="$dataset_version_major">
        <version>
          <xsl:value-of select="$dataset_version_major" />
          <xsl:if test="$dataset_version_minor"><xsl:text>.</xsl:text><xsl:value-of select="$dataset_version_minor" />
            <xsl:if test="$dataset_version_modifier"><xsl:text>.</xsl:text><xsl:value-of select="$dataset_version_modifier" />
            </xsl:if>
          </xsl:if>
        </version>
      </xsl:if>
      <xsl:for-each select="$licence">
        <license>
          <xsl:attribute name="type">CreativeWork</xsl:attribute>
          <xsl:if test="./abcd:Text">
            <text><xsl:value-of select="./abcd:Text"/></text>
          </xsl:if>
          <xsl:if test="./abcd:Details">
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
          <additionalType>TermsOfUseStatement</additionalType>
          <xsl:if test="./abcd:Text">
            <text><xsl:value-of select="./abcd:Text"/></text>
          </xsl:if>
          <xsl:if test="./abcd:Details">
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

      <xsl:for-each select="$dataset_citation">
        <usageInfo>
          <xsl:attribute name="type">CreativeWork</xsl:attribute>
          <additionalType>Citation</additionalType>
          <xsl:if test="./abcd:Text">
            <text><xsl:value-of select="./abcd:Text"/></text>
          </xsl:if>
          <xsl:if test="./abcd:Details">
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


    <xsl:for-each select="$unit">
      <xsl:if test="./abcd:RecordURI">
        <about type="BioSample">
          <xsl:variable name="record_uri" select="./abcd:RecordURI"></xsl:variable>
          <xsl:variable name="source_institution_id" select="./abcd:SourceInstitutionID"/>
          <xsl:variable name="source_id" select="./abcd:SourceID"/>
          <xsl:variable name="unit_id" select="./abcd:UnitID"/>
          <xsl:variable name="triple_id">
            <xsl:choose>
              <xsl:when test="$source_institution_id and $source_id and $unit_id">
                <xsl:value-of select="concat($source_institution_id, ':', $source_id, ':', $unit_id)"/>
              </xsl:when>
              <xsl:when test="$source_institution_id and $unit_id">
                <xsl:value-of select="concat($source_institution_id, ':', $unit_id)"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$unit_id"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <identifier><xsl:value-of select="$triple_id"/></identifier>
          <url><xsl:value-of select="$record_uri"/></url>
          <xsl:if test="./abcd:UnitGUID">
            <identifier><xsl:value-of select="./abcd:UnitGUID"/></identifier>
            <xsl:if test="starts-with(./abcd:UnitGUID, 'http')">
              <url><xsl:value-of select="./abcd:UnitGUID"/></url>
            </xsl:if>
          </xsl:if>
        </about>
      </xsl:if>
    </xsl:for-each>
      
    <xsl:for-each select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit">
      <xsl:variable name="unit_locality" select="./abcd:Gathering/abcd:LocalityText"></xsl:variable>
      <xsl:variable name="unit_coordinates" select="./abcd:Gathering/abcd:SiteCoordinateSets/abcd:SiteCoordinates/abcd:CoordinatesLatLong"></xsl:variable>
      <xsl:variable name="unit_latitude" select="./abcd:Gathering/abcd:SiteCoordinateSets/abcd:SiteCoordinates/abcd:CoordinatesLatLong/abcd:LatitudeDecimal"></xsl:variable>
      <xsl:variable name="unit_longitude" select="./abcd:Gathering/abcd:SiteCoordinateSets/abcd:SiteCoordinates/abcd:CoordinatesLatLong/abcd:LongitudeDecimal"></xsl:variable>
      <xsl:variable name="unit_spatial_datum" select="./abcd:Gathering/abcd:SiteCoordinateSets/abcd:SiteCoordinates/abcd:CoordinatesLatLong/abcd:SpatialDatum"></xsl:variable>
      <xsl:variable name="unit_country" select="./abcd:Gathering/abcd:Country/abcd:Name"></xsl:variable>
      <xsl:variable name="unit_named_areas" select="./abcd:Gathering/abcd:NamedAreas/abcd:NamedArea"></xsl:variable>

      <xsl:for-each select="$unit_country[not(.=preceding::*)]">  
        <spatialCoverage type="Country">
          <name><xsl:value-of select="."/></name>
          <xsl:if test="../abcd:ISO3166Code">
            <identifier><xsl:value-of select="../abcd:ISO3166Code"/></identifier>
          </xsl:if>
        </spatialCoverage>
      </xsl:for-each>

      <xsl:for-each select="$unit_locality">
        <xsl:variable name="preceding_latitude" select="preceding::*[self::abcd:CoordinatesLatLong][1]/abcd:LatitudeDecimal"></xsl:variable>
        <xsl:variable name="preceding_longitude" select="preceding::*[self::abcd:CoordinatesLatLong][1]/abcd:LongitudeDecimal"></xsl:variable>
        <xsl:choose>
          <xsl:when test="not(.=preceding::*)">
            <spatialCoverage type="Place">
              <name><xsl:value-of select="."/></name>
              <xsl:if test="$unit_coordinates">
                <geo type="GeoCoordinates">
                  <xsl:if test="$unit_latitude">
                    <latitude xsi:type="xs:double"><xsl:value-of select="$unit_latitude"/></latitude>
                  </xsl:if>
                  <xsl:if test="$unit_longitude">
                    <longitude xsi:type="xs:double"><xsl:value-of select="$unit_longitude"/></longitude>
                  </xsl:if>
                  <xsl:if test="$unit_spatial_datum">
                    <additionalType><xsl:value-of select="$unit_spatial_datum"/></additionalType>
                  </xsl:if>
                </geo>
              </xsl:if>
            </spatialCoverage>
          </xsl:when>
          <xsl:when test=".=preceding::abcd:LocalityText">
          </xsl:when>
          <xsl:otherwise>
            <!-- TODO: Check and test any possible case -->
            <xsl:if test="not($preceding_latitude = $unit_latitude and $preceding_longitude = $unit_longitude)">
              <spatialCoverage type="Place">
                <name><xsl:value-of select="."/></name>
                <xsl:if test="$unit_coordinates">
                  <geo type="GeoCoordinates">
                    <xsl:if test="$unit_latitude">
                      <latitude xsi:type="xs:double"><xsl:value-of select="$unit_latitude"/></latitude>
                    </xsl:if>
                    <xsl:if test="$unit_longitude">
                      <longitude xsi:type="xs:double"><xsl:value-of select="$unit_longitude"/></longitude>
                    </xsl:if>
                    <xsl:if test="$unit_spatial_datum">
                      <additionalType><xsl:value-of select="$unit_spatial_datum"/></additionalType>
                    </xsl:if>
                  </geo>
                </xsl:if>
                <!-- <xsl:if test="$unit_named_areas">
                  <xsl:for-each select="$unit_named_areas">
                    <containedInPlace type="Place">
                      <name><xsl:value-of select="."/></name>
                      <xsl:if test="./abcd:AreaClass">
                        <additionalType><xsl:value-of select="./abcd:AreaClass"/></additionalType>
                      </xsl:if>
                    </containedInPlace>
                  </xsl:for-each>
                </xsl:if> -->
              </spatialCoverage>
            </xsl:if>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
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

    <!-- associatedMedia -->
    <xsl:for-each select="$multimedia_object">
      <associatedMedia type="MediaObject">
        <xsl:if test="./abcd:FileURI">
          <contentUrl><xsl:value-of select="./abcd:FileURI"/></contentUrl>
        </xsl:if>
        <xsl:if test="./abcd:ProductURI">
          <mainEntityOfPage><xsl:value-of select="./abcd:ProductURI"/></mainEntityOfPage>
        </xsl:if>
        <xsl:if test="./abcd:Format">
          <encodingFormat><xsl:value-of select="./abcd:Format"/></encodingFormat>
        </xsl:if>
        <xsl:if test="./abcd:FileSize">
          <contentSize><xsl:value-of select="./abcd:FileSize"/> kB</contentSize>
        </xsl:if>
        <xsl:if test="./abcd:Context">
          <description><xsl:value-of select="./abcd:Context"/></description>
        </xsl:if>
        <xsl:if test="./abcd:CreatedDate">
          <dateCreated type="xs:date"><xsl:value-of select="./abcd:CreatedDate"/></dateCreated>
        </xsl:if>
        <xsl:if test="./abcd:Creator">
          <creator type="Thing">
            <name><xsl:value-of select="./abcd:Creator"/></name>
          </creator>
        </xsl:if>
        <xsl:for-each select="./abcd:IPR/abcd:Licenses/abcd:License">
          <license type="CreativeWork">
            <xsl:if test="./abcd:Text">
              <name><xsl:value-of select="./abcd:Text"/></name>
            </xsl:if>
            <xsl:if test="./abcd:Details">
              <description><xsl:value-of select="./abcd:Details"/></description>
            </xsl:if>
            <xsl:if test="./abcd:URI">
              <url><xsl:value-of select="./abcd:URI"/></url>
            </xsl:if>
          </license>
        </xsl:for-each>
      </associatedMedia>
    </xsl:for-each>    
      
      <!-- Keywords -->
      <xsl:for-each select="$scope_taxonomic[not(.=preceding::*)]">  
        <keywords><xsl:value-of select="."/></keywords>
      </xsl:for-each>
      <xsl:for-each select="$scope_geoecological[not(.=preceding::*)]">  
        <keywords><xsl:value-of select="."/></keywords>
      </xsl:for-each>
      <xsl:for-each select="$chronostratigraphic[not(.=preceding::*)]">  
        <keywords><xsl:value-of select="."/></keywords>
      </xsl:for-each>
      <xsl:for-each select="$biostratigraphic[not(.=preceding::*)]">  
        <keywords><xsl:value-of select="."/></keywords>
      </xsl:for-each>
      <xsl:for-each select="$lithostratigraphic[not(.=preceding::*)]">  
        <keywords><xsl:value-of select="."/></keywords>
      </xsl:for-each>
      <xsl:for-each select="$biotope/abcd:Name[not(.=preceding::*)]">  
        <keywords><xsl:value-of select="."/></keywords>
      </xsl:for-each>
      <xsl:for-each select="$project_title[not(.=preceding::*)]">  
        <keywords><xsl:value-of select="."/></keywords>
      </xsl:for-each>
      <xsl:for-each select="$kind_of_unit[not(.=preceding::*)]">  
        <keywords><xsl:value-of select="."/></keywords>
      </xsl:for-each>


      <!-- @reverse -->
      <xsl:if test="count($unit_references/abcd:UnitReference) &gt; 0">
        <xsl:element name="reverse">
          <xsl:for-each select="$unit_references">
            <xsl:for-each select="./abcd:UnitReference[not(.=preceding::*)]">
              <citation type="CreativeWork">
                <xsl:if test="./abcd:TitleCitation">
                  <name><xsl:value-of select="./abcd:TitleCitation"/></name>
                </xsl:if>
                <xsl:if test="./abcd:CitationDetail">
                  <description><xsl:value-of select="./abcd:CitationDetail"/></description>
                </xsl:if>
                <xsl:if test="./abcd:URI">
                  <url><xsl:value-of select="./abcd:URI"/></url>
                </xsl:if>   
                <xsl:if test="./abcd:DOI">
                  <identifier><xsl:value-of select="./abcd:DOI"/></identifier>
                </xsl:if>
                <xsl:if test="./abcd:ReferenceGUID">
                  <xsl:choose>
                    <xsl:when test="starts-with(./abcd:ReferenceGUID, 'http')">
                      <identifier type="URL"><xsl:value-of select="./abcd:ReferenceGUID"/></identifier>
                    </xsl:when>
                    <xsl:otherwise>
                      <identifier><xsl:value-of select="./abcd:ReferenceGUID"/></identifier>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:if>
              </citation>
            </xsl:for-each>
          </xsl:for-each>
        </xsl:element>
      </xsl:if>

      <!-- citation -->
      <xsl:for-each select="$source_reference[not(.=preceding::*)]">  
        <citation type="CreativeWork">
          <xsl:if test="./abcd:TitleCitation">
            <name><xsl:value-of select="./abcd:TitleCitation"/></name>
          </xsl:if>
          <xsl:if test="./abcd:CitationDetail">
            <description><xsl:value-of select="./abcd:CitationDetail"/></description>
          </xsl:if>
          <xsl:if test="./abcd:URI">
            <url><xsl:value-of select="./abcd:URI"/></url>
          </xsl:if>
          <xsl:if test="./abcd:DOI">
            <identifier><xsl:value-of select="./abcd:DOI"/></identifier>
          </xsl:if>
          <xsl:if test="./abcd:ReferenceGUID">
            <xsl:choose>
              <xsl:when test="starts-with(./abcd:ReferenceGUID, 'http')">
                <identifier type="URL"><xsl:value-of select="./abcd:ReferenceGUID"/></identifier>
              </xsl:when>
              <xsl:otherwise>
                <identifier><xsl:value-of select="./abcd:ReferenceGUID"/></identifier>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
        </citation>
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
    
      <xsl:for-each select="$dataset_owner">
        <xsl:choose>        
          <xsl:when test="./abcd:Person">
            <author type="Person">
              
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
                    <email><xsl:value-of select="."/></email>
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
                  <xsl:if test="./abcd:URIs/*[self::abcd:URI or self::abcd:URL]">
                    <xsl:for-each select="./abcd:URIs/*[self::abcd:URI or self::abcd:URL]">
                      <identifier><xsl:value-of select="."/></identifier>
                    </xsl:for-each>
                  </xsl:if>
                </affiliation>
              </xsl:if>

              <!-- identifier: If affiliated organization is missing, the URL is probably a person ID -->
              <xsl:if test="not(./abcd:Organisation)">
                <xsl:for-each select="./abcd:URIs/*[self::abcd:URI or self::abcd:URL][not(.=preceding::*)]">
                  <identifier><xsl:value-of select="."/></identifier>
                </xsl:for-each>
              </xsl:if>

              <!-- jobTitle: Roles -->
              <xsl:for-each select="./abcd:Roles/abcd:Role">
                <jobTitle><xsl:value-of select="."/></jobTitle>
              </xsl:for-each>
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
                    <email><xsl:value-of select="."/></email>
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
        <xsl:choose>
          <xsl:when test="contains($dataset_contributors,',')">
            <xsl:variable name="contributors" select="tokenize($dataset_contributors,',')"/>
            <xsl:for-each select="$contributors">
              <contributor type="Person">
                <name><xsl:value-of select="."/></name>
              </contributor>
            </xsl:for-each>
          </xsl:when>
          <xsl:otherwise>
            <contributor type="Person">
              <name><xsl:value-of select="$dataset_contributors"/></name>
            </contributor>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
      <xsl:if test="$dataset_creators">
        <xsl:variable name="creators" select="tokenize($dataset_creators,',')"/>
        <xsl:for-each select="$creators">
          <creator type="Person">
            <name><xsl:value-of select="."/></name>
          </creator>
        </xsl:for-each>
      </xsl:if>

      <!-- variableMeasured -->
      <!-- Altitude -->
      <xsl:variable name="minAltitude">
        <xsl:for-each select="$altitude/abcd:MeasurementOrFactAtomised/*[(self::abcd:LowerValue or self::abcd:UpperValue) and (not(../abcd:UnitOfMeasurement) or ../abcd:UnitOfMeasurement = 'm')]">
          <xsl:sort select="." data-type="number" order="ascending"/>
          <xsl:if test="position() = 1"><xsl:value-of select="."/></xsl:if>
        </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="maxAltitude">
        <xsl:for-each select="$altitude/abcd:MeasurementOrFactAtomised/*[(self::abcd:LowerValue or self::abcd:UpperValue) and (not(../abcd:UnitOfMeasurement) or ../abcd:UnitOfMeasurement = 'm')]">
          <xsl:sort select="." data-type="number" order="descending"/>
          <xsl:if test="position() = 1"><xsl:value-of select="."/></xsl:if>
        </xsl:for-each>
      </xsl:variable>
      <xsl:if test="$altitude">
        <variableMeasured type="PropertyValue">
          <name>Elevation</name>
          <propertyID>https://schema.org/elevation</propertyID>
          <xsl:choose>
            <xsl:when test="$minAltitude = $maxAltitude">
              <value xsi:type="xs:double"><xsl:value-of select="$minAltitude"/></value>
              <unitText>m</unitText>
            </xsl:when>
            <xsl:otherwise>
              <minValue xsi:type="xs:double"><xsl:value-of select="$minAltitude"/></minValue>
              <maxValue xsi:type="xs:double"><xsl:value-of select="$maxAltitude"/></maxValue>
              <unitText>m</unitText>
            </xsl:otherwise>
          </xsl:choose>
        </variableMeasured>
      </xsl:if>

      <!-- Depth -->
      <xsl:variable name="minDepth">
        <xsl:for-each select="$depth/abcd:MeasurementOrFactAtomised/*[(self::abcd:LowerValue or self::abcd:UpperValue) and (not(../abcd:UnitOfMeasurement) or ../abcd:UnitOfMeasurement = 'm')]">
          <xsl:sort select="." data-type="number" order="ascending"/>
          <xsl:if test="position() = 1"><xsl:value-of select="."/></xsl:if>
        </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="maxDepth">
        <xsl:for-each select="$depth/abcd:MeasurementOrFactAtomised/*[(self::abcd:LowerValue or self::abcd:UpperValue) and (not(../abcd:UnitOfMeasurement) or ../abcd:UnitOfMeasurement = 'm')]">
          <xsl:sort select="." data-type="number" order="descending"/>
          <xsl:if test="position() = 1"><xsl:value-of select="."/></xsl:if>
        </xsl:for-each>
      </xsl:variable>
      <xsl:if test="$depth">
        <variableMeasured type="PropertyValue">
          <name>Depth</name>
          <propertyID>https://schema.org/depth</propertyID>
          <xsl:choose>
            <xsl:when test="$minDepth = $maxDepth">
              <value xsi:type="xs:double"><xsl:value-of select="$minDepth"/></value>
              <unitText>m</unitText>
            </xsl:when>
            <xsl:otherwise>
              <minValue xsi:type="xs:double"><xsl:value-of select="$minDepth"/></minValue>
              <maxValue xsi:type="xs:double"><xsl:value-of select="$maxDepth"/></maxValue>
              <unitText>m</unitText>
            </xsl:otherwise>
          </xsl:choose>
        </variableMeasured>
      </xsl:if>

      <!-- Biotope -->
      <!-- <xsl:variable name="parameters">
        <xsl:for-each select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:Biotope/abcd:MeasurementsOrFacts/abcd:MeasurementOrFact/abcd:MeasurementOrFactAtomised/abcd:Parameter[not(.=preceding::*)]">
          <parameter><xsl:value-of select="."/></parameter>
        </xsl:for-each>
      </xsl:variable>
      <xsl:for-each select="$parameters/parameter">
        <xsl:variable name="param" select="."/>
        <xsl:variable name="minValue">
          <xsl:for-each select="$biotope_measure/abcd:MeasurementOrFact[abcd:MeasurementOrFactAtomised/abcd:Parameter=$param]/abcd:MeasurementOrFactAtomised/*[(self::abcd:LowerValue or self::abcd:UpperValue) and number(.)]">
            <xsl:sort select="." data-type="number" order="ascending"/>
            <xsl:if test="position() = 1"><xsl:value-of select="."/></xsl:if>
          </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="maxValue">
          <xsl:for-each select="$biotope_measure/abcd:MeasurementOrFact[abcd:MeasurementOrFactAtomised/abcd:Parameter=$param]/abcd:MeasurementOrFactAtomised/*[(self::abcd:LowerValue or self::abcd:UpperValue) and number(.)]">
            <xsl:sort select="." data-type="number" order="descending"/>
            <xsl:if test="position() = 1"><xsl:value-of select="."/></xsl:if>
          </xsl:for-each>
        </xsl:variable>
        <variableMeasured type="PropertyValue">
          <name><xsl:value-of select="$param"/></name>
          <xsl:choose>
            <xsl:when test="$minValue = $maxValue">
              <value xsi:type="xs:double"><xsl:value-of select="$minValue"/></value>
            </xsl:when>
            <xsl:otherwise>
              <minValue xsi:type="xs:double"><xsl:value-of select="$minValue"/></minValue>
              <maxValue xsi:type="xs:double"><xsl:value-of select="$maxValue"/></maxValue>
            </xsl:otherwise>
          </xsl:choose>
        </variableMeasured>
      </xsl:for-each>-->

      <!-- Unit measurements -->
      <!-- <xsl:variable name="parameters">
        <xsl:for-each select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:MeasurementsOrFacts/abcd:MeasurementOrFact/abcd:MeasurementOrFactAtomised/abcd:Parameter[not(.=preceding::*)]">
          <parameter><xsl:value-of select="."/></parameter>
        </xsl:for-each>
      </xsl:variable>
      <xsl:for-each select="$parameters/parameter">
        <xsl:variable name="param" select="."/>
        <xsl:variable name="minValue">
          <xsl:for-each select="$unit_measure/abcd:MeasurementOrFact[abcd:MeasurementOrFactAtomised/abcd:Parameter=$param]/abcd:MeasurementOrFactAtomised/*[(self::abcd:LowerValue or self::abcd:UpperValue) and number(.)]">
            <xsl:sort select="." data-type="number" order="ascending"/>
            <xsl:if test="position() = 1"><xsl:value-of select="."/></xsl:if>
          </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="maxValue">
          <xsl:for-each select="$unit_measure/abcd:MeasurementOrFact[abcd:MeasurementOrFactAtomised/abcd:Parameter=$param]/abcd:MeasurementOrFactAtomised/*[(self::abcd:LowerValue or self::abcd:UpperValue) and number(.)]">
            <xsl:sort select="." data-type="number" order="descending"/>
            <xsl:if test="position() = 1"><xsl:value-of select="."/></xsl:if>
          </xsl:for-each>
        </xsl:variable>
        <variableMeasured type="PropertyValue">
          <name><xsl:value-of select="$param"/></name>
          <xsl:choose>
            <xsl:when test="$minValue = $maxValue">
              <value xsi:type="xs:double"><xsl:value-of select="$minValue"/></value>
            </xsl:when>
            <xsl:otherwise>
              <minValue xsi:type="xs:double"><xsl:value-of select="$minValue"/></minValue>
              <maxValue xsi:type="xs:double"><xsl:value-of select="$maxValue"/></maxValue>
            </xsl:otherwise>
          </xsl:choose>
        </variableMeasured>
      </xsl:for-each> -->

      <!-- Site measurements -->
      <!-- <xsl:variable name="parameters">
        <xsl:for-each select="/abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:SiteMeasurementsOrFacts/abcd:SiteMeasurementOrFact/abcd:MeasurementOrFactAtomised/abcd:Parameter[not(.=preceding::*)]">
          <parameter><xsl:value-of select="."/></parameter>
        </xsl:for-each>
      </xsl:variable>
      <xsl:for-each select="$parameters/parameter">
        <xsl:variable name="param" select="."/>
        <xsl:variable name="minValue">
          <xsl:for-each select="$site_measure/abcd:SiteMeasurementOrFact[abcd:MeasurementOrFactAtomised/abcd:Parameter=$param]/abcd:MeasurementOrFactAtomised/*[(self::abcd:LowerValue or self::abcd:UpperValue) and number(.)]">
            <xsl:sort select="." data-type="number" order="ascending"/>
            <xsl:if test="position() = 1"><xsl:value-of select="."/></xsl:if>
          </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="maxValue">
          <xsl:for-each select="$site_measure/abcd:SiteMeasurementOrFact[abcd:MeasurementOrFactAtomised/abcd:Parameter=$param]/abcd:MeasurementOrFactAtomised/*[(self::abcd:LowerValue or self::abcd:UpperValue) and number(.)]">
            <xsl:sort select="." data-type="number" order="descending"/>
            <xsl:if test="position() = 1"><xsl:value-of select="."/></xsl:if>
          </xsl:for-each>
        </xsl:variable>
        <variableMeasured type="PropertyValue">
          <name><xsl:value-of select="$param"/></name>
          <xsl:choose>
            <xsl:when test="$minValue = $maxValue">
              <value xsi:type="xs:double"><xsl:value-of select="$minValue"/></value>
            </xsl:when>
            <xsl:otherwise>
              <minValue xsi:type="xs:double"><xsl:value-of select="$minValue"/></minValue>
              <maxValue xsi:type="xs:double"><xsl:value-of select="$maxValue"/></maxValue>
            </xsl:otherwise>
          </xsl:choose>
        </variableMeasured>
      </xsl:for-each> -->
      
      <!-- After updating to XSLT 2.0, both the code below and the author mapping code can be moved to a separate function -->
      <xsl:for-each select="$gathering_agents[not(.=preceding::*)]">  
        <xsl:choose>
          <xsl:when test="./abcd:Person or ./abcd:Organisation">
            <xsl:choose>
              <xsl:when test="./abcd:Person">
                <contributor type="Person">
                  
                  <!-- name -->
                  <name><xsl:value-of select="./abcd:Person/abcd:FullName"/></name>
                  <xsl:if test="./abcd:Person/abcd:AtomisedName/abcd:InheritedName">
                    <familyName><xsl:value-of select="./abcd:Person/abcd:AtomisedName/abcd:InheritedName"/></familyName>
                  </xsl:if>
                  <xsl:if test="./abcd:Person/abcd:AtomisedName/abcd:GivenNames">
                    <givenName><xsl:value-of select="./abcd:Person/abcd:AtomisedName/abcd:GivenNames"/></givenName>
                  </xsl:if>

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
                </contributor>
              </xsl:when>

              <!-- organisation as contributor -->
              <xsl:otherwise>
                <contributor type="Organization">
                  <identifier><xsl:value-of select="./abcd:Organisation/abcd:OrganisationGUID"/></identifier>
                  <name><xsl:value-of select="./abcd:Organisation/abcd:Name/abcd:Representation/abcd:Text"/></name>
                  <xsl:if test="./abcd:Organisation/abcd:Name/abcd:Representation/abcd:Abbreviation">
                    <alternateName><xsl:value-of select="./abcd:Organisation/abcd:Name/abcd:Representation/abcd:Abbreviation"/></alternateName>
                  </xsl:if>
                </contributor>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:otherwise>
            <xsl:if test="./abcd:AgentText">
              <xsl:choose>
                <xsl:when test="contains(./abcd:AgentText,',')">
                  <xsl:for-each select="tokenize(./abcd:AgentText,',')">
                    <!-- Avoid initials as separate contributors -->
                    <xsl:if test="not(substring(normalize-space(.),2,1) = '.')">
                      <contributor type="Person">
                        <name><xsl:value-of select="."/></name>
                      </contributor>
                    </xsl:if>
                  </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                  <contributor type="Person">
                    <name><xsl:value-of select="./abcd:AgentText"/></name>
                  </contributor>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:if>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </jsonld>
  </xsl:template>
</xsl:stylesheet>
