# Transformation from ABCD 2.06 to Bioschemas.org
This repository contains files to convert ABCD XML data into Bioschemas.org JSON Metadata. The transformation will occurr in a 3 step process

1. Transform ABCD XML into an XML serialization of Bioschemas.org
	- done with the file *abcd2bioschemas-xml.xslt*
2. Perform a clustering of the taxonomic names represented by the dataset to a higher level with a managable number of names
3. Convert the process Bioschemas XML into the JSON target format.
